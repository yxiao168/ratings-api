# s2.sh
docker run -d --name mongodb-server \
--network app-tier \
bitnami/mongodb:latest
#
docker container latest