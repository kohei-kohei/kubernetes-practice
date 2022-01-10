FROM centos:7

# systemd base image
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
    systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]

# クラスタノードの準備
RUN yum install -y sudo libselinux-utils

# コンテナランタイムの準備
RUN yum remove docker \
               docker-client \
               docker-client-latest \
               docker-common \
               docker-selinux \
               docker-latest \
               docker-latest-logrotate \
               docker-logrotate \
               docker-engine 
RUN yum install -y yum-utils device-mapper-persistent-data lvm2
RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN yum makecache fast && yum update -y
RUN yum install -y docker-ce-18.09.6-3.el7 docker-ce-cli-18.09.6-3.el7 containerd.io

COPY ./config/k8s.conf /etc/sysctl.d/k8s.conf
COPY ./config/daemon.json /etc/docker/daemon.json
COPY preparation.sh ./preparation.sh
