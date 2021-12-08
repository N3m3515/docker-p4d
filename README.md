# docker-p4d

Build Base image in docker-linux-p4d-base Directory:

sudo docker build -t "linux_p4d-base" .

To build the p4d binaries:

make install DESTDIR=/docker-linux-p4d/root/ PREFIX=/usr

After that Build Final Image in docker-linux-p4d Directory:

sudo docker build -t "linux_p4d:0.8.9" .
