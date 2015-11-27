#!/bin/bash

# setup admin account
[ ! -f /etc/couchdb/.local_admin_created ] && [ "$ADMIN_USERNAME" ] && [ "$ADMIN_PASSWORD" ] && \
    sed -i -r 's/;admin = mysecretpassword/'$ADMIN_USERNAME' = '$ADMIN_PASSWORD'/' /etc/couchdb/local.ini && \
    touch /etc/couchdb/.local_admin_created &&
    echo "Apache CouchDB admin account succesfully created"

# setup default compactions
[ ! -f /etc/couchdb/.local_compactions_setup ] && [ "$COMPACTIONS_DEFAULT" ] && \
    echo -e '\n[compactions]\n_default = '$COMPACTIONS_DEFAULT'\n' >> /etc/couchdb/local.ini && \
    touch /etc/couchdb/.local_compactions_setup &&
    echo "Apache CouchDB compactions succesfully set up"

# run CouchDB server
couchdb
