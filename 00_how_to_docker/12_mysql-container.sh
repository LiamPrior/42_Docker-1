#!/bin/sh
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    12_mysql-container.sh                              :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/03 03:29:50 by jaleman           #+#    #+#              #
#    Updated: 2017/08/03 03:29:58 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Include exported enviroment variables
. "./_ENV.sh"

#------------------------------------------------------------------------------#
# 12. Launch a mysql container as a background task. It should be able to
# restart on its own in case of error, and the root password of the database
# should be Kerrigan. You will also make sure that the database is stored in the
# hatchery volume, that the container directly creates a database named
# zerglings, and that the container itself is named spawning-pool.
#------------------------------------------------------------------------------#

# Pulls the container
docker pull mysql

# Runs the container in the background (detached).
DATABASE_ID=$(docker run --detach --restart=on-failure \
                         --name $DATABASE_CONTAINER \
                         --env="MYSQL_DATABASE=$DATABASE_NAME" \
                         --env="MYSQL_ROOT_PASSWORD=$DATABASE_PASS" \
                         --volume $VOLUME_NAME:/var/spool/mysql mysql)
export DATABASE_ID
