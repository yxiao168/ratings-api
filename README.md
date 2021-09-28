---
page_type: sample
languages:
- nodejs
products:
- nodejs
description: "This code is part of the Microsoft Learn module of the AKS workshop. It provides the API for the ratings application. The API connects to a MongoDB to store and retrieve data."
urlFragment: "aksworkshop-ratings-api"
---

# AKS Workshop - ratings-api sample code

<!-- 
Guidelines on README format: https://review.docs.microsoft.com/help/onboard/admin/samples/concepts/readme-template?branch=master

Guidance on onboarding samples to docs.microsoft.com/samples: https://review.docs.microsoft.com/help/onboard/admin/samples/process/onboarding?branch=master

Taxonomies for products and languages: https://review.docs.microsoft.com/new-hope/information-architecture/metadata/taxonomies?branch=master
-->
The project is forked from [aksworkshop-ratings-api](https://github.com/MicrosoftDocs/mslearn-aks-workshop-ratings-api)


[Original README.md](README_orig.md)

## Contents

| File/folder               | Description                   |
|---------------------------|-------------------------------|
| `0_startMongo.sh`         | Built the API docker on local |
| `0_install_NPM.sh`        | Install required NPM packages |
| `1_startMongo.sh`         | Start MongoDB container       |
| `2_startAPI_container.sh` | Start the API container       |
| `2_startAPI_npm.sh`       | Start the API NPM             |


## Prerequisites

To build this sample locally, you can either build using Docker, or using NPM.

MongoDB should be running on "127.0.0.1:27017/ratingsdb"
[bitnami/mongodb](https://hub.docker.com/r/bitnami/mongodb)


## Setup

- To build using Docker, in the project folder, run `0_build_docker.sh`
```shell
$ ./0_build_docker.sh
Sending build context to Docker daemon  114.2kB
Step 1/8 : FROM node:13.5-alpine
13.5-alpine: Pulling from library/node
e6b0cf9c0882: Pull complete 
ab436df1df6f: Pull complete 
470300a8a365: Pull complete 
84e7c11579ee: Pull complete 
Digest: sha256:a5a7ff4267a810a019c7c3732b3c463a892a61937d84ee952c34af2fb486058d
Status: Downloaded newer image for node:13.5-alpine
 ---> e1495e4ac50d
Step 2/8 : WORKDIR /usr/src/app
 ---> Running in 5362e86fa456
Removing intermediate container 5362e86fa456
 ---> 4b1a8c9a76d4
Step 3/8 : RUN apk update && apk add python g++ make && rm -rf /var/cache/apk/*
 ---> Running in d18f325caffc
fetch http://dl-cdn.alpinelinux.org/alpine/v3.11/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.11/community/x86_64/APKINDEX.tar.gz
v3.11.12-17-g7b66336f79 [http://dl-cdn.alpinelinux.org/alpine/v3.11/main]
v3.11.11-124-gf2729ece5a [http://dl-cdn.alpinelinux.org/alpine/v3.11/community]
OK: 11285 distinct packages available
(1/23) Upgrading musl (1.1.24-r0 -> 1.1.24-r3)
(2/23) Upgrading libstdc++ (9.2.0-r3 -> 9.3.0-r0)
(3/23) Installing binutils (2.33.1-r1)
(4/23) Installing gmp (6.1.2-r1)
(5/23) Installing isl (0.18-r0)
(6/23) Installing libgomp (9.3.0-r0)
(7/23) Installing libatomic (9.3.0-r0)
(8/23) Installing mpfr4 (4.0.2-r1)
(9/23) Installing mpc1 (1.1.0-r1)
(10/23) Installing gcc (9.3.0-r0)
(11/23) Installing musl-dev (1.1.24-r3)
(12/23) Installing libc-dev (0.7.2-r0)
(13/23) Installing g++ (9.3.0-r0)
(14/23) Installing make (4.2.1-r2)
(15/23) Installing libbz2 (1.0.8-r1)
(16/23) Installing expat (2.2.9-r1)
(17/23) Installing libffi (3.2.1-r6)
(18/23) Installing gdbm (1.13-r1)
(19/23) Installing ncurses-terminfo-base (6.1_p20200118-r4)
(20/23) Installing ncurses-libs (6.1_p20200118-r4)
(21/23) Installing readline (8.0.1-r0)
(22/23) Installing sqlite-libs (3.30.1-r2)
(23/23) Installing python2 (2.7.18-r0)
Executing busybox-1.31.1-r8.trigger
OK: 212 MiB in 37 packages
Removing intermediate container d18f325caffc
 ---> 451c1e4762f8
Step 4/8 : COPY package*.json ./
 ---> 2f63d6dc9760
Step 5/8 : RUN npm install
 ---> Running in 45b8a2a6c5cf
npm WARN read-shrinkwrap This version of npm is compatible with lockfileVersion@1, but package-lock.json was generated for lockfileVersion@2. I'll try to do my best with it!
npm WARN rating-api@1.3.5 No repository field.
npm WARN rating-api@1.3.5 No license field.

added 106 packages from 97 contributors and audited 107 packages in 1.958s
found 18 vulnerabilities (4 low, 2 moderate, 10 high, 2 critical)
  run `npm audit fix` to fix them, or `npm audit` for details
Removing intermediate container 45b8a2a6c5cf
 ---> c412fb44cb92
Step 6/8 : COPY . .
 ---> aca1c70a737b
Step 7/8 : EXPOSE 3000
 ---> Running in 82fd1a04d94a
Removing intermediate container 82fd1a04d94a
 ---> 09ff78e44f22
Step 8/8 : CMD [ "npm", "start"]
 ---> Running in 5cd5649b6e97
Removing intermediate container 5cd5649b6e97
 ---> 09afdcc0826d
Successfully built 09afdcc0826d
Successfully tagged ratings-api:latest
$ ./01_startMongo.sh 
Unable to find image 'bitnami/mongodb:latest' locally
latest: Pulling from bitnami/mongodb
d8cf0c803abf: Already exists 
b50c3fcaaa2b: Pull complete 
ec8e1fafd63d: Pull complete 
1c7b3bda06c0: Pull complete 
7dd8b0c68e13: Pull complete 
8caf3ae7449e: Pull complete 
80ca34a1a26a: Pull complete 
1d66e79f1c11: Pull complete 
c25d441dec64: Pull complete 
4d5b17f10159: Pull complete 
336553ec6479: Pull complete 
Digest: sha256:80cdaf9a0d50648c70b3550a5d32f5bd674c64e6f4a1da9d1372f887f7efe5f6
Status: Downloaded newer image for bitnami/mongodb:latest
71bbcf6999bf42a30f7457cdc0c5774cac780d67433e8fcef8aa56e570b16514
$ sudo docker images
REPOSITORY        TAG           IMAGE ID       CREATED          SIZE
ratings-api       latest        09afdcc0826d   47 seconds ago   335MB
bitnami/mongodb   latest        62dbbc6d0fd1   18 hours ago     430MB
node              13.5-alpine   e1495e4ac50d   21 months ago    111MB
```

- To build using NPM, in the project folder, run `npm install`
```shell
$ ./0_install_NPM.sh

```
## Start MongoDB container 
```shell
$ ./1_startMongo.sh 
1461093a2a8d05da848074f1e4049feb8db4b9128f333ecbb66b735e5a176797
$ sudo docker container ls
CONTAINER ID   IMAGE                    COMMAND                  CREATED          STATUS          PORTS     NAMES
1461093a2a8d   bitnami/mongodb:latest   "/opt/bitnami/script…"   42 seconds ago   Up 40 seconds             upbeat_poitras
```

## Running the sample

### To run using Docker
```shell
$ ./2_startAPI_container.sh

```
### To run using NPM
```shell
$ ./01_startMongo.sh 
43fee8e18de8f3c99504a64fc51c552c79836957961898985dbf9ef3746d224a

$ ./02_startAPI.sh

> rating-api@1.3.5 start
> node ./server.js

'CONNECTED TO mongodb://myuser:mypass@127.0.0.1:27017/ratingsdb'
'No items found in the database. Loading data.'
'No sites found in the database. Loading data.'
'Items loaded.'
'Sites loaded.'
GET /api/sites/FR 200 7.257 ms - 595
GET /api/sites/FR 200 1.503 ms - -
GET /api/sites/FR 200 1.029 ms - -
GET /api/sites/FR 200 0.984 ms - -
GET /api/items 200 1.126 ms - 443
GET /api/sites/FR 200 1.324 ms - -
GET /api/sites/FR 200 4.366 ms - -
GET /api/items 200 3.766 ms - -
GET /api/items/rated - - ms - -
GET /api/sites/FR 200 1.195 ms - -
GET /api/sites/FR 200 4.566 ms - -
GET /api/sites/FR 200 0.954 ms - -
GET /api/items/rated - - ms - -
...
```

### To verify the API
- To run using Docker, run `3_verify.sh`
```shell
$ ./3_verify.sh 
{"message":"ok","status":200,"payload":[{"_id":"61522d27a8c1f000126c7b28","name":"Banana","uid":1,"img":"/static/img/fruits/banana.jpeg"},{"_id":"61522d27a8c1f000126c7b29","name":"Coconut","uid":2,"img":"/static/img/fruits/coconut.jpeg"},{"_id":"61522d27a8c1f000126c7b2a","name":"Oranges","uid":3,"img":"/static/img/fruits/oranges.jpeg"},{"_id":"61522d27a8c1f000126c7b2b","name":"Pineapple","uid":4,"img":"/static/img/fruits/pineapple.jpeg"}]}
```
