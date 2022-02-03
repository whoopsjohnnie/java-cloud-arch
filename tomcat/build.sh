#!/bin/sh

set -x

docker build --build-arg WAR_FILE=./sample.war -t org.name/tomcat:latest .

