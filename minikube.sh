#!/usr/bin/env bash

sudo chown root:wheel /usr/local/bin/docker-machine-driver-hyperkit && \
    sudo chmod u+s /usr/local/bin/docker-machine-driver-hyperkit

minikube config set vm-driver hyperkit
minikube config set memory 4096
minikube config set cpu 2

minikube delete
minikube start

minikube addons enable kube-dns
minikube addons enable heapster

minikube stop