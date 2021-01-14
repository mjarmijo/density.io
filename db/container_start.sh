#!/bin/bash

docker run --name sql -d -t -v `pwd`:/db sql:latest

#docker run -d \
#--name postgres \
#-p 5432:5432 \
#-e POSTGRES_USER=postgres \
#-e POSTGRES_PASSWORD=password \
#-e POSTGRES_DB=mydb \
#-v /home/mjarmijo/git/density.io/volumes/postgres:/var/lib/postgresql/data \
#postgres:13.1


#docker run -d -t \
#--name selenium_scraper \
#--mount source=images,destination=/images \
#img_scraper:latest

#docker logs container-name
