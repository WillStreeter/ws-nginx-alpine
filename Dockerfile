FROM alpine:3.5

MAINTAINER Will Streeter <will.streeter@gmail.com>

#Install nginx


EXPOSE 80 443

ENV APK_MIRROR http://dl-4.alpinelinux.org


RUN echo "$APK_MIRROR/alpine/v3.5/main" >> /etc/apk/repositories && \
    apk add --update \
    --no-cache \
    ca-certificates \
    nginx \
  && rm -rf /tmp/* /var/cache/apk/*

RUN mkdir /app \
  && mkdir /run/nginx

COPY etc/nginx /etc/nginx

CMD nginx -g 'daemon off;'