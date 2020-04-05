# docker-swarm-development-env
Advantages of Using Docker Swarm in a Develpoment Environment
==============================================================

Start the Java Developer environment (with Eclipse/Spring Tool SuiteIDE, git, maven, Docker CLI)
by running the command (might have to 'chmod 755' the file) ...

$ ./run_sts4_ide.sh

- When IDE open, import git project via File->Import->Git->Projects from Git (with smart import)
- Select Clone URI --> Use the following URI: https://github.com/mvpjava/java-driver-api-mongo4.git
- Save in directory $DOCKER_ECLIPSE_WORKSPACE_DIR"
- When project is created then run a maven "clean package" build to get uber jar created in $ECLIPSE_WORKSPACE_DIR

Once the fat/uber jar is created with all its dependancies , we can fire up the entire docker swarm stack with
a single command ...

$ ./run_stack.sh


The Docker swarm stack will reference Docker objects like overlay networks, secrets and configs
available only in Docker swarm. This will allow us to better reproduce non-developer environments and also improve the
administration of those Docker objects by Docker itself. You have to execute the following
scripts in order to create all those Docker objects first ...

$ setup_docker_objects.sh

You can then startthe Docker stack via shell command ..

$ docker stack deploy -c stack.yml mystack

Open up a Browser and goto localhost:8081 to acess mongodb express GUI console
you can select the "demo" database and see the Documents getting updated at about 
every 5 seconds (just refresh browser)

You can stop and remove the stack via command ...

$ docker stack rm mystack

Once your in the mongo container you can start mongo client and 
execute the following commands in order to interact with newly 
creared database.

mongo  -u root -p /run/secrets/mongo_root_password    #Start mongo client

use demo              #switch to using demo database

db                    #show database in use

show collections      #show tables

db.metrics.count()   #show number of rows/documents in table/collection

db.metrics.find()   #list all rows/documents in table/collection
~                              
