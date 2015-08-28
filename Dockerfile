FROM	ubuntu:12.04.5
MAINTAINER	noralee 	https://hub.docker.com/u/noralee/

RUN apt-get update

RUN apt-get install -y openssh-server
RUN apt-get install -y build-essential
RUN apt-get install -y gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf
RUN apt-get install -y unzip
RUN apt-get install -y sudo
RUN apt-get install -y git
RUN apt-get install -y mercurial
RUN apt-get install -y vim
RUN apt-get install -y bc
RUN apt-get install -y u-boot-tools
RUN apt-get install -y device-tree-compiler

ADD dtc /usr/bin/dtc

RUN apt-get install -y ia32-libs

RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

VOLUME ["/media"]

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]
