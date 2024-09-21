#!/bin/bash -ex
yum update -y
yum install -y git
yum install -y python
yum install -y python-pip

python -m pip install --user pipx
python -m pipx ensurepath
python -m pipx ensurepath --global
python -m pipx install setuptools 
python -m pipx install doccano 

python -m pipx run doccano init
python -m pipx run doccano createuser --username admin --password password
python -m pipx run doccano webserver --port 80 & disown
python -m pipx run doccano task & disown
