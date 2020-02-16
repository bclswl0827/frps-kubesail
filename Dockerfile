FROM alpine:3.5
ENV FRP_TOKEN=ibcl.us TCP_MUX=false
RUN apk add --no-cache --virtual .build-deps openssl ca-certificates \
 && wget --no-check-certificate https://github.com/fatedier/frp/releases/download/v0.31.2/frp_0.31.2_linux_amd64.tar.gz \
 && tar -xz frp_0.31.2_linux_amd64.tar.gz
 && mkdir /usr/bin/frps \
 && mv frp_0.31.2_linux_amd64/frps frp_0.31.2_linux_amd64/frps.ini -t /usr/bin/frps \
 && chgrp -R 0 /usr/bin/frps \
 && chmod -R g+rwX /usr/bin/frps \
 && rm -rf frp_0.31.2_linux_amd64*
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
ENTRYPOINT /configure.sh
EXPOSE 80
