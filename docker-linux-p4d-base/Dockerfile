# raspbian Base Image
FROM balenalib/rpi-raspbian:buster
# Update Repository
RUN apt-get update
# install Dependencies
RUN apt-get install -y sudo haveged python3-dev wiringpi bsd-mailx galera-3 gawk iproute2 libaio1 libbsd0 libcap2-bin libconfig-inifiles-perl libdbi-perl libelf1 libev4 liblockfile-bin liblockfile1 libmnl0 libmosquitto1 libpopt0 libprotobuf17 libpython-stdlib libpython2-stdlib libreadline5 libsigsegv2 libsnappy1v5 libtinfo5 libwebsockets8 libxtables12 lsof mariadb-client-10.3 mariadb-client-core-10.3 mosquitto mosquitto-clients msmtp msmtp-mta psmisc python python-minimal python-mysql.connector python-pkg-resources python-protobuf python-six python2 python2-minimal python2.7 python2.7-minimal rsync sensible-utils socat ucf
RUN apt-get install -y ssmtp mailutils libxml2 libjansson4



