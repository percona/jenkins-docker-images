FROM ubuntu:vivid
RUN apt-get update && apt-get -y install sed wget dialog
RUN apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A
# RUN wget -O /tmp/1.deb http://apt.puppetlabs.com/puppetlabs-release-vivid.deb
# RUN dpkg -i /tmp/1.deb
RUN apt-get -y update && apt-get -y dist-upgrade
RUN apt-get -y install puppet
ENV HOSTNAME vps-d-vivid-x64.ci.percona.com
RUN puppet agent --enable && puppet agent -t --server=jenkins.percona.com || true
RUN puppet agent -t || true
RUN echo 'jenkins:jenkins123!' | chpasswd
#
EXPOSE 22
