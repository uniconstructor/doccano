#!/bin/bash -ex
yum update -y
# Install git
yum install -y git
yum install -y python3
yum install -y python3-pip
pip3 –V
yum install -y python3-pipx
pipx ensurepath

# Install Docker
#yum install -y docker
#systemctl enable docker
#systemctl start docker

# Install docker compose
#curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#chmod +x /usr/local/bin/docker-compose
#ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Install poetry
pipx install poetry
#export POETRY_HOME=/opt/poetry
#python3 -m venv $POETRY_HOME
#$POETRY_HOME/bin/pip install poetry==1.2.0
#$POETRY_HOME/bin/poetry --version
#curl -sSL https://install.python-poetry.org | python3 -
#chmod +x /usr/local/bin/poetry
#ln -s /usr/local/bin/poetry /usr/bin/poetry

# clone doccano
git clone https://github.com/doccano/doccano.git
cd doccano
#cp docker/.env.example .env
#docker-compose -f docker/docker-compose.prod.yml up -d

cd backend
poetry install
poetry shell
python manage.py migrate
python manage.py create_roles
python manage.py create_admin --noinput --username "admin" --email "admin@example.com" --password "password"
python manage.py runserver & disown

yum install -y yarn
cd ..
cd frontend
yarn install
yarn dev & disown

