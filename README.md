
## CouchDB

CouchDB 1.6.1 based on [klaemo/couchdb](https://hub.docker.com/r/klaemo/couchdb/) image

### configuration

* address `0.0.0.0`, port `5984`
* user `admin`, password `admin`
* persisted directories
    * database files `./lib`
    * configuration files `./etc`
* max document size `16MB`
* sign-out after `60` minutes

### run

* docker-compose up
* open http://localhost:5984/_utils/
