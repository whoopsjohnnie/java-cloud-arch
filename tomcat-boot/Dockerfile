FROM maven:3.5-jdk-8 as BUILD 
COPY src /project/src
COPY pom.xml /project/pom.xml
WORKDIR /project
RUN mvn package

FROM openjdk:8-jdk-alpine
COPY --from=0 /project/target/tomcat-boot-0.0.1-SNAPSHOT.jar /app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
