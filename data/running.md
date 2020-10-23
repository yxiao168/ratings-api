# running.md

## Step 1: Create a network
```
$ docker network create app-tier --driver bridge
```

## Step 2: Launch the MongoDB server instance
Use the --network app-tier argument to the docker run command to attach the MongoDB container to the app-tier network.
```
$ docker run -d --name mongodb-server \
    --network app-tier \
    bitnami/mongodb:latest
```

## Step 3 (optional): Launch your MongoDB client instance
Finally we create a new container instance to launch the MongoDB client and connect to the server created in the previous step:
```
$ docker run -it --rm \
    --network app-tier \
    bitnami/mongodb:latest mongo --host mongodb-server
```

## Step 4: copy files onto the container 

I want to Execute mongoimport on a Docker Container
https://stackoverflow.com/questions/49895447/i-want-to-execute-mongoimport-on-a-docker-container

```
$ docker container ls
CONTAINER ID        IMAGE                            COMMAND                  CREATED             STATUS              PORTS                    NAMES
ed4758a2b70b        yanmingxiao/ratings-web:latest   "docker-entrypoint.s…"   14 minutes ago      Up 14 minutes       0.0.0.0:8080->8080/tcp   gifted_cannon
2bb6cc71d9cb        yanmingxiao/ratings-api:latest   "docker-entrypoint.s…"   19 minutes ago      Up 19 minutes       0.0.0.0:3000->3000/tcp   flamboyant_hermann
22930b643b9f        bitnami/mongodb:latest           "/opt/bitnami/script…"   59 minutes ago      Up 59 minutes       27017/tcp                mongodb-server

$ docker exec 22930b643b9f cp items.json /tmp/items.json

$ docker exec 22930b643b9f cp ratings.json /tmp/ratings.json

$ docker exec 22930b643b9f cp sites.json /tmp/sites.json

$ docker exec 22930b643b9f ls /tmp
items.json
ratings.json
sites.json
```

## Step 5: import data onto the mongodb
```
$ docker exec 22930b643b9f \
mongoimport --host 127.0.0.1 --db ratingsdb --collection items --type json --file /tmp/items.json --jsonArray

$ docker exec 22930b643b9f \
mongoimport --host 127.0.0.1 --db ratingsdb --collection ratings --type json --file /tmp/ratings.json --jsonArray


$ docker exec 22930b643b9f \
mongoimport --host 127.0.0.1 --db ratingsdb --collection sites --type json --file /tmp/sites.json --jsonArray

```

## Step 6: launch the ratings-api
```
docker run -it --rm -d -p 3000:3000 \
--network app-tier \
-e MONGODB_URI=mongodb://mongodb-server:27017/ratingsdb \
yanmingxiao/ratings-api:latest

$ curl -XGET 0.0.0.0:3000/healthz;echo
API health check - OK
```


## Step 7: launch the ratings-web
```
docker run -it --rm -d -p 8080:8080 \
--network app-tier \
-e API=http://127.0.0.1:3000 \
yanmingxiao/ratings-web:latest

```
## Step 7: How To Remove Docker Images, Containers, and Volumes

https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes

```
$ docker system prune -a

$ docker container ls
$ docker container rm 5b165f321cca -f

$ docker system prune -a

$ docker images
$ clear
```



## Step 8: Docker - Logging
https://www.tutorialspoint.com/docker/docker_logging.htm

