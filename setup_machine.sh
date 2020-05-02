#!/usr/bin/env bash

# Setup core dependencies
sudo apt-get apt-get install -y build-essential python3 python3-pip python3-dev libjpeg-dev libz-dev wget vim nginx openjdk-8-jre supervisor redis-server sqlite3 texlive-latex-base dvipng gcc-4.8 varnish

# Setup elasticsearch
cd /tmp/
ES_PATH=https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.3.0/elasticsearch-2.3.0.deb
wget $ES_PATH
dpkg -i /tmp/elasticsearch-2.3.0.deb
rm /tmp/elasticsearch-2.3.0.deb 
mkdir /usr/share/elasticsearch/config/
cp /work/aishack/elasticsearch/elasticsearch.yml /usr/share/elasticsearch/config/

systemctl disable redis-server
systemctl disable varnish
systemctl disable elasticsearch
