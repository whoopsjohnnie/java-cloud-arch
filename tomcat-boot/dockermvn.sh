#!/bin/sh

set -x

# https://hub.docker.com/_/maven
# docker run -it --rm --name my-maven-project -v "$(pwd)":/usr/src/mymaven -w /usr/src/mymaven maven:3.3-jdk-8 mvn clean install
# docker run -it --rm -v "$PWD":/usr/src/mymaven -v "$HOME/.m2":/root/.m2 -v "$PWD/target:/usr/src/mymaven/target" -w /usr/src/mymaven maven mvn clean package

# 3.6.3-openjdk-8
# 3.6.3-openjdk-11

# 3.8.4-openjdk-8
# 3.8.4-openjdk-11

# 
# If you see the above, then this would indicate that the home directory is mounted over NFS.
# For some reason this doesn't work, so mount the .m2 repo elsewhere
# 
# [WARNING] Failed to write tracking file /root/.m2/repository/org/springframework/boot/...
# java.io.IOException: No locks available

# sudo mkdir -p /maven
# sudo chmod a+rwx /maven

# MAVEN_VERSION="3.5.4" #
# JAVA_VERSION="jdk-8" # 1.8.0_181, 1.8.0_322

MAVEN_VERSION="3.6.1" #
JAVA_VERSION="jdk-8" # 1.8.0_222, 1.8.0_221

# MAVEN_VERSION="3.6.3" #
# JAVA_VERSION="jdk-8" # 1.8.0.92, 1.8.0.275, 1.8.0_282

# MAVEN_VERSION="3.8.4" #
# JAVA_VERSION="jdk-8" # 1.8.0_312

IMAGE="maven:${MAVEN_VERSION}-${JAVA_VERSION}"

mkdir -p /maven/repo

# docker run \
# 	-it \
# 	--rm \
# 	-v "$PWD:/usr/src/mymaven" \
# 	-v "/maven/repo:/var/maven/.m2" \
# 	-v "/maven/target:/usr/src/mymaven/target" \
# 	-w /usr/src/mymaven \
# 	-u 1001 \
# 	-e MAVEN_CONFIG=/var/maven/.m2 \
# 	${IMAGE} mvn -Duser.home=/var/maven/ clean package

docker run \
	-it \
	--rm \
	-v "$PWD:/usr/src/mymaven" \
	-v "/maven/repo:/var/maven/.m2" \
	-w /usr/src/mymaven \
	-u 1001 \
	-e MAVEN_CONFIG=/var/maven/.m2 \
	${IMAGE} mvn -Duser.home=/var/maven/ clean package

