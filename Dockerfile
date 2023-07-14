FROM alpine:latest
RUN addgroup -S www && adduser -S www -G www
RUN apk update && apk upgrade
RUN apk add bash
RUN apk add nginx
RUN apk add --no-cache \
  curl \
  nginx \
  php81 \
  php81-ctype \
  php81-curl \
  php81-dom \
  php81-fpm \
  php81-gd \
  php81-intl \
  php81-mbstring \
  php81-mysqli \
  php81-opcache \
  php81-openssl \
  php81-phar \
  php81-session \
  php81-xml \
  php81-xmlreader \
  php81-pdo_mysql \
  php81-zip \
  php81-exif \
  php81-tokenizer \
  php81-zlib
COPY infra-config/nginx /etc/nginx
COPY infra-config/php /etc/php81
COPY src /var/www/html
RUN mkdir /var/run/php
EXPOSE 80
EXPOSE 443
STOPSIGNAL SIGTERM
RUN chown -R www:www /var/log/php81/
CMD ["/bin/sh", "-c", "php-fpm81 && nginx -g 'daemon off;'"]
