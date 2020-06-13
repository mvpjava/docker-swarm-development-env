#!/bin/sh

chmod 755 ./setup_docker_objects.sh

echo "Setting up Docker objects (secrets, configs etc ..)"
./setup_docker_objects.sh


echo "Starting Docker stack"
docker stack deploy -c stack.yml mystack

#Some basic listing commands
sleep 5
docker stack ls
docker stack ps mystack
docker service ls

