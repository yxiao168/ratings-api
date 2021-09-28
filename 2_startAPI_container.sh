#
# 2_startAPI_container.sh
# 
#$ sudo npm install
#
MONGOUSER="myuser"
MONGOPASS="mypass"
#
export MONGODB_URI="mongodb://${MONGOUSER}:${MONGOPASS}@127.0.0.1:27017/ratingsdb"
#echo $MONGODB_URI
#
sudo docker run -it --network=host -p 3000:3000 -e MONGODB_URI="$MONGODB_URI" ratings-api
