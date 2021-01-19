# RUNNING-2.md

## Step 1: launch all docker containers 
```
$ docker-compose up -d
Creating network "data_default" with the default driver
Pulling db (bitnami/mongodb:latest)...
latest: Pulling from bitnami/mongodb
ff7c165d667c: Pull complete0679d32cd958: Pull completefbb2ace2d362: Pull complete73f542838cc2: Pull complete1797d23d9806: Pull complete7a13987766c3: Pull complete90edc5a7cdc7: Pull complete3332bd3e7412: Pull complete6661c1eb68bc: Pull complete
88af55bc876f: Pull complete
4b941c6b9db0: Pull complete817b6333966c: Pull complete
Digest: sha256:2e2fac656a2126c082d490002d55d75a3b70bce9106df2755f15a0552a3072ed
Status: Downloaded newer image for bitnami/mongodb:latest
Pulling api (yanmingxiao/ratings-api:latest)...
latest: Pulling from yanmingxiao/ratings-api
e6b0cf9c0882: Pull completeab436df1df6f: Pull complete470300a8a365: Pull complete84e7c11579ee: Pull complete
af53b57c99f8: Pull complete
a6c4f04ee1dc: Pull completefc17376094fa: Pull complete99d2b91f3431: Pull complete75fe859c010e: Pull completeDigest: sha256:72a01c4d0931a5ec43288b4a994e34e5693d372d5da9136429c36d8ce4f244bf
Status: Downloaded newer image for yanmingxiao/ratings-api:latest
Pulling web (yanmingxiao/ratings-web:latest)...
latest: Pulling from yanmingxiao/ratings-web
e6b0cf9c0882: Already exists
ab436df1df6f: Already exists
470300a8a365: Already exists
84e7c11579ee: Already exists
af53b57c99f8: Already exists
a6c4f04ee1dc: Already exists
8e42c085815c: Pull complete0cba70a1a9ca: Pull complete0c98c77f3b6f: Pull completeDigest: sha256:f5a91aacba8e27836674c5c218585046deb88466cf7488eb1f71dd6fcf8b029d
Status: Downloaded newer image for yanmingxiao/ratings-web:latest
Creating data_db_1 ... done
Creating data_api_1 ... done
Creating data_web_1 ... done
```

## Step 2: copy files onto the container, import data onto the mongodb

I want to Execute mongoimport on a Docker Container
https://stackoverflow.com/questions/49895447/i-want-to-execute-mongoimport-on-a-docker-container
```
$ . ./s3.sh

```

```
$ docker container ps
CONTAINER ID   IMAGE                            COMMAND                  CREATED         STATUS         PORTS                      NAMES
e7a9610112c8   yanmingxiao/ratings-web:latest   "docker-entrypoint.s…"   5 minutes ago   Up 5 minutes   0.0.0.0:8080->8080/tcp     data_web_1
68b3a8c9872a   yanmingxiao/ratings-api:latest   "docker-entrypoint.s…"   5 minutes ago   Up 5 minutes   0.0.0.0:3000->3000/tcp     data_api_1
84304714ae64   bitnami/mongodb:latest           "/opt/bitnami/script…"   5 minutes ago   Up 5 minutes   0.0.0.0:27017->27017/tcp   data_db_1

$ ls -l *.json
-rw-rw-r-- 1 yxiao yxiao  292 Oct 15 19:19 items.json
-rw-rw-r-- 1 yxiao yxiao 2446 Oct 15 19:19 ratings.json
-rw-rw-r-- 1 yxiao yxiao  775 Oct 15 19:19 sites.json

$ docker cp items.json 84304714ae64:/tmp/items.json
$ docker cp ratings.json 84304714ae64:/tmp/
$ docker cp sites.json 84304714ae64:/tmp/
$ docker exec 84304714ae64 ls /tmp
items.json
ratings.json
sites.json

```


## Step 3: launch the ratings-api
```
docker run -it --rm -d -p 3000:3000 \
--network app-tier \
-e MONGODB_URI=mongodb://mongodb-server:27017/ratingsdb \
yanmingxiao/ratings-api:latest

$ curl -XGET 0.0.0.0:3000/healthz;echo
API health check - OK
```

## Step 6: launch the ratings-api
```
export MONGODB_URI=mongodb://27.0.0.1:27017/ratingsdb

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

