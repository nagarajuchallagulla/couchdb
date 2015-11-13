FROM ubuntu:trusty

MAINTAINER tomas.bouda@topmonks.com

## install packages

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update -y \
    && apt-get install -y software-properties-common \
    && add-apt-repository ppa:couchdb/stable -y \
    && apt-get update -y \
    && apt-get install -y \
        curl \
        couchdb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists

# CouchDB setup

RUN mkdir /var/run/couchdb \
    && sed -i -r 's/;bind_address = 127.0.0.1/bind_address = 0.0.0.0/' /etc/couchdb/local.ini

# docker image setup

ADD docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 5984

VOLUME ["/var/lib/couchdb"]

ENTRYPOINT ["/docker-entrypoint.sh"]
