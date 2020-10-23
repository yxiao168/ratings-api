# README.md



## Project 
https://docs.microsoft.com/en-us/learn/modules/aks-workshop/01-introduction

### docker account
https://hub.docker.com
Docker ID: yanmingxiao
Email: yanming_xiao@yahoo.com
password: Gogo09801!

$ docker login
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: yanmingxiao
Password: Gogo09801!
Login Succeeded


### bitnami/mongodb
https://hub.docker.com/r/bitnami/mongodb


I want to Execute mongoimport on a Docker Container
https://stackoverflow.com/questions/49895447/i-want-to-execute-mongoimport-on-a-docker-container


### ratings-api
https://github.com/MicrosoftDocs/mslearn-aks-workshop-ratings-api

$ docker run -it -p 3000:3000 -e MONGODB_URI='mongodb://127.0.0.1:27017/ratingsdb'  ratings-api 

> rating-api@1.3.5 start /usr/src/app
> node ./server.js

ERROR: UNABLE TO CONNECT TO mongodb://127.0.0.1:27017/ratingsdb
Make sure you have set the environment variable MONGODB_URI to the correct endpoint.
failed to connect to server [127.0.0.1:27017] on first connect [Error: connect ECONNREFUSED 127.0.0.1:27017
    at TCPConnectWrap.afterConnect [as oncomplete] (net.js:1136:16) {
  name: 'MongoError',
  message: 'connect ECONNREFUSED 127.0.0.1:27017'


#>docker exec -it <container-name> mongo
#>docker cp xxx.json <container-name-or-id>:/tmp/xxx.json
#>docker exec <container-name-or-id> mongoimport -d <db-name> -c <c-name> --file /tmp/xxx.json


