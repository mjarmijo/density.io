#FROM postgres:13.1    
#COPY schema.sql /docker-entrypoint-initdb.d/

#FROM ubuntu:trusty
FROM ubuntu:20.04
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y sqlite3 libsqlite3-dev
RUN mkdir /db
RUN /usr/bin/sqlite3 /db/test.db
CMD /bin/bash

#sqlite3 database.db < schema.sql

    #image: "postgres" # use latest official postgres version
    #environment:
    #  - POSTGRES_USER=root
    #  - POSTGRES_PASSWORD=root
    #  - POSTGRES_DB=database
    #ports:
    #  - 5432:5432
    #volumes:
    #  - ./database-data:/var/lib/postgresql/data/ # persist data even if container shuts down
#

