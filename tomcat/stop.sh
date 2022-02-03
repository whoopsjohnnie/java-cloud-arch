#!/bin/sh

set -x

docker kill loadbalancer1
docker rm loadbalancer1

docker kill tomcat1
docker rm tomcat1

docker kill tomcat2
docker rm tomcat2

docker kill tomcat3
docker rm tomcat3

docker kill tomcat4
docker rm tomcat4

docker network rm tomcat-cluster

