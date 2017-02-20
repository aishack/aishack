FROM ubuntu:14.04

# Install dependencies
RUN apt-get upgrade -y && apt-get update
RUN apt-get update --fix-missing
RUN apt-get install -y python python-pip python-dev libjpeg-dev libz-dev wget vim nginx openjdk-7-jre supervisor redis-server sqlite3 texlive-latex-base dvipng
RUN apt-get install -y varnish
RUN mkdir /work/aishack/ -p

# Setup dependencies
COPY requirements.txt /work/aishack/
RUN pip install -r /work/aishack/requirements.txt
RUN pip install uwsgi

COPY aishack/ /work/aishack/aishack
COPY templates/ /work/aishack/templates
COPY categories/ /work/aishack/categories
COPY tracks/ /work/aishack/tracks/
COPY writers/ /work/aishack/writers
COPY name-that-dataset/ /work/aishack/name-that-dataset/

# Copy server stuff
COPY nginx.conf /etc/nginx/nginx.conf
COPY aishack_uwsgi.ini /work/aishack/
COPY uwsgi_params /work/aishack/
COPY supervisord.conf /etc/supervisor/supervisord.conf

# Setup nginx
COPY nginx.conf /etc/nginx/sites-available/aishack.conf
RUN cd /etc/nginx/sites-enabled && ln -s /etc/nginx/sites-available/aishack.conf

# Run migrations
COPY manage.py /work/aishack/
RUN cd /work/aishack && python manage.py migrate

# Copy the custom Markdown extensions
# TODO No pip packages exist for this. Fix this when they do!
COPY 3rdparty/markdown/extensions/mdx_grid_table.py /usr/local/lib/python2.7/dist-packages/markdown/extensions
COPY 3rdparty/markdown/extensions/mdx_custom_span_class.py /usr/local/lib/python2.7/dist-packages/markdown/extensions
COPY 3rdparty/markdown/extensions/captions.py /usr/local/lib/python2.7/dist-packages/markdown/extensions
COPY 3rdparty/markdown/extensions/latex.py /usr/local/lib/python2.7/dist-packages/markdown/extensions
COPY 3rdparty/markdown/extensions/mdx_showable.py /usr/local/lib/python2.7/dist-packages/markdown/extensions

# Ingest content into the database!
COPY tutorials/ /work/aishack/tutorials
RUN cd /work/aishack/ && python manage.py ingest_category categories/* && python manage.py ingest_user writers/* && python manage.py ingest_track tracks/* && python manage.py ingest_tutorial tutorials/*.md && python manage.py ingest_tutorial tutorials/software/*.md

# Setup elasticsearch
RUN cd /tmp/ && wget https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.3.0/elasticsearch-2.3.0.deb && dpkg -i /tmp/elasticsearch-2.3.0.deb && rm /tmp/elasticsearch-2.3.0.deb && mkdir /usr/share/elasticsearch/config/
COPY ./elasticsearch/elasticsearch.yml /usr/share/elasticsearch/config/
RUN supervisord && sleep 20 && cd /work/aishack/ && python manage.py rebuild_index --noinput && python manage.py update_related_tutorials

COPY varnish.vcl /work/aishack/

CMD supervisord -n

# Weather port
EXPOSE 8000
