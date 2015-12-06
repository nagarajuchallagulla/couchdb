FROM klaemo/couchdb:1.6.1

MAINTAINER tomas.bouda@topmonks.com

# custom setup

ADD docker-command.sh /docker-command.sh
RUN chmod +x /docker-command.sh

CMD ["/docker-command.sh"]
