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
$ docker container ps
CONTAINER ID   IMAGE                    COMMAND                  CREATED         STATUS         PORTS       NAMES
5c370c76e5f0   bitnami/mongodb:latest   "/opt/bitnami/script…"   3 minutes ago   Up 3 minutes   27017/tcp   mongodb-server


$ docker exec 5c370c76e5f0 cp items.json /tmp/
cp: cannot stat 'items.json': No such file or directory
$ docker exec 5c370c76e5f0 ls /tmp
$ docker exec 5c370c76e5f0 ls -a /tmp
.
..
$ ls -l *.json
-rw-rw-r-- 1 yxiao yxiao  292 Oct 15 19:19 items.json
-rw-rw-r-- 1 yxiao yxiao 2446 Oct 15 19:19 ratings.json
-rw-rw-r-- 1 yxiao yxiao  775 Oct 15 19:19 sites.json

$ docker cp items.json 5c370c76e5f0:/tmp/items.json
$ docker cp ratings.json 5c370c76e5f0:/tmp/
$ docker cp sites.json 5c370c76e5f0:/tmp/
$ docker exec 5c370c76e5f0 ls /tmp
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
## Step 8: How To Remove Docker Images, Containers, and Volumes

https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes

```
$ docker system prune -a

$ docker container ls
$ docker container rm 5b165f321cca -f

$ docker system prune -a

$ docker images
$ clear
```



## Step 9: Docker - Logging
https://www.tutorialspoint.com/docker/docker_logging.htm

