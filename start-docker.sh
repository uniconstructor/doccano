#!/bin/bash -ex
apt install -y git
#docker build -t doccano:latest . -f docker/Dockerfile
git clone https://github.com/doccano/doccano.git
cd doccano
cd docker
cp .env.example .env
#docker run -v /var/run/docker.sock:/var/run/docker.sock docker:latest
#docker run --rm -v /var/run/docker.sock:/var/run/docker.sock docker:latest version
#docker-compose -f docker-compose.prod.yml --env-file .env up
docker pull doccano/doccano
docker container create --name doccano \
  -e "ADMIN_USERNAME=admin" \
  -e "ADMIN_EMAIL=admin@example.com" \
  -e "ADMIN_PASSWORD=password" \
  -v doccano-db:/data \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -p 80:8000 doccano/doccano
docker container start doccano
