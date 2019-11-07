FROM alpine:3.7

#ENV IFLUXDB_VERSION=1.7.9

#RUN apk update \
# && apk upgrade \
# && apk add --no-cache ca-certificates \
# && update-ca-certificates \
# && apk add curl openssl

RUN apk add --no-cache su-exec

#ENV INFLUX_LINUX_ARM_SHA256 c3f87938f8349649bf51db0a23683c06515548f6a84a9bcf0068a095e539e99e

#ENV INFLUX_LINUX_AMD64_SHA256  8f7db67bc966815acee81799b5b2db200686f9315acf3dfb3486bd183ec13d35

# wget https://dl.influxdata.com/influxdb/releases/influxdb-1.7.9_linux_armhf.tar.gz

WORKDIR /scripts

ADD https://dl.influxdata.com/influxdb/releases/influxdb-1.7.9-static_linux_amd64.tar.gz ./

RUN addgroup influxdb \
 && adduser -s /bin/false -G influxdb -S -D influxdb

#RUN wget http://dl.influxdata.com/influxdb/releases/influxdb-1.7.9-static_linux_amd64.tar.gz \
#RUN curl -fsSL https://dl.influxdata.com/influxdb/releases/influxdb-1.7.9_linux_amd64.tar.gz -o influxdb-1.7.9_linux_amd64.tar.gz \
# && echo "$INFLUX_LINUX_AMD64_SHA256 influxdb-1.7.9_linux_amd64.tar.gz" | sha256sum -c - \
# && tar -C /usr/local -zxf influxdb-1.7.9_linux_amd64.tar.gz \

COPY ./scripts/start.sh start.sh

RUN tar -C . -zxf influxdb-1.7.9-static_linux_amd64.tar.gz \
 && chmod +x influxdb-*/* \
 && cp -a influxdb-*/* /usr/bin/ \
 && rm -rf *.tar.gz* influxdb-*/

VOLUME [ "/var/lib/influxdb" ]

#COPY influxdb.conf /influxdb-1.7.9-1/etc/influxdb.conf

#COPY entrypoint.sh /entrypoint.sh

#COPY run.sh /run.sh
#RUN chmod +x /*.sh

EXPOSE 8086

#CMD ["/run.sh"]
#CMD ["/influxdb-1.7.9-1/usr/bin/influxd"]

#ENTRYPOINT ["/influxdb-1.7.9-1/usr/bin/influxd"]
#ENTRYPOINT ["/bin/sh", "./entrypoint.sh"]
ENTRYPOINT ["./start.sh"]
