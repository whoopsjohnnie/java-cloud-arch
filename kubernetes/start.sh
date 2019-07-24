#!/bin/sh

set -x

kubectl apply -f ./namespace.yaml

kubectl apply -f ./authentication-deployment.yaml
kubectl apply -f ./authentication-service.yaml

kubectl apply -f ./tomcat-deployment.yaml
kubectl apply -f ./tomcat-service.yaml
