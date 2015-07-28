FROM centos:7
MAINTAINER Alexey Bychko <alexey.bychko@percona.com>
RUN yum clean all && yum -y install wget
RUN wget -O /etc/yum.repos.d/percona-dev.repo http://jenkins.percona.com/yum-repo/percona-dev.repo
RUN wget -O /tmp/1.rpm https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -i /tmp/1.rpm && rm -f /tmp/1.rpm
RUN yum clean all && yum -y upgrade
# RPM build
RUN yum clean all && yum -y install selinux-policy selinux-policy-devel rpmlint redhat-rpm-config rpm-build redhat-lsb
# RocksDB
RUN yum clean all && yum -y install snappy-devel zlib-devel bzip2-devel openssl-devel perl-Time-HiRes
#
RUN yum clean all && yum -y install ncurses-devel readline-devel bison gcc gcc-c++ gperf perl time zlib-devel libaio-devel cmake openssh-server openssh-clients java-1.7.0-openjdk
RUN yum clean all && yum -y install git make pam-devel autoconf automake golang librocksdb-devel
RUN yum clean all && yum -y install python python-devel python-setuptools scons
RUN /usr/bin/easy_install sphinx
RUN /usr/bin/easy_install scons
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_ecdsa_key && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key 
RUN adduser jenkins
RUN echo 'jenkins:jenkins123!' | chpasswd
