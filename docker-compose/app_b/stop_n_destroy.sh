#!/bin/bash
echo -e "RUNNING THE DOCKER CONTAINER AND IMAGE STOP AND DESTROY SCRIPT\n"
echo -e "#######################\n"
echo "**Stopping containers..."
docker ps -a
echo ""
echo "### ARE YOU SURE YOU WANT TO PROCEED WTIH DESTROYING THESE CONTAINERS? (y/n) ###"
read response

if [[ $response == "y" ]]; then 
    docker kill $(docker ps -q)
    docker ps -a
    echo "... Done**"
    echo ""
    echo "**Deleting stopped containers..."
    docker rm $(docker ps -a -q)
    docker ps -a 
    echo "... Done**"
    echo ""
    echo "**Prunine the images"
    docker images -a
    docker system prune -a
    docker images -a
    echo "... Done**"
    echo ""
    echo "Finished!" 
    exit 0 

fi
echo ""
echo "Bye!"
