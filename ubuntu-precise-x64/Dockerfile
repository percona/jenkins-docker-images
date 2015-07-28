FROM ubuntu:precise
RUN apt-get update && apt-get -y install python-software-properties sed wget dialog
RUN wget -O /etc/apt/sources.list http://repo.ci.percona.com/docker-configs/ubuntu-source-list.template
RUN sed -i 's:@@DIST@@:precise:g' /etc/apt/sources.list
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get update && apt-get -y dist-upgrade 
RUN apt-get -y install cmake devscripts make gcc g++ openssh-server openssh-client openjdk-6-jre-headless
RUN apt-get -y install git debhelper libbz2-dev libsnappy-dev zlib1g-dev libzlcore-dev gcc-4.8 g++-4.8
RUN restart ssh 
RUN mkdir -p /var/run/sshd
#
RUN adduser --disabled-password --gecos "" jenkins
RUN echo 'jenkins:jenkins123!' | chpasswd

