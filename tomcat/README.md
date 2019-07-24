

# Standard
> docker build --build-arg WAR_FILE=./sample.war -t org.name/tomcat:latest .
> docker run -p 8080:8080 org.name/tomcat:latest

# Config
> docker build -f Dockerfile.config --build-arg CONFIG_FILE=... --build-arg WAR_FILE=./sample.war -t org.name/tomcat:latest .
> docker run -p 8080:8080 org.name/tomcat:latest


# Clustering

### Members
> docker run -p 8081:8080 org.name/tomcat:latest
> docker run -p 8082:8080 org.name/tomcat:latest
> docker run -p 8083:8080 org.name/tomcat:latest


### Member 1 logs
INFO [Membership-MemberAdded.] org.apache.catalina.ha.tcp.SimpleTcpCluster.memberAdded Replication member added:[org.apache.catalina.tribes.membership.MemberImpl[tcp://{172, 17, 0, 3}:4000,{172, 17, 0, 3},4000, alive=1022, securePort=-1, UDP Port=-1, id={-102 -99 81 27 93 85 73 88 -119 -20 -51 -44 -118 -116 -89 -125 }, payload={}, command={}, domain={}, ]]

INFO [Membership-MemberAdded.] org.apache.catalina.ha.tcp.SimpleTcpCluster.memberAdded Replication member added:[org.apache.catalina.tribes.membership.MemberImpl[tcp://{172, 17, 0, 4}:4000,{172, 17, 0, 4},4000, alive=1017, securePort=-1, UDP Port=-1, id={79 -116 99 -55 -126 124 70 26 -91 88 21 41 -103 78 -64 -77 }, payload={}, command={}, domain={}, ]]

### Member 2 logs
INFO [Membership-MemberAdded.] org.apache.catalina.ha.tcp.SimpleTcpCluster.memberAdded Replication member added:[org.apache.catalina.tribes.membership.MemberImpl[tcp://{172, 17, 0, 4}:4000,{172, 17, 0, 4},4000, alive=1017, securePort=-1, UDP Port=-1, id={79 -116 99 -55 -126 124 70 26 -91 88 21 41 -103 78 -64 -77 }, payload={}, command={}, domain={}, ]]

