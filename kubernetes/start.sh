#!/bin/sh

set -x

kubectl apply -f ./namespace.yaml

kubectl apply -f ./authentication-deployment.yaml
kubectl apply -f ./authentication-service.yaml
# kubectl apply -f ./authentication-ingress.yaml

kubectl apply -f ./tomcat-deployment.yaml
kubectl apply -f ./tomcat-service.yaml
# kubectl apply -f ./tomcat-ingress.yaml


# 
# kubectl create -f traefik-service-acc.yaml
# kubectl create -f traefik-cr.yaml
# kubectl create -f traefik-crb.yaml
# kubectl create -f traefik-deployment.yaml
# kubectl create -f traefik-svc.yaml
# kubectl create -f traefik-webui-svc.yaml
# kubectl create -f traefik-ingress.yaml
