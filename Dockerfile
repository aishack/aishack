FROM ubuntu:18.04
ARG sha1=sha1
ENV sha1=$sha1

# Install dependencies
RUN apt-get update --fix-missing && apt-get install -y \
    build-essential \
    python3 \
    python3-pip \
    python3-dev \
    libjpeg-dev \
    libz-dev \
    wget \
    vim \
    nginx \
    openjdk-8-jre \
    supervisor \
    redis-server \
    sqlite3 \
    texlive-latex-base \
    dvipng \
    gcc-4.8 \
    uwsgi-plugin-python3 \
    varnish

# Setup elasticsearch
RUN cd /tmp/ && wget https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.3.0/elasticsearch-2.3.0.deb && dpkg -i /tmp/elasticsearch-2.3.0.deb && rm /tmp/elasticsearch-2.3.0.deb && mkdir /usr/share/elasticsearch/config/

RUN mkdir /work/aishack/ -p
COPY requirements.txt manage.py varnish.vcl aishack_uwsgi.ini uwsgi_params /work/aishack/

# Setup dependencies.
RUN pip3 install -r /work/aishack/requirements.txt

# Copy the custom Markdown extensions
# TODO No pip packages exist for this. Fix this when they do!
COPY 3rdparty/markdown/extensions /usr/local/lib/python3.6/dist-packages/markdown/extensions

# Copy server stuff
COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY ./elasticsearch/elasticsearch.yml /usr/share/elasticsearch/config/
RUN cd /etc/nginx/sites-enabled && ln -s /etc/nginx/sites-available/aishack.conf

# Copy site contents.
COPY templates/ /work/aishack/templates
COPY categories/ /work/aishack/categories
COPY tracks/ /work/aishack/tracks/
COPY writers/ /work/aishack/writers

COPY tutorials/ /work/aishack/tutorials
COPY aishack/ /work/aishack/aishack

# Ingest content into the database!
RUN supervisord && \
  cd /work/aishack/ && \
  python3 manage.py migrate --run-syncdb && \
  python3 manage.py ingest_category categories/* && \
  python3 manage.py ingest_user writers/* && \
  python3 manage.py ingest_track tracks/* && \
  python3 manage.py ingest_tutorial tutorials/*.md && \
  python3 manage.py ingest_tutorial tutorials/software/*.md \
  python3 manage.py rebuild_index && \
  python3 manage.py update_related_tutorials && \
  python3 manage.py update_index

# Launch.
CMD ["supervisord", "-n"]
EXPOSE 8000
