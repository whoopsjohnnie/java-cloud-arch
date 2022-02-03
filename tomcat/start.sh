#!/bin/sh

set -x

docker network create tomcat-cluster

docker run --restart unless-stopped -d -p 8080:8080 --network tomcat-cluster --name tomcat1 org.name/tomcat:latest 
docker run --restart unless-stopped -d -p 8081:8080 --network tomcat-cluster --name tomcat2 org.name/tomcat:latest 
docker run --restart unless-stopped -d -p 8082:8080 --network tomcat-cluster --name tomcat3 org.name/tomcat:latest 
docker run --restart unless-stopped -d -p 8083:8080 --network tomcat-cluster --name tomcat4 org.name/tomcat:latest 

docker run --restart unless-stopped -d -p 80:80 -p 8404:8404 --network tomcat-cluster --name loadbalancer1 -v $(pwd)/config/haproxy:/usr/local/etc/haproxy haproxytech/haproxy-alpine:2.4

