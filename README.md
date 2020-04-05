# docker-swarm-development-env
Advantages of Using Docker Swarm in a Develpoment Environment
==============================================================

The stack deployed via command "docker stack deploy -c stack.yml myStack" supports
a Java developer workflow where the Java developer is working and compiling their code
in an IDE. You can get access to the Java project code here .. "git clone https://github.com/mvpjava/java-mongo4.git"

Once the jar is created with all its dependancies (fat/uber jar), it is then
placed in a directory where the Docker stack then volume bind mounts it into the JDK container
to be executed (will connect to mongo and periodically add documents in an endless loop)

The stack will reference Docker objects like overlay networks, secrets and configs
available in Docker swarm to better reproduce other environments and also improve the
administration of those Docker objects by Docker itself.

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
