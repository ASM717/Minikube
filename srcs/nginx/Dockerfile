# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amuriel <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 15:23:09 by amuriel           #+#    #+#              #
#    Updated: 2021/04/27 13:53:49 by amuriel          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#command for enter in container
# kubectl exec -it deploy/nginx-deployment -- /bin/sh
#

FROM alpine:3.12.7

RUN apk update
RUN apk add supervisor
RUN apk add nginx
RUN apk add openssl
RUN apk add openrc
RUN apk add	libc6-compat
RUN apk add bash
RUN apk add telegraf\
	--repository http://dl-cdn.alpinelinux.org/alpine/edge/community/\
	--allow-untrusted\
	--no-cache
RUN mkdir -p /run/nginx
RUN mkdir -p /etc/ssl/private/
RUN mkdir -p /etc/ssl/certs/
#ssl install
RUN openssl req -x509 -nodes -days 365\
	-subj "/C=RU/ST=Moscow/L=Moscow/O=21 SCHOOL/OU=AMURIEL/CN=certificate ssl html"\
	-newkey rsa:2048\
	-keyout /etc/ssl/private/webkey.key\
	-out /etc/ssl/certs/webkey.crt

COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./supervisord.conf /etc/supervisord.conf
COPY ./telegraf.conf /etc/telegraf/
COPY ./index.html /www/index.html

EXPOSE 80 443

CMD ["/usr/bin/supervisord"]
