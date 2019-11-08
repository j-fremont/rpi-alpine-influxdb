FROM hypriot/rpi-alpine-scratch

ADD https://dl.influxdata.com/influxdb/releases/influxdb-1.7.9_linux_armhf.tar.gz ./

RUN tar -C . -zxf influxdb-1.7.9_linux_armhf.tar.gz

COPY influxdb.conf /influxdb-1.7.9-1/etc

VOLUME [ "/var/lib/influxdb" ]

EXPOSE 8086

CMD ["/influxdb-1.7.9-1/usr/bin/influxd"]
