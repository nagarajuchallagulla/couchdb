## CouchDB - hit & run
Debian:jessie docker image with CouchDB 1.6.1 based on [https://hub.docker.com/r/klaemo/couchdb/][1] image

Docker compose file is configured to
* use default port **5984**
* create user **admin** with password **admin** 
* persist database files into **./var/lib**
* persist log files into **./var/log**
* use configuration file from **./var/etc**
* daily auto-compactions

Hit & run
* docker-compose up
* open http://192.168.99.100:5984/\_utils/

[1]:	https://hub.docker.com/r/klaemo/couchdb/ "klaemo/couchdb"