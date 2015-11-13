#!/bin/bash

# setup admin account
[ "$ADMIN_USERNAME" ] && [ "$ADMIN_PASSWORD" ] && \
    sed -i -r 's/;admin = mysecretpassword/'$ADMIN_USERNAME' = '$ADMIN_PASSWORD'/' /etc/couchdb/local.ini

# run CouchDB server
couchdb
