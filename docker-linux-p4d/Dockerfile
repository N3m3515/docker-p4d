# P4D Base Image
FROM linux_p4d-base
#Copy Precompiled binaries to root directory
COPY binaries/ /
# Epose TCP Port 1111
EXPOSE 1111
# Run Daemon
CMD /usr/local/bin/p4d
CMD ["bash", "tail -f /var/log/p4d.log"]
