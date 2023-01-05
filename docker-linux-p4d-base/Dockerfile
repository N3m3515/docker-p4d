# raspbian Base Image
FROM debian:bullseye
# Update Repository
#RUN echo "deb http://deb.debian.org/debian bullseye main contrib non-free" > /etc/apt/sources.list \
#    && echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list \
#    && echo "deb http://deb.debian.org/debian bullseye-updates main contrib non-free" >> /etc/apt/sources.list  
RUN apt-get update
# Upgrade Packets
RUN apt-get upgrade
# install Dependencies
RUN apt-get install -y sudo locales libpython3.7 libssl1.1 libjansson4 libxml2 openssl libmariadb3 bsd-mailx msmtp msmtp-mta libcurl4 mosquitto mosquitto-clients libuuid1 python3 rsyslog libcap-dev
# Add User p4d and give Privileges
ENV USER p4d
RUN useradd --create-home -s /bin/bash ${USER}
RUN echo "${USER} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USER}
#WORKDIR /home/${USER}
USER ${USER}
#Add German locales
RUN sudo touch /usr/share/locale/locale.alias
RUN sudo sed -i '/de_DE.UTF-8/s/^# //g' /etc/locale.gen && sudo locale-gen
ENV LANG de_DE.UTF-8
ENV LANGUAGE de_DE.UTF-8
ENV LC_ALL de_DE.UTF-8
#export ENV
RUN set -o allexport


