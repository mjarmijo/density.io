#!/bin/bash

docker run -d -t \
--name density \
-v /home/mjarmijo/git/density.io/volumes:/app/volumes \
density:latest

#docker run -d -t \
#--name selenium_scraper \
#--mount source=images,destination=/images \
#img_scraper:latest