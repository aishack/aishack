FROM ubuntu:14.04

# Install dependencies
RUN apt-get upgrade -y && apt-get update
RUN apt-get update --fix-missing
RUN apt-get install -y python python-pip python-dev libjpeg-dev libz-dev wget vim nginx openjdk-7-jre supervisor redis-server sqlite3 texlive-latex-base dvipng
RUN mkdir /work/aishack/ -p

# Setup dependencies
COPY requirements.txt /work/aishack/
RUN pip install -r /work/aishack/requirements.txt
RUN pip install uwsgi

COPY aishack/ /work/aishack/aishack
COPY templates/ /work/aishack/templates
COPY categories/ /work/aishack/categories
COPY tracks/ /work/aishack/tracks/
COPY tutorials/ /work/aishack/tutorials
COPY writers/ /work/aishack/writers
COPY aishack_uwsgi.ini /work/aishack/

# Run migrations
COPY manage.py /work/aishack/
RUN cd /work/aishack && python manage.py migrate

# Setup supervisord
COPY supervisord.conf /etc/supervisor/supervisord.conf

# Setup nginx
COPY nginx.conf /etc/nginx/sites-available/aishack.conf
RUN cd /etc/nginx/sites-enabled && ln -s /etc/nginx/sites-available/aishack.conf

COPY nginx.conf /etc/nginx/nginx.conf
COPY uwsgi_params /work/aishack/

COPY name-that-dataset/ /work/aishack/name-that-dataset/

# Copy the custom Markdown extensions
# TODO No pip packages exist for this. Fix this when they do!
COPY 3rdparty/markdown/extensions/mdx_grid_table.py /usr/local/lib/python2.7/dist-packages/markdown/extensions
COPY 3rdparty/markdown/extensions/mdx_custom_span_class.py /usr/local/lib/python2.7/dist-packages/markdown/extensions
COPY 3rdparty/markdown/extensions/captions.py /usr/local/lib/python2.7/dist-packages/markdown/extensions
COPY 3rdparty/markdown/extensions/latex.py /usr/local/lib/python2.7/dist-packages/markdown/extensions

# Ingest content into the database!
RUN cd /work/aishack/ && python manage.py ingest_category categories/* && python manage.py ingest_user writers/* && python manage.py ingest_track tracks/* && python manage.py ingest_tutorial tutorials/*

# Setup elasticsearch
RUN cd /tmp/ && wget https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.3.0/elasticsearch-2.3.0.deb && dpkg -i /tmp/elasticsearch-2.3.0.deb && rm /tmp/elasticsearch-2.3.0.deb && mkdir /usr/share/elasticsearch/config/
COPY ./elasticsearch/elasticsearch.yml /usr/share/elasticsearch/config/
RUN supervisord && sleep 20 && cd /work/aishack/ && python manage.py rebuild_index --noinput

# Import user data into the database
COPY ./sourcer ./db.new.sql /work/aishack/
RUN cd /work/aishack/ && /bin/bash sourcer

CMD supervisord -n

# Weather port
EXPOSE 8000
