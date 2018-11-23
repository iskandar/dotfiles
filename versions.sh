#!/usr/bin/env bash

set +e  # Allow non-zero exit codes
set -x  # Echo all commands

# Dump version for lots of things
# This can help with troubleshooting


# General Mac OS
sw_vers
uname -av
system_profiler SPHardwareDataType -detailLevel mini
system_profiler SPSoftwareDataType -detailLevel mini| grep -v "Time since boot"

echo $BASH_VERSION

# Java
java -version
groovy -version

mvn -version
gradle -version

# JavaScript
node --version
npm --version
npm list -g

yo --version
yarn --version
yarn global list

# Python
python --version
pip --version
pip freeze

# Python 3
python3 --version
pip3 --version
pip3 freeze

# PowerShell
pwsh -V
pwsh -Command Get-InstalledModule

# Docker
docker --version
docker-compose --version
docker-machine  --version

# Hashicorp
terraform version
packer version
vault version
terragrunt --version

# K8s
minikube version
kubectl version --client
helm version --client
draft version

# CLIs
aws --version
gcloud --version
az --version
vsts --version
jx --version


How to use a gist to track your versions
