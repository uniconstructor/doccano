#!/bin/bash -ex
yum update -y
# Install Docker
yum install -y docker
systemctl enable docker
systemctl docker start
# Install docker compose
curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
# Install git
yum install -y git
git clone https://github.com/doccano/doccano.git
cd doccano
cp docker/.env.example .env
docker-compose -f docker/docker-compose.prod.yml up -d
