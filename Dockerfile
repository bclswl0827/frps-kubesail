FROM alpine:3.5
ENV VER=0.31.2 TOKEN=ibcl.us
RUN apk add --no-cache --virtual .build-deps ca-certificates \
 && wget --no-check-certificate -c https://github.com/fatedier/frp/releases/download/v$VER/frp_$VER_linux_amd64.tar.gz -O - | tar -xz \
 && mkdir /usr/bin/frps \
 && mv frp_$VER_linux_amd64/frps frp_$VER_linux_amd64/frps.ini -t /usr/bin/frps \
 && chgrp -R 0 /usr/bin/frps \
 && chmod -R g+rwX /usr/bin/frps
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
ENTRYPOINT /configure.sh
EXPOSE 80
