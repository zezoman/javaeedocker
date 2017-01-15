docker create --name hostjee1 -p 8080:8080 --link postgresdb:postgresdb --link cassandradb:cassandradb bgzezo/javaeedocker
docker create --name hostjee2 -p 8081:8080 --link postgresdb:postgresdb --link cassandradb:cassandradb bgzezo/javaeedocker
docker create --name hostjee3 -p 8082:8080 --link postgresdb:postgresdb --link cassandradb:cassandradb bgzezo/javaeedocker
docker create --name loadbalancerjee -p 80:80 --link hostjee1:hostjee1 --link hostjee2:hostjee2 --link hostjee3:hostjee3 --env-file ../conf/env-load.list jasonwyatt/nginx-loadbalancer
