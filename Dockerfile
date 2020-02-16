FROM alpine:3.5
ENV FRP_VER=0.31.2 FRP_TOKEN=ibcl.us TCP_MUX=false
RUN apk add --no-cache --virtual .build-deps openssl ca-certificates \
 && wget --no-check-certificate -c https://github.com/fatedier/frp/releases/download/v$FRP_VER/frp_$FRP_VER_linux_amd64.tar.gz -O - | tar -xz \
 && mkdir /usr/bin/frps \
 && mv frp_$VER_linux_amd64/frps frp_$VER_linux_amd64/frps.ini -t /usr/bin/frps \
 && chgrp -R 0 /usr/bin/frps \
 && chmod -R g+rwX /usr/bin/frps
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
ENTRYPOINT /configure.sh
EXPOSE 80
