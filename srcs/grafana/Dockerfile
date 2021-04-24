# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amuriel <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/23 12:59:42 by amuriel           #+#    #+#              #
#    Updated: 2021/04/23 20:38:19 by amuriel          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#command for enter in container
# kubectl exec -it deploy/grafana-deployment -- /bin/sh
#

FROM alpine:3.12.7

RUN apk update
RUN apk add supervisor
RUN apk add openrc
RUN apk add vim
RUN apk add wget
RUN apk add tar
RUN apk add telegraf\
	--repository http://dl-cdn.alpinelinux.org/alpine/edge/community/\
	--allow-untrusted\
	--no-cache

RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.5.4.linux-amd64.tar.gz
RUN tar -xf grafana-enterprise-7.5.4.linux-amd64.tar.gz --strip-components=1 -C /
RUN rm grafana-enterprise-7.5.4.linux-amd64.tar.gz

RUN apk --no-cache add ca-certificates
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk
RUN apk add glibc-2.28-r0.apk

COPY ./supervisord.conf /etc/supervisord.conf
COPY ./telegraf.conf /etc/telegraf/
# COPY ./grafana.db /data/

EXPOSE 3000

CMD ["/usr/bin/supervisord"]
