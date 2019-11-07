#!/bin/sh

chown -R influxdb:influxdb /var/lib/influxdb
exec su-exec influxdb /usr/bin/influxd $@
exec su-exec influxdb /usr/bin/influx -execute 'create database homedb'
