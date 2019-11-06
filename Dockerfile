FROM alpine

#ENV INFLUX_LINUX_ARM_SHA256 c3f87938f8349649bf51db0a23683c06515548f6a84a9bcf0068a095e539e99e
ENV INFLUX_LINUX_AMD64_SHA256 8f7db67bc966815acee81799b5b2db200686f9315acf3dfb3486bd183ec13d35

# wget https://dl.influxdata.com/influxdb/releases/influxdb-1.7.9_linux_armhf.tar.gz
RUN wget https://dl.influxdata.com/influxdb/releases/influxdb-1.7.9_linux_amd64.tar.gz
#RUN wget https://dl.influxdata.com/influxdb/releases/influxdb-1.7.9_linux_amd64.tar.gz && \
#echo "$INFLUX_LINUX_AMD64_SHA256 influxdb-1.7.9_linux_amd64.tar.gz" | sha256sum -c - && \
#tar zxf influxdb-1.7.9_linux_amd64.tar.gz

COPY influxdb.conf influxdb-1.7.9-1/etc/influxdb.conf

EXPOSE 8086

CMD ["/run.sh"]

#ENTRYPOINT ["/nfluxdb-1.7.9-1/usr/bin/influxd"]

