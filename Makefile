dumpdb:
	sqlite3 db.sqlite3 .dump > db.sql

requirements:
	pip freeze > requirements.txt
