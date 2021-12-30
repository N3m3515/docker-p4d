# P4D Base Image
FROM linux_p4d-base
#Copy Precompiled binaries to root directory
COPY root/ /
COPY scripts/ /home/p4d/
COPY images/slate.jpg /var/lib/p4d/img/backgrounds/
COPY images/wood.jpg /var/lib/p4d/img/backgrounds/
COPY images/blue_wood.jpg /var/lib/p4d/img/backgrounds/
COPY images/leather.jpg /var/lib/p4d/img/backgrounds/
COPY images/putz.jpg /var/lib/p4d/img/backgrounds/
RUN sudo touch /var/log/p4d.log
# Epose TCP Port 1111
EXPOSE 1111
# Healthcheck
HEALTHCHECK --interval=10s --retries=5 --start-period=5s --timeout=5s CMD sudo /usr/bin/p4 getv -a 1 || exit 1
# Run Daemon
CMD ["sudo","-E","/home/p4d/start.sh"]
