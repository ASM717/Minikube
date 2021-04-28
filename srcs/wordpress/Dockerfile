# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amuriel <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/16 12:17:22 by amuriel           #+#    #+#              #
#    Updated: 2021/04/28 10:44:23 by amuriel          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#command for enter in container
# kubectl exec -it deploy/wordpress-deployment -- /bin/sh
#

FROM alpine:3.12.7

RUN apk update
RUN apk add wget
RUN apk add nginx
RUN apk add openrc
RUN apk add libc6-compat
RUN apk add supervisor
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/\
	--allow-untrusted\
	--no-cache
RUN	apk add php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session\
	php7-common php7-iconv php7-gd php7-curl php7-xml php7-imap php7-cgi\
	fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix \
	php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN mkdir -p /run/nginx
RUN mkdir -p /var/run/php
RUN wget https://wordpress.org/latest.zip
RUN unzip latest.zip && mv wordpress /www/ && rm latest.zip

COPY ./supervisord.conf /etc/supervisord.conf
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./wp-config.php /www/
COPY ./telegraf.conf /etc/telegraf/

EXPOSE 5050

CMD ["/usr/bin/supervisord"]

