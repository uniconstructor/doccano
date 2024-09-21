#!/bin/bash -ex
#apt install -y git
#docker build -t doccano:latest . -f docker/Dockerfile
#git clone https://github.com/doccano/doccano.git
#cd doccano
apt-get update
apt-get install -y ca-certificates 
apt-get install -y curl 
apt-get install -y apt-utils
apt-get install -y dbus-user-session
apt-get install -y uidmap
apt-get install -y systemd-container
apt-get install -y install sudo

#curl -fsSL https://get.docker.com -o get-docker.sh
#chmod +x get-docker.sh
#sh get-docker.sh
# Add Docker's official GPG key:
apt-get install ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update

apt-get install -y docker 
#docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose docker-compose-plugin docker-ce-rootless-extras
apt-get install -y docker-compose
apt-get install -y docker-compose-plugin
apt-get install -y docker.io
apt-get install -y rootlesskit
#curl -fsSL https://get.docker.com/rootless | sh
#dockerd-rootless-setuptool.sh install
#export PATH=/home/$USER/bin:$PATH
#export DOCKER_HOST=unix:///run/$USER/1000/docker.sock
#service docker status
dockerd
service dockerd start
service dockerd status
#dockerd

#curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#chmod +x /usr/local/bin/docker-compose
#ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

cd docker
#curl -L "https://github.com/docker/compose/releases/download/v2.29.7/docker-compose-$(uname -s)-$(uname -m)" -o docker-compose
#chmod +x docker-compose
#cp ./docker-compose /usr/bin/docker-compose
#cp ./docker-compose /usr/local/bin/docker-compose
cp .env.example .env
#docker run -v /var/run/docker.sock:/var/run/docker.sock docker:latest
#docker run --rm -v /var/run/docker.sock:/var/run/docker.sock docker:latest version
docker-compose -f docker-compose.prod.yml --env-file .env up
#docker pull doccano/doccano
#docker container create --name doccano \
#  -e "ADMIN_USERNAME=admin" \
#  -e "ADMIN_EMAIL=admin@example.com" \
#  -e "ADMIN_PASSWORD=password" \
#  -v doccano-db:/data \
#  --privileged \
#  --docker-volumes /var/run/docker.sock:/var/run/docker.sock \
#  -p 80:8000 doccano/doccano
#docker container start doccano
