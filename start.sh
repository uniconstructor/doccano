#!/bin/bash -ex
yum update -y
# Install git
yum install -y git
yum install -y python
yum install -y python-pip
#yum install -y yarn
yum install -y sudo
#curl --silent --location https://rpm.nodesource.com/setup_12.x | bash -
#yum install https://rpm.nodesource.com/pub_21.x/nodistro/repo/nodesource-release-nodistro-1.noarch.rpm -y
#yum install nodejs -y --setopt=nodesource-nodejs.module_hotfixes=1
curl -fsSL https://rpm.nodesource.com/setup_22.x -o nodesource_setup.sh
chmod +x nodesource_setup.sh
bash nodesource_setup.sh
yum install -y nodejs
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo
yum install -y yarn

python -m pip install --user pipx
python -m pipx ensurepath
python -m pipx ensurepath --global

# Install Docker
#yum install -y docker
#systemctl enable docker
#systemctl start docker

# Install docker compose
#curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#chmod +x /usr/local/bin/docker-compose
#ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Install poetry
python -m pip install poetry
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
python -m poetry install
#python -m poetry shell
source $(python -m poetry env info --path)/bin/activate
python manage.py migrate
python manage.py create_roles
python manage.py create_admin --noinput --username "admin" --email "admin@example.com" --password "password"
python manage.py runserver & disown

cd ..
cd frontend
yarn install
yarn dev & disown

