dumpdb:
	sqlite3 db.sqlite3 .dump > db.sql

requirements:
	pip freeze > requirements.txt

installrequirements:
	pip install -r ./requirements.txt

installsoftware:
	wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.2.noarch.rpm -O /tmp/elasticsearch.rpm
	sudo yum localinstall /tmp/elasticsearch.rpm

installextras:
	cp aishack/extras/* env/ -rvL
