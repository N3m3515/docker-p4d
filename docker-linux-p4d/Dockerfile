# P4D Base Image
FROM linux_p4d-base
#Copy Precompiled binaries to root directory
COPY root/ /
COPY scripts/ /home/p4d/
# Epose TCP Port 1111
EXPOSE 1111
# Add User p4d and give Privileges
ENV USER p4d
RUN useradd --create-home -s /bin/bash ${USER}
RUN echo "${USER} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USER}
#WORKDIR /home/${USER}
USER ${USER}
#Add German locales
RUN sudo apt-get install -y locales
RUN sudo touch /usr/share/locale/locale.alias
RUN sudo sed -i '/de_DE.UTF-8/s/^# //g' /etc/locale.gen && sudo locale-gen
ENV LANG de_DE.UTF-8 
ENV LANGUAGE de_DE.UTF-8 
ENV LC_ALL de_DE.UTF-8
#export ENV
RUN set -o allexport
# Run Daemon
CMD ["sudo","-E","/home/p4d/start.sh"]
