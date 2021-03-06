#!/usr/bin/env bash

cat > /tmp/requirements.txt <<EOF
arrow==0.12.1
astroid==2.0.4
awscli-local==0.4
aws-lambda-builders==0.0.2
# AWS SAM CLI
# https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html
aws-sam-cli==0.7.0
aws-sam-translator==1.8.0
binaryornot==0.4.4
boto3==1.9.42
botocore==1.12.42
certifi==2018.10.15
chardet==3.0.4
chevron==0.13.1
click==6.7
colorama==0.3.7
cookiecutter==1.6.0
dateparser==0.7.0
docker==3.5.1
docker-pycreds==0.3.0
docutils==0.14
Flask==1.0.2
future==0.17.1
hashpumpy==1.2
idna==2.7
isort==4.3.4
itsdangerous==1.1.0
Jinja2==2.10
jinja2-time==0.2.0
jmespath==0.9.3
jsonschema==2.6.0
lazy-object-proxy==1.3.1
MarkupSafe==1.1.0
mccabe==0.6.1
packaging==16.8
poyo==0.4.2
pylint==2.1.1
pyparsing==2.3.0
python-dateutil==2.7.5
pytz==2018.7
PyYAML==3.13
regex==2018.11.22
requests==2.20.1
s3transfer==0.1.13
sceptre==1.4.2
six==1.11.0
tzlocal==1.5.1
urllib3==1.24.1
websocket-client==0.54.0
Werkzeug==0.14.1
whichcraft==0.5.2
wrapt==1.10.11
EOF

pip3 install --user -r /tmp/requirements.txt
rm -vf /tmp/requirements.txt
