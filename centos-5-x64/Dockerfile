FROM centos:5
MAINTAINER Alexey Bychko <alexey.bychko@percona.com>
RUN yum -y install wget
RUN wget -O /etc/yum.repos.d/percona-dev.repo http://jenkins.percona.com/yum-repo/percona-dev.repo
RUN wget -O /tmp/1.rpm https://dl.fedoraproject.org/pub/epel/epel-release-latest-5.noarch.rpm
RUN rpm -i /tmp/1.rpm && rm -f /tmp/1.rpm
RUN yum -y erase glibc.i686
RUN yum -y upgrade
# RPM build
RUN yum -y install buildsys-macros selinux-policy selinux-policy-devel rpmlint redhat-rpm-config rpm-build redhat-lsb libtool which || true
# RocksDB
RUN yum -y install snappy-devel zlib-devel bzip2-devel scons openssl-devel
#
RUN yum -y install ncurses-devel readline-devel bison gcc gcc-c++ gcc44 gcc44-c++ gperf perl time zlib-devel libaio-devel cmake openssh-server openssh-clients java-1.7.0-openjdk
RUN yum clean all && yum -y install percona-devtoolset-gcc percona-devtoolset-binutils percona-devtoolset-gcc-c++ percona-devtoolset-libstdc++-devel
RUN yum -y install git make pam-devel autoconf automake valgrind-devel libeatmydata
RUN yum -y install python26 python26-devel python26-setuptools python-sphinx
RUN mkdir -p /usr/local && cd /usr/local && git clone https://github.com/percona/percona-subunit2junitxml.git
RUN ln -s /usr/local/percona-subunit2junitxml/subunit2junitxml /usr/bin/subunit2junitxml
RUN /etc/init.d/sshd restart
RUN adduser jenkins
RUN echo 'jenkins:jenkins123!' | chpasswd
#
EXPOSE 22
