FROM alpine:3.5
RUN apk add --no-cache --virtual .build-deps curl ca-certificates \
 && curl -L -o /frps.tar.gz --insecure https://github.com/fatedier/frp/releases/download/v0.31.2/frp_0.31.2_linux_amd64.tar.gz \
 && tar -zxvf /frps.tar.gz frp_0.31.2_linux_amd64/frps \
 && mkdir /usr/bin/frps \
 && mv frp_0.31.2_linux_amd64/frps /usr/bin/frps \
 && rm -rf /frp* frp* \
 && chgrp -R 0 /usr/bin/frps \
 && chmod -R g+rwX /usr/bin/frps
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
ENTRYPOINT /configure.sh
EXPOSE 80 7000
