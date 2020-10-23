# README.md



## Project 
https://docs.microsoft.com/en-us/learn/modules/aks-workshop/01-introduction


### bitnami/mongodb
https://hub.docker.com/r/bitnami/mongodb


I want to Execute mongoimport on a Docker Container
https://stackoverflow.com/questions/49895447/i-want-to-execute-mongoimport-on-a-docker-container


### ratings-api
https://github.com/MicrosoftDocs/mslearn-aks-workshop-ratings-api

$ docker run -it -p 3000:3000 -e MONGODB_URI='mongodb://127.0.0.1:27017/ratingsdb'  ratings-api 

> rating-api@1.3.5 start /usr/src/app
> node ./server.js


#>docker exec -it <container-name> mongo
#>docker cp xxx.json <container-name-or-id>:/tmp/xxx.json
#>docker exec <container-name-or-id> mongoimport -d <db-name> -c <c-name> --file /tmp/xxx.json


