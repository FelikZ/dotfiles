#!/bin/bash

USER=user

yum update -y
yum install -y epel-release python-pip vim htop git
tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF
yum install -y docker-engine
chkconfig docker on
usermod -aG docker $USER
service docker start
pip install --upgrade pip && pip install docker-compose && pip install --upgrade docker-compose
mkdir -p /usr/lib/systemd/system/docker.service.d
tee /usr/lib/systemd/system/docker.service.d/docker.conf <<-'EOF'
[Service]
ExecStart=
ExecStart=/usr/bin/docker daemon --insecure-registry docker-reg.textkernel.local:5000 --storage-opt dm.basesize=100G
EOF
systemctl daemon-reload
service docker restart
docker run --rm hello-world