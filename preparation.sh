#!/bin/sh
sudo swapoff -a
sudo sysctl --system
sudo setenforce 0
sudo sed -i 's/^SELINUX=.*/SELINUX=permissive/' /etc/selinux/config

mkdir -p /etc/systemd/system/docker.service.d
# dockerを再起動
systemctl enable docker
systemctl daemon-reload
systemctl start docker