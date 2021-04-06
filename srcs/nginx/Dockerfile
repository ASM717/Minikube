# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amuriel <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 15:23:09 by amuriel           #+#    #+#              #
#    Updated: 2021/04/06 20:35:14 by amuriel          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

RUN apk update
RUN apk upgrade
RUN apk supervisor
RUN apk nginx
RUN apk add openssh
RUN apk add openssl
RUN libc6-compat && mkdir -p /run/nginx

RUN openssl req -nodes\
	-x509\
	-days 365\
	-subj "/C=RU/ST=Moscow/L=Moscow/O=21 SCHOOL/OU=AMURIEL/CN=certificate ssl html"\
	-newkey rsa:2048\
	-keyout /etc/ssl/private/webkey.key\
	-out /etc/ssl/certs/webkey.crt
# RUN chmod -R 600 /etc/ssl/*
# RUN chown -R www-data /var/www/*
# RUN chmod -R 755 /var/www/*
COPY ./srcs/default /etc/nginx/conf.d/default
COPY ./srcs/index.html /var/www/index.html

