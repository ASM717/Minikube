# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amuriel <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/14 15:25:25 by amuriel           #+#    #+#              #
#    Updated: 2021/04/20 13:13:40 by amuriel          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.7

RUN apk update
RUN apk add vim
RUN apk add supervisor
RUN apk add openrc
RUN apk add mysql mysql-client\
    mariadb mariadb-common mariadb-client
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/\
    --allow-untrusted\
    --no-cache

RUN mkdir -p /run/mysqld/
RUN chmod -R 777 /var/lib/mysql/

COPY ./my.cnf /etc/
COPY ./mysql-service.sql /
COPY ./telegraf.conf /etc/telegraf/
COPY ./supervisord.conf /etc/supervisord.conf
COPY ./init_start_db.sh /

#host dir
VOLUME ["/var/lib/mysql"]

EXPOSE 3306

CMD ./init_start_db.sh
