# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amuriel <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 15:23:09 by amuriel           #+#    #+#              #
#    Updated: 2021/04/07 11:35:08 by amuriel          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

RUN apk update
RUN apk upgrade
RUN apk add supervisor
RUN apk add nginx
RUN apk add openssh
RUN apk add openssl
RUN libc6-compat
#Install packages with untrusted signature or no signature
RUN apk add telegraf\
	--repository http://dl-cdn.alpinelinux.org/alpine/edge/community/\
	--allow-untrusted\
	--no-cache


RUN mkdir -p /etc/ssl/private
RUN mkdir -p /etc/ssl/certs

RUN req -x509 -nodes\
	-days 365\
	-subj "/C=RU/ST=Moscow/L=Moscow/O=21 SCHOOL/OU=AMURIEL/CN=certificate ssl html"\
	-newkey rsa:2048\
	-keyout /etc/ssl/private/webkey.key\
	-out /etc/ssl/certs/webkey.crt

RUN ssh-keygen -A && adduser -D user && echo "user:pass" | chpasswd

RUN chmod -R 600 /etc/ssl/*
RUN chown -R www-data /var/www/*
RUN chmod -R 755 /var/www/*

COPY ./srcs/default /etc/nginx/conf.d/default
COPY ./srcs/index.html /var/www/index.html
COPY ./srcs/telegraf /etc/telegraf

EXPOSE 80 443
