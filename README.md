# rpi-alpine-influxdb

Docker image for InfluxDB on Rapsberry Pi 

Build with :
```
$ docker image build -t rpi-alpine-influxdb .
```

Run with :
```
$ docker container run -d -p 8086:8086 -v influxdb:/var/lib/influxdb rpi-alpine-influxdb
```

Or try https://hub.docker.com/r/hypriot/rpi-influxdb.

Create database.
```
$ influx -host 192.168.1.20 -precision rfc3339
Connected to http://192.168.1.20:8086 version 1.7.x
InfluxDB shell 1.7.x
> CREATE DATABASE homedb
> SHOW DATABASES
name: databases
name
----
_internal
homedb
> USE homedb
Using database homedb
>
```

Ne trouve pas le fichier de config car va chercher les données dans /root/.influxdb au lieu /var/lib/influxdb.

Une autre tentative avec apk (apk update && apk install influxdb) ne trouve pas le package influxdb.

L'utilisation de l'image officielle (docker pull influxdb) fonctionne sur Rapsberry.
