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
apt-get install -y docker-ce-rootless-extras
#curl -fsSL https://get.docker.com -o get-docker.sh
#chmod +x get-docker.sh
#sh get-docker.sh
curl -fsSL https://get.docker.com/rootless | sh
export PATH=/home/$USER/bin:$PATH
export DOCKER_HOST=unix:///run/$USER/1000/docker.sock
#service docker status
#dockerd

#curl -L "https://github.com/docker/compose/releases/download/v2.29.7/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
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
./docker-compose -f docker-compose.prod.yml --env-file .env up
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
