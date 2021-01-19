CONTAINERID=$(docker container ls | grep mongodb-server | awk '{ print $1 }')
#
docker cp items.json ${CONTAINERID}:/tmp/items.json
docker cp ratings.json ${CONTAINERID}:/tmp/
docker cp sites.json ${CONTAINERID}:/tmp/
docker exec ${CONTAINERID} ls /tmp
