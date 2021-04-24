# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amuriel <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/17 12:00:37 by amuriel           #+#    #+#              #
#    Updated: 2021/04/23 20:37:40 by amuriel          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#command for enter in container
# kubectl exec -it deploy/ftps-deployment -- /bin/sh
#

FROM alpine:3.12.7

RUN apk update
RUN apk add vsftpd
RUN apk add supervisor
RUN apk add vim
RUN apk add openssh
RUN apk add openssl
RUN apk add openrc
RUN apk add	libc6-compat
RUN apk add bash
RUN apk add telegraf\
	--repository http://dl-cdn.alpinelinux.org/alpine/edge/community/\
	--allow-untrusted\
	--no-cache

RUN mkdir -p home/user/ && chmod -R 777 home/
RUN mkdir -p /etc/ssl/vsftpd/ && chmod -R 777 /etc/ssl/vsftpd/

# install ssl
RUN openssl req -x509 -nodes -days 365\
	-subj "/C=RU/ST=Moscow/L=Moscow/O=21 SCHOOL/OU=AMURIEL/CN=certificate ssl html"\
	-newkey rsa:2048\
	-keyout /etc/ssl/vsftpd/ftpd.key\
	-out /etc/ssl/vsftpd/ftpd.crt

# install ssh
RUN adduser -D user && echo "user:amuriel" | chpasswd

COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./telegraf.conf /etc/telegraf/
COPY ./supervisord.conf /etc/supervisord.conf

EXPOSE 21 21000

# CMD /usr/bin/supervisord -c /etc/supervisord.conf
CMD ["/usr/bin/supervisord"]
