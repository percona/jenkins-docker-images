FROM debian:wheezy
RUN apt-get update && apt-get -y install sed wget dialog
RUN apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A
RUN wget -O /etc/apt/sources.list http://repo.ci.percona.com/docker-configs/debian-source-list.template
RUN sed -i 's:@@DIST@@:wheezy:g' /etc/apt/sources.list
RUN wget -O /etc/apt/sources.list.d/percona-dev.list http://jenkins.percona.com/apt-repo/percona-dev.list.template
RUN sed -i 's:@@DIST@@:wheezy:g' /etc/apt/sources.list.d/percona-dev.list
RUN apt-get update && apt-get -y dist-upgrade 
RUN apt-get -y install cmake devscripts make gcc g++ openssh-server openssh-client openjdk-7-jre-headless
RUN apt-get -y install apt-utils git debhelper libbz2-dev libsnappy-dev zlib1g-dev libzlcore-dev
RUN apt-get -y install golang scons libssl-dev librocksdb-dev
RUN /etc/init.d/ssh restart 
RUN mkdir -p /var/run/sshd
#
RUN adduser --disabled-password --gecos "" jenkins
RUN echo 'jenkins:jenkins123!' | chpasswd
#
EXPOSE 22
