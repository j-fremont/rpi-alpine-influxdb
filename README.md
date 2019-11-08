# rpi-alpine-influxdb

Docker image for InfluxDB on Rapsberry Pi 

Build with :
```
$ docker image build -t rpi-alpine-influxdb .
```

Run with :
```
$ docker container run -d -p 8086:8086 -d rpi-alpine-influxdb
