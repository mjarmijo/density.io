#!/bin/bash

docker run -d -t \
--name compose_app_b \
-p 5001:5001 \
-v /home/mjarmijo/git/density.io/volumes:/app/app_b \
compose_app_b:latest 


#docker run -d -t \
#--name selenium_scraper \
#--mount source=images,destination=/images \
#img_scraper:latest