#!/bin/sh


###################### DOCKER SECRETS #############################
docker secret rm mongo_root_password
echo "root_password" | docker secret create mongo_root_password -
docker secret ls
###################################################################

###################### DOCKER CONFIGS  #############################
docker config rm mongo_config
docker config create mongo_config ./init-mongo.sh
docker config inspect --pretty mongo_config
###################################################################

###################### DOCKER NETWORK  #############################
docker network rm me_mongodb_network
docker network create -d overlay me_mongodb_network
docker network ls
###################################################################

