#!/bin/bash

docker run -d -t \
--name density_app_a \
-p 5000:5000 \
-v /home/mjarmijo/git/density.io/volumes:/app/app_a \
density_app_a:latest 
