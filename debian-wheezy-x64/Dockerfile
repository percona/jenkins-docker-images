FROM debian:wheezy
RUN apt-get update && apt-get -y install sed wget dialog
RUN wget -O /etc/apt/sources.list http://repo.ci.percona.com/docker-configs/debian-source-list.template
RUN sed -i 's:@@DIST@@:wheezy:g' /etc/apt/sources.list
RUN apt-get update && apt-get -y dist-upgrade 
RUN apt-get -y install cmake devscripts make gcc g++ openssh-server openssh-client openjdk-6-jre-headless
RUN apt-get -y install apt-utils git debhelper libbz2-dev libsnappy-dev zlib1g-dev libzlcore-dev
RUN /etc/init.d/ssh restart 
RUN mkdir -p /var/run/sshd
#
RUN adduser --disabled-password --gecos "" jenkins
RUN echo 'jenkins:jenkins123!' | chpasswd

