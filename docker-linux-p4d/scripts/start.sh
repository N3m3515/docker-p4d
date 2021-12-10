#!/bin/bash
touch /home/p4d/daemon.conf
touch /home/p4d/msmtprc

echo "Setup daemon.conf"
echo "DbHost = "$DB_HOST
echo "DbPort = "$DB_PORT
echo "DbName = "$DB_NAME
echo "DbUser = "$DB_USER
echo "DbPass = "$DB_PASS

echo "DbHost = "$DB_HOST > /home/p4d/daemon.conf
echo "DbPort = "$DB_PORT >> /home/p4d/daemon.conf
echo "DbName = "$DB_NAME >> /home/p4d/daemon.conf
echo "DbUser = "$DB_USER >> /home/p4d/daemon.conf
echo "DbPass = "$DB_PASS >> /home/p4d/daemon.conf

echo "Setup msmtprc"
echo "defaults" > /home/p4d/msmtprc
echo "port "$SMTP_PORT >> /home/p4d/msmtprc
echo "tls_trust_file /etc/ssl/certs/ca-certificates.crt" >> /home/p4d/msmtprc
echo "logfile        /var/log/msmtp.log" >> /home/p4d/msmtprc
echo "account "$SMTP_MAIL_FROM >> /home/p4d/msmtprc
echo "from "$SMTP_MAIL_FROM >> /home/p4d/msmtprc
echo "tls "$SMTP_TLS >> /home/p4d/msmtprc
echo "host "$SMTP_SERVER >> /home/p4d/msmtprc
echo "auth "$SMTP_AUTH >> /home/p4d/msmtprc
echo "user "$SMTP_USERNAME >> /home/p4d/msmtprc
echo "password "$SMTP_PASSWORD >> /home/p4d/msmtprc
echo "account default: "$SMTP_MAIL_FROM >> /home/p4d/msmtprc

echo "defaults"
echo "port "$SMTP_PORT
echo "tls_trust_file /etc/ssl/certs/ca-certificates.crt"
echo "logfile        /var/log/msmtp.log"
echo "account "$SMTP_MAIL_FROM
echo "tls "$SMTP_TLS
echo "host "$SMTP_SERVER
echo "auth "$SMTP_AUTH
echo "user "$SMTP_USERNAME
echo "password "$SMTP_PASSWORD
echo "account default : "$SMTP_MAIL_FROM

/home/p4d/p4d.sh
