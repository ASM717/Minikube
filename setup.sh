# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amuriel <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 13:32:23 by amuriel           #+#    #+#              #
#    Updated: 2021/04/08 16:55:22 by amuriel          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

minikube start --vm-driver=virtualbox
minikube addons enable dashboard
minikube addons enable metallb
minikube addons enable metrics-server
minikube addons list

eval $(minikube docker-env)

docker build -t nginx_image srcs/nginx
kubectl apply -f srcs/metallb.yaml
kubectl apply -f ./srcs/nginx/nginx.yaml

# sleep 20

# kubectl get pods
minikube dashboard
