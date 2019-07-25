#!/bin/sh

set -x

#
# kubectl delete -f traefik-ingress.yaml
# kubectl delete -f traefik-webui-svc.yaml
# kubectl delete -f traefik-svc.yaml
# kubectl delete -f traefik-deployment.yaml
# kubectl delete -f traefik-crb.yaml
# kubectl delete -f traefik-cr.yaml
# kubectl delete -f traefik-service-acc.yaml


# kubectl delete -f ./tomcat-ingress.yaml
kubectl delete -f ./tomcat-service.yaml
kubectl delete -f ./tomcat-deployment.yaml

# kubectl delete -f ./authentication-ingress.yaml
kubectl delete -f ./authentication-service.yaml
kubectl delete -f ./authentication-deployment.yaml

kubectl delete -f ./namespace.yaml
