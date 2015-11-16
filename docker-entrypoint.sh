#!/bin/bash

# setup admin account
[ ! -f /etc/couchdb/.local_admin_created ] && [ "$ADMIN_USERNAME" ] && [ "$ADMIN_PASSWORD" ] && \
    sed -i -r 's/;admin = mysecretpassword/'$ADMIN_USERNAME' = '$ADMIN_PASSWORD'/' /etc/couchdb/local.ini && \
    touch /etc/couchdb/.local_admin_created &&
    echo "Apache CouchDB admin account succesfully created"

# run CouchDB server
couchdb
