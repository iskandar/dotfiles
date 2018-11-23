#!/usr/bin/env bash

cat > /tmp/requirements.txt <<EOF
boto3==1.9.42
botocore==1.12.42
click==6.7
colorama==0.3.7
docutils==0.14
hashpumpy==1.2
Jinja2==2.10
jmespath==0.9.3
MarkupSafe==1.1.0
packaging==16.8
pyparsing==2.3.0
python-dateutil==2.7.5
PyYAML==3.13
s3transfer==0.1.13
sceptre==1.4.2
six==1.11.0
urllib3==1.24.1
EOF

pip3 install --user -r /tmp/requirements.txt
rm -vf /tmp/requirements.txt
