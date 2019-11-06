#!/bin/bash

exec influxd &

sleep 10

influx -execute="create database homedb"
