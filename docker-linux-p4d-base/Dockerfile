# Debian Base Image from https://hub.docker.com/r/balenalib/raspberrypi3-debian
FROM balenalib/rpi-raspbian:buster

RUN apt-get update
# && apt-get install -y wget git build-essential pkg-config libssl-dev libjansson-dev libxml2-dev libcurl4-openssl-dev libssl-dev libmariadbclient-dev libmariadb-dev-compat uuid-dev cmake libcap-dev ssmtp mailutils haveged python3-dev wiringpi

#RUN wget www.jwendel.de/p4d/p4d-latest.deb -O /tmp/p4d-latest.deb

#RUN apt -y install /tmp/p4d-latest.deb

RUN apt-get install -y haveged python3-dev wiringpi bsd-mailx galera-3 gawk iproute2 libaio1 libbsd0 libcap2-bin libconfig-inifiles-perl libdbi-perl libelf1 libev4 liblockfile-bin liblockfile1 libmnl0 libmosquitto1 libpopt0 libprotobuf17 libpython-stdlib libpython2-stdlib libreadline5 libsigsegv2 libsnappy1v5 libtinfo5 libwebsockets8 libxtables12 lsof mariadb-client-10.3 mariadb-client-core-10.3 mosquitto mosquitto-clients msmtp msmtp-mta psmisc python python-minimal python-mysql.connector python-pkg-resources python-protobuf python-six python2 python2-minimal python2.7 python2.7-minimal rsync sensible-utils socat ucf

RUN apt-get install -y ssmtp mailutils libxml2 libjansson4
#RUN cd /usr/src/

#RUN git clone https://libwebsockets.org/repo/libwebsockets libwebsockets

#RUN cd libwebsockets && mkdir build && cd build && cmake .. && make -s && make -s install

#RUN dpkg --purge p4d
#RUN cd /usr/src/ && rm -r libwebsockets

#RUN git clone https://github.com/horchi/linux-p4d/

#RUN cd linux-p4d/ && make clean all && make install

#RUN cd /usr/src/ && rm -r linux-p4d/


