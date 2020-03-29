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

############## Start Docker Service without Stack ##############################
docker service create --name mongoDB \
--secret mongo_root_password \
--config source=mongo_config,target=/docker-entrypoint-initdb.d/init-mongo.sh \
--publish 27017:27017 \
-e MONGO_INITDB_ROOT_USERNAME=root \
-e MONGO_INITDB_ROOT_PASSWORD=/run/secrets/mongo_root_password \
-e MONGO_INITDB_DATABASE=demo \
mongo:xenial


docker service ls

#Get into mongo container so that you can play with mongo client as per README file
docker container exec -it $(docker container ls -q) bash

