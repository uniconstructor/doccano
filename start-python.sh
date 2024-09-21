#!/bin/bash -ex
yum update -y
yum install -y git
yum install -y python
yum install -y python-pip

python -m pip install --user pipx
python -m pipx ensurepath
python -m pipx ensurepath --global
python -m pip install doccano 

python -m doccano init
python -m doccano createuser --username admin --password password
python -m doccano webserver --port 80 & disown
python -m doccano task & disown
