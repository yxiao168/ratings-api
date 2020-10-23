# s6.sh
docker run -it --rm -d -p 3000:3000 \
--network app-tier \
-e MONGODB_URI=mongodb://mongodb-server:27017/ratingsdb \
yanmingxiao/ratings-api:latest
#
curl -XGET http://0.0.0.0:3000/healthz;echo
#API health check - OK