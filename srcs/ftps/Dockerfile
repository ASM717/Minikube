# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amuriel <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/17 12:00:37 by amuriel           #+#    #+#              #
#    Updated: 2021/04/17 12:29:45 by amuriel          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.7

RUN apk update
RUN apk add vsftpd
RUN apk add supervisor
RUN apk add openssh
RUN apk add openssl
RUN apk add openrc
RUN apk add bash
RUN apk add telegraf\
	--repository http://dl-cdn.alpinelinux.org/alpine/edge/community/\
	--allow-untrusted\
	--no-cache


RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Moscow/L=Moscow/O=21 SCHOOL/OU=AMURIEL/CN=certificate ssl html"\
	-newkey rsa:2048\
	-keyout /etc/ssl/private/pure-ftpd.pem\
	-out /etc/ssl/private/pure-ftpd.pem

RUN adduser -D user && echo "user:user" | chpasswd
