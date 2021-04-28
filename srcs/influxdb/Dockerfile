# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amuriel <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/21 11:03:02 by amuriel           #+#    #+#              #
#    Updated: 2021/04/28 10:43:34 by amuriel          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#command for enter in container
# kubectl exec -it deploy/influxdb-deployment -- /bin/sh
#

FROM alpine:3.12.7

RUN apk update
RUN apk add influxdb
RUN apk add supervisor
RUN apk add openrc
RUN apk add libc6-compat
RUN apk add telegraf\
	--repository http://dl-cdn.alpinelinux.org/alpine/edge/community/\
	--allow-untrusted\
	--no-cache

COPY ./telegraf.conf /etc/telegraf/
COPY ./supervisord.conf /etc/supervisord.conf

EXPOSE 8086

CMD [ "/usr/bin/supervisord" ]
