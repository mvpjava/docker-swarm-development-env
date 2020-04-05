# docker-swarm-development-env
Advantages of Using Docker Swarm in a Develpoment Environment
==============================================================

1) Start the Java Developer environment and simulate a regular build by running the command ...

$ ./run_sts4_ide.sh

- When IDE open, import project via File->Open Projects from File System"
- Choose project ~/Documents/workspace-spring-tool-suite-4-4.6.0.RELEASE/java-driver-api-mongo4 
- When project is created then run a maven "clean package" build to get uber jar created

2) Execute the following shell command to deploy (mongo, mongo express and the java application)
which will make use of the docker secrets, configs and network created by the script

$ sudo ./run_stack.sh

3) Open up a Browser and goto "localhost:8081" to acess mongodb express GUI console.
Select the "demo" database and view the Document count incrementing by refreshing the browser
(a new Document is inserted wevery 5 seconds by the Java Application).


You can stop and remove the stack via command ...

$ sudo docker stack rm mystack


-------
NOT NEEDED FOR DEMO - extra files


If your interested in getting into the mongo container manually via
the 'docker container exec -it $container-id bash' command then you can start mongo client and 
execute the following commands in order to interact with newly creared database.

$ mongo  -u root -p /run/secrets/mongo_root_password 

> use demo              #switch to using demo database

> db                    #show database in use

> show collections      #show tables

> db.metrics.count()   #show number of rows/documents in table/collection

> db.metrics.find()   #list all rows/documents in table/collection

===============================

setup_docker_objects.sh  - creates the docker secret, configs, netwoek needed for demo

init-mongo.sh   - mongo initialization script with test data read at startup. This is conveted into a docker config object

mongo_run.sh  - not needed but can use to run a single mongo db as a docker service
