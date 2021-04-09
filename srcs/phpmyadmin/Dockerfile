# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amuriel <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/09 16:59:32 by amuriel           #+#    #+#              #
#    Updated: 2021/04/09 19:15:21 by amuriel          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

RUN apk update
RUN apk add nginx
RUN apk add supervisor
RUN	apk add wget
RUN apk add tar
RUN apk add lighttpd
RUN apk add php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session\
	php7-common php7-iconv php7-gd php7-curl php7-xml php7-imap php7-cgi \
	fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix \
	php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/\
	--allow-untrusted\
	--no-cache

RUN mkdir -p /www/etc/telegraf
RUN mkdir -p /var/run/nginx
RUN mkdir -p /var/run/php

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz
RUN tar -xzvf phpMyAdmin-5.1.0-all-languages.tar.gz
RUN rm -rf phpMyAdmin-5.1.0-all-languages.tar.gz
RUN mv phpMyAdmin-5.1.0-all-languages /www/phpmyadmin

COPY ./telegraf.conf /etc/telegraf/
COPY ./supervisord.conf /etc/supervisord.conf
COPY ./config.inc.php /www/phpmyadmin/
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./startsupervisord.sh	/

EXPOSE	5000

CMD /startsupervisord.sh
