# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amuriel <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 13:32:23 by amuriel           #+#    #+#              #
#    Updated: 2021/04/06 18:33:41 by amuriel          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

minikube start --vm-driver=virtualbox
minikube addons enable dashboard
minikube addons enable ingress
minikube addons enable metallb

#minikube dashboard
eval $(minikube docker-env)


kubectl apply -f srcs/metallb.yaml

kubectl apply -f srcs/nginx/nginx.yaml

sleep 20

kubectl get pods
