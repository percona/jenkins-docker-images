FROM centos:6
MAINTAINER Alexey Bychko <alexey.bychko@percona.com>
RUN yum -y install wget
RUN wget -O /tmp/1.rpm http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
RUN rpm -i /tmp/1.rpm
RUN yum -y install puppet
ENV HOSTNAME vps-d-ce6-x64.ci.percona.com
RUN puppet agent -t --server=jenkins.percona.com || true
RUN rpm -qa | grep jemalloc | xargs yum -y erase || true
RUN puppet agent -t || true
RUN echo 'jenkins:jenkins123!' | chpasswd
#
EXPOSE 22
