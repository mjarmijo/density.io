#!/bin/bash

docker run -d -t \
--name compose_app_a \
-p 5000:5000 \
-v /home/mjarmijo/git/density.io/volumes:/app/app_a \
compose_app_a:latest 


#docker run -d -t \
#--name selenium_scraper \
#--mount source=images,destination=/images \
#img_scraper:latest