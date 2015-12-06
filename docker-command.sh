#!/bin/bash

SHARED=/usr/local/var/etc/couchdb/
COUCHDB=/usr/local/etc/couchdb/

# recover configuration

[ -f $SHARED/local.ini ] && [[ $(diff $SHARED/local.ini $COUCHDB/local.ini) ]] && \
    cp $SHARED/local.ini $COUCHDB/local.ini && echo "Apache CouchDB configuration succesfully set up"

# run CouchDB server

couchdb
