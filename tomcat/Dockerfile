
FROM tomcat:9.0-alpine
# FROM tomcat:8.5-alpine
# FROM tomcat:8.0-alpine

ARG WAR_FILE

COPY ./config/9.0/conf/server.xml.cluster /usr/local/tomcat/conf/server.xml
# COPY ./config/8.5/conf/server.xml.cluster /usr/local/tomcat/conf/server.xml
# COPY ./config/8.0/conf/server.xml.cluster /usr/local/tomcat/conf/server.xml

COPY ${WAR_FILE} /usr/local/tomcat/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]
