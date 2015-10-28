FROM ubuntu:wily
RUN apt-get update && apt-get -y install sed wget dialog
RUN apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A
RUN apt-get -y update && apt-get -y dist-upgrade
RUN apt-get -y install puppet
ENV HOSTNAME vps-d-wily-x64.ci.percona.com
RUN puppet agent --enable 
RUN puppet agent -t --server=jenkins.percona.com || true
RUN puppet agent -t || true
RUN echo 'jenkins:jenkins123!' | chpasswd
#
EXPOSE 22
