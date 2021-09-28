#
# 2_startAPI_npm.sh
# 
#$ sudo npm install
#
MONGOUSER="myuser"
MONGOPASS="mypass"
#
export MONGODB_URI="mongodb://${MONGOUSER}:${MONGOPASS}@127.0.0.1:27017/ratingsdb"
#echo $MONGODB_URI
#
npm start