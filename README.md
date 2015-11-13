## CouchDB - hit & run
_Ubuntu:trusty_ based docker image with CouchDB 1.6.1.

Docker compose file is configured to
* use default port **5984** 
* create user **admin** with password **admin** 
* persist database files into **./data** directory

Hit & run
* docker-compose up
* open http://192.168.99.100:5984/\_utils/
