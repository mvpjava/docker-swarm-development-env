# docker-swarm-development-env
Advantages of Using Docker Swarm in a Develpoment Environment
==============================================================

The stack deployed via command "docker stack deploy -c stack.yml myStack" supports
a Java developer workflow where the Java developer is working and compiling their code
in an IDE. You can get access to the Java project code here ...
"git clone https://github.com/mvpjava/java-driver-api-mongo4.git"

I have a Spring Tool Suite (STS) IDE enviroment which you can use to import the git Java project
and then run a maven clean package build to get the jar file generated in the development environment.
This STS IDE is run in a Docker container.
You can run  ....
git clone https://github.com/mvpjava/docker-spring-sts4-ide.git
and then execute the shell script to launch the IDE

$ run.sh

Once the jar is created with all its dependancies (fat/uber jar), it is then
placed in a directory volume bind mounts by Docker into the JDK container.
The jar is then executed (will connect to mongo and periodically add documents in an endless loop)
Make sure to git clone of this repo in the same directory in which you ran the STS Docker container

The Docker swarm stack will reference Docker objects like overlay networks, secrets and configs
available only in Docker swarm. This will allow us to better reproduce non-developer environments and also improve the
administration of those Docker objects by Docker itself. You have to execute the following
scripts in order to create all those Docker objects first ...

$ setup_docker_objects.sh

You can then spawn all the Docker swarm services via the shell command ..

$ docker stack deploy -c stack.yml mystack

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
