# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init_start_db.sh                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amuriel <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/14 16:49:40 by amuriel           #+#    #+#              #
#    Updated: 2021/04/20 12:54:04 by amuriel          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

mariadb-install-db --user=root

mysqld --user=root & sleep 5

mysql --user=root --execute="CREATE DATABASE wordpress;"

mysql --user=root wordpress < mysql-service.sql

mysql --user=root --execute="CREATE USER 'root'@'%' IDENTIFIED BY 'amuriel';
							GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
							USE wordpress;
							FLUSH PRIVILEGES;"

/usr/bin/supervisord -c /etc/supervisord.conf
