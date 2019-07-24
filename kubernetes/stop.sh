#!/bin/sh

set -x

kubectl delete -f ./tomcat-service.yaml
kubectl delete -f ./tomcat-deployment.yaml

kubectl delete -f ./authentication-service.yaml
kubectl delete -f ./authentication-deployment.yaml

kubectl delete -f ./namespace.yaml
