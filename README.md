# docker-swarm-development-env
Advantages of Using Docker Swarm in a Develpoment Environment
==============================================================

1) Start the Java Developer environment by running the command ...

$ ./run_sts4_ide.sh

- When IDE open, import git project via File->Import->Git->Projects from Git (with smart import)
- Select Clone URI -->: https://github.com/mvpjava/java-driver-api-mongo4.git
- Save in directory $HOME/Documents/workspace-spring-tool-suite-4-4.6.0.RELEASE
- When project is created then run a maven "clean package" build to get uber jar created

2) What is different about this containerized developer environment is that the docker CLI is installed 
(like docker in docker) therefore you can deploy the docker swarm stack from the terminal window directly from with the IDE (Window->Show View->Terminal

$ ./run_stack.sh

This script will create the docker objects like the overlay network, secrets and configs
needed for the demo. It's a wrapper script to automate the docker commands.

3) Open up a Browser and goto "localhost:8081" to acess mongodb express GUI console.
Select the "demo" database and view the Document count incrementing by refreshing the browser
(a new Document is inserted wevery 5 seconds by the Java Application).


You can stop and remove the stack via command ...

$ docker stack rm mystack


===========================

If your interested in getting into the mongo container manually via
the 'docker container exec -it $container-id bash' command then you can start mongo client and 
execute the following commands in order to interact with newly creared database.

$ mongo  -u root -p /run/secrets/mongo_root_password 

> use demo              #switch to using demo database

> db                    #show database in use

> show collections      #show tables

> db.metrics.count()   #show number of rows/documents in table/collection

> db.metrics.find()   #list all rows/documents in table/collection
~                              
