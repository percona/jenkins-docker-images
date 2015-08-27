FROM centos:7
MAINTAINER Alexey Bychko <alexey.bychko@percona.com>
RUN yum clean all && yum -y install wget
RUN wget -O /tmp/1.rpm http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
RUN rpm -i /tmp/1.rpm
RUN yum -y upgrade
RUN yum -y install puppet
ENV HOSTNAME vps-d-ce7-x64.ci.percona.com
RUN puppet agent -t --server=jenkins.percona.com || true
RUN rpm -qa | grep jemalloc | xargs yum -y erase || true
RUN puppet agent -t || true
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_ecdsa_key && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key 
RUN echo 'jenkins:jenkins123!' | chpasswd
#
EXPOSE 22
