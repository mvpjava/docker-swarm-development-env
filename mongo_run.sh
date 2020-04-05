#!/bin/sh


docker service create --name mongoDB \
--secret mongo_root_password \
--config source=mongo_config,target=/docker-entrypoint-initdb.d/init-mongo.sh \
--publish 27017:27017 \
--network me_mongodb_network \
-e MONGO_INITDB_ROOT_USERNAME=root \
-e MONGO_INITDB_ROOT_PASSWORD=/run/secrets/mongo_root_password \
-e MONGO_INITDB_DATABASE=demo \
mongo:xenial


docker service ls
