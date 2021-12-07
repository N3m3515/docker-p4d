# P4D Base Image
FROM linux_p4d-base
#Copy Precompiled binaries to root directory
COPY binaries/ /
# Epose TCP Port 1111
EXPOSE 1111
# Add User p4d and give Privileges
ENV USER p4d
RUN useradd --create-home -s /bin/bash ${USER}
RUN echo "${USER} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USER}
WORKDIR /home/${USER}
USER ${USER}
# Run Daemon
CMD ["sudo","/usr/local/bin/p4d","-n"]
