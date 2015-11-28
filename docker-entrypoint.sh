#!/bin/bash

# setup admin account
[ ! -f /etc/couchdb/.local_ini_configured ] && [ "$ADMIN_USERNAME" ] && [ "$ADMIN_PASSWORD" ] && \
    sed -i -r 's/;admin = mysecretpassword/'$ADMIN_USERNAME' = '$ADMIN_PASSWORD'/' /etc/couchdb/local.ini && \
    echo "Apache CouchDB admin account succesfully created"

# setup configuration (delayed_commits, compations)
[ ! -f /etc/couchdb/.local_ini_configured ] && \
    sed -i -r 's/\[couchdb\]/\[couchdb\]\ndelayed_commits = false/' /etc/couchdb/local.ini && \
    echo -e '\n[compactions]\n_default = [{db_fragmentation, "50%"}, {view_fragmentation, "60%"}, {from, "21:00"}, {to, "22:59"}]\n' >> /etc/couchdb/local.ini && \
    echo "Apache CouchDB configuration succesfully set up"

touch /etc/couchdb/.local_ini_configured

# run CouchDB server
couchdb
