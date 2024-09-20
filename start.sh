#!/bin/bash -ex
yum update -y
# Install git
yum install -y git
#yum install -y python
#yum install -y yarn
# Install Docker
yum install -y docker
systemctl enable docker
#systemctl start docker

# Install docker compose
curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose


# Install poetry
#curl -L "https://install.python-poetry.org" -o /usr/local/bin/poetry
#chmod +x /usr/local/bin/poetry
#ln -s /usr/local/bin/poetry /usr/bin/poetry

# clone doccano
git clone https://github.com/doccano/doccano.git
cd doccano
cp docker/.env.example .env
docker-compose -f docker/docker-compose.prod.yml up -d

#cd frontend
#yarn install
#yarn dev & disown

#cd backend
#poetry install
#poetry shell
#python manage.py migrate
#python manage.py create_roles
#python manage.py create_admin --noinput --username "admin" --email "admin@example.com" --password "password"
#python manage.py runserver

