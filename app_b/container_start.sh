#!/bin/bash

docker run -d -t \
--name density_app_b \
-p 5001:5001 \
-v /home/mjarmijo/git/density.io/volumes:/app/app_b \
density_app_b:latest 
