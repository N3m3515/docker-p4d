# P4D Base Image
FROM linux_p4d-base
#Copy Precompiled binaries to root directory
COPY root/ /
COPY scripts/ /home/p4d/
# Epose TCP Port 1111
EXPOSE 1111
# Run Daemon
CMD ["sudo","-E","/home/p4d/start.sh"]
