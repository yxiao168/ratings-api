# mongodb VM + local API + local web
[bitnami/mongodb](https://bitnami.com/stack/mongodb/virtual-machine)


https://bitnami.com/stack/mean/virtual-machine


## copy data
```
$ cp *.json bitnami@192.168.1.5:/tmp
--authenticationDatabase admin
$ root@debian:~$ mongoimport --authenticationDatabase admin --username root --password N1kre9bTUAex --db ratingsdb --collection items --type json --file /tmp/items.json --jsonArray 
2021-01-19T04:18:48.517+0000	connected to: mongodb://localhost/
2021-01-19T04:18:48.521+0000	4 document(s) imported successfully. 0 document(s) failed to import.

bitnami@debian:~$ mongoimport --authenticationDatabase admin --username root --password N1kre9bTUAex --db ratingsdb --collection ratings --type json --file /tmp/ratings.json --jsonArray 
2021-01-19T04:21:56.935+0000	connected to: mongodb://localhost/
2021-01-19T04:21:56.940+0000	13 document(s) imported successfully. 0 document(s) failed to import.
bitnami@debian:~$ mongoimport --authenticationDatabase admin --username root --password N1kre9bTUAex --db ratingsdb --collection sites --type json --file /tmp/sites.json --jsonArray 
2021-01-19T04:22:19.103+0000	connected to: mongodb://localhost/
2021-01-19T04:22:19.107+0000	1 document(s) imported successfully. 0 document(s) failed to import.

```

## Disable the firewall on the VM
```
# systemctl stop ufw
# systemctl disable ufw

```

## Enable remote access to mongo db
https://www.digitalocean.com/community/tutorials/how-to-configure-remote-access-for-mongodb-on-ubuntu-20-04

```
# network interfaces
net:
  port: 27017
  bindIp: 127.0.0.1,mongodb_server_ip

```

## Run API
```
export MONGODB_URI=mongodb://192.168.1.5:27017/ratingsdb
```

