FROM ubuntu:trusty
RUN apt-get update && apt-get -y install sed wget dialog
RUN wget -O /etc/apt/sources.list http://repo.ci.percona.com/docker-configs/ubuntu-source-list.template
RUN sed -i 's:@@DIST@@:trusty:g' /etc/apt/sources.list
RUN apt-get update && apt-get -y dist-upgrade 
RUN apt-get -y install cmake devscripts make gcc g++ openssh-server openssh-client openjdk-7-jre-headless
RUN apt-get -y install git debhelper libbz2-dev libsnappy-dev zlib1g-dev libzlcore-dev
RUN /etc/init.d/ssh restart
RUN adduser --disabled-password --gecos "" jenkins
RUN echo 'jenkins:jenkins123!' | chpasswd

