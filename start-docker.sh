#!/bin/bash -ex
#apt install -y git
#docker build -t doccano:latest . -f docker/Dockerfile
#git clone https://github.com/doccano/doccano.git
#cd doccano
apt-get update
apt-get -y install curl
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
#curl -L "https://github.com/docker/compose/releases/download/v2.29.7/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#chmod +x /usr/local/bin/docker-compose
#ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose


cd docker
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
