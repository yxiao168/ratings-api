# s7.sh
docker run -it --rm -d -p 8080:8080 \
--network app-tier \
-e API=http://127.0.0.1:3000 \
yanmingxiao/ratings-web:latest