# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amuriel <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 13:32:23 by amuriel           #+#    #+#              #
#    Updated: 2021/04/27 14:48:46 by amuriel          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

minikube start --vm-driver=virtualbox
minikube addons enable dashboard
minikube addons enable metallb
minikube addons enable metrics-server

eval $(minikube docker-env)

kubectl apply -f srcs/metallb.yaml

docker build -t nginx_image srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml

docker build -t phpmyadmin_image srcs/phpmyadmin
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml

docker build -t mysql_image srcs/mysql
kubectl apply -f ./srcs/mysql/mysql.yaml

docker build -t wordpress_image srcs/wordpress
kubectl apply -f ./srcs/wordpress/wordpress.yaml

docker build -t ftps_image srcs/ftps
kubectl apply -f ./srcs/ftps/ftps.yaml

docker build -t influxdb_image srcs/influxdb
kubectl apply -f ./srcs/influxdb/influxdb.yaml

docker build -t grafana_image srcs/grafana
kubectl apply -f ./srcs/grafana/grafana.yaml

minikube dashboard

#-----------------------------#
# wp		amuriel; amuriel  #
# php		root; amuriel     #
# grafana	admin; amuriel    #
# filezilla	user; amuriel     #
#-----------------------------#

