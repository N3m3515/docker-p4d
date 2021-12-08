#!/bin/bash

#Setup daemon.conf

echo DbHost = $DB_HOST > /etc/p4d/daemon.conf
echo DbPort = $DB_PORT >> /etc/p4d/daemon.conf
echo DbName = $DB_NAME >> /etc/p4d/daemon.conf
echo DbUser = $DB_USER >> /etc/p4d/daemon.conf
echo DbPass = $DB_PASS >> /etc/p4d/daemon.conf

/usr/bin/p4d -n -t 
