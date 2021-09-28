#
# 01_startMongo.sh
# 
MONGOUSER="myuser"
MONGOPASS="mypass"
#
sudo docker run -d --network=host  \
-e MONGODB_USERNAME="${MONGOUSER}" -e MONGODB_PASSWORD="${MONGOPASS}" \
-e MONGODB_DATABASE=ratingsdb bitnami/mongodb:latest
#
# set up the evironment value after no longer a sudo 
#
#export MONGODB_URI="mongodb://${MONGOUSER}:${MONGOPASS}@127.0.0.1:27017/ratingsdb"
#echo $MONGODB_URI