FROM maven:3.6.3-jdk-8-slim AS build
WORKDIR /home/app
COPY . /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM openjdk:8-jdk-alpine
EXPOSE 8080
COPY --from=build /home/app/target/spring-admin-server.jar spring-admin-server.jar
ENTRYPOINT ["sh", "-c", "java -jar /spring-admin-server.jar"]