#!/bin/bash

SHARED=/usr/local/var/etc/couchdb/
COUCHDB=/usr/local/etc/couchdb/

# configuration

[ -f $SHARED/local.ini ] && [[ $(diff $SHARED/local.ini $COUCHDB/local.ini) ]] && \
    cp $SHARED/local.ini $COUCHDB/local.ini && \
    echo "Apache CouchDB => configuration successfully set up"

[ "$ADMIN_USER" ] && [ "$ADMIN_PASSWORD" ] && \
    sed -i -r 's/;admin = mysecretpassword/'$ADMIN_USER' = '$ADMIN_PASSWORD'/' $COUCHDB/local.ini && \
    echo "Apache CouchDB => admin account successfully created"

# run CouchDB server

couchdb
