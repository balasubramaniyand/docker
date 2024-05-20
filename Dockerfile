FROM nginx:1.14-alpine

MAINTAINER Vinoth Vetrivel <vinoth.vetrivel@iopex.com>

ARG CLIENT_NAME=config

# Install system dependencies
RUN apk --update add --no-cache vim bash

WORKDIR /var/opt

ADD ./ /var/opt/
COPY ./default.conf /etc/nginx/conf.d/
COPY /app/dist/. /usr/share/nginx/html
WORKDIR /usr/share/nginx/html


RUN mv build/* .
RUN mv opexwise/* .

# COPY ./build/assets/config/${CLIENT_NAME}.json /var/opt/assets/config/config.json

RUN rm -rf build

HEALTHCHECK CMD pgrep -f nginx || exit 1

RUN cp -f nginx.conf /etc/nginx/
EXPOSE map[80/tcp:{}]
