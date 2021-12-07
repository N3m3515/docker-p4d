# docker-p4d

Build Base image in docker-linux-p4d-base Directory:

sudo docker build -t "linux_p4d-base" .

After that Build Final Image in docker-linux-p4d Directory:

sudo docker build -t "linux_p4d:0.8.9" .
