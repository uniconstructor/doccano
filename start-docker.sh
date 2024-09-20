#!/bin/bash -ex
apt install -y git
#docker build -t doccano:latest . -f docker/Dockerfile
git clone https://github.com/doccano/doccano.git
cd doccano
cd docker
cp .env.example .env
#docker run -v /var/run/docker.sock:/var/run/docker.sock docker:latest
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock docker:latest version
docker-compose -f docker-compose.prod.yml --env-file .env up
