#!/bin/bash

echo "Setup daemon.conf"
echo "DbHost = "$DB_HOST
echo "DbPort = "$DB_PORT
echo "DbName = "$DB_NAME
echo "DbUser = "$DB_USER
echo "DbPass = "$DB_PASS

echo "DbHost = "$DB_HOST > /etc/p4d/daemon.conf
echo "DbPort = "$DB_PORT >> /etc/p4d/daemon.conf
echo "DbName = "$DB_NAME >> /etc/p4d/daemon.conf
echo "DbUser = "$DB_USER >> /etc/p4d/daemon.conf
echo "DbPass = "$DB_PASS >> /etc/p4d/daemon.conf

echo "Setup ssmtp.conf"
echo "root="$SMTP_MAIL_FROM
echo "mailhub="$SMTP_SERVER
echo "hostname="$SMTP_NAME
echo "FromLineOverride=YES"
echo "UseTLS="$SMTP_TLS
echo "UseSTARTTLS="$SMTP_STARTTLS
echo "AuthUser="$SMTP_USERNAME
echo "AuthPass="$SMTP_PASSWORD

echo "root="$SMTP_MAIL_FROM > /etc/ssmtp/ssmtp.conf
echo "mailhub="$SMTP_SERVER >> /etc/ssmtp/ssmtp.conf
echo "hostname="$SMTP_NAME >> /etc/ssmtp/ssmtp.conf
echo "FromLineOverride=YES" >> /etc/ssmtp/ssmtp.conf
echo "UseTLS="$SMTP_TLS >> /etc/ssmtp/ssmtp.conf
echo "UseSTARTTLS="$SMTP_STARTTLS >> /etc/ssmtp/ssmtp.conf
echo "AuthUser="$SMTP_USERNAME >> /etc/ssmtp/ssmtp.conf
echo "AuthPass="$SMTP_PASSWORD >> /etc/ssmtp/ssmtp.conf

echo "root:"$SMTP_MAIL_FROM:$SMTP_SERVER

echo "root:"$SMTP_MAIL_FROM:$SMTP_SERVER >> /etc/ssmtp/revaliases

echo "Start p4d"
/usr/bin/p4d -n -t

