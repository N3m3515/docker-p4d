cp /home/p4d/daemon.conf /etc/p4d/daemon.conf
cp /home/p4d/ssmtp.conf /etc/ssmtp/ssmtp.conf
cp /home/p4d/revaliases /etc/ssmtp/revaliases

echo "Start p4d"
/usr/bin/p4d -n -t | tee -a /var/log/p4d.log

