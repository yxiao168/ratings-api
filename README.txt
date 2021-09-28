#
#
#  https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes
#
#
# 0. Purging All Unused or Dangling Images, Containers, Volumes, and Networks
# docker system prune -a
#
#
# 1. Run mongo for ratings-api
#
# Connect to a docker container from outside the host (same network)
# https://community.synology.com/enu/forum/17/post/102280
#
# https://hub.docker.com/r/bitnami/mongodb
# https://github.com/bitnami/bitnami-docker-mongodb#how-to-use-this-image 
#
sudo docker run -d --network=host  \
-e MONGODB_USERNAME=myuser -e MONGODB_PASSWORD=mypass \
-e MONGODB_DATABASE=ratingsdb bitnami/mongodb:latest
#
#
#
export MONGODB_URI="mongodb://myuser:mypass@127.0.0.1:27017/ratingsdb"

#
#
# 2. start ratings-api
# 
$ sudo npm install

$ npm start


