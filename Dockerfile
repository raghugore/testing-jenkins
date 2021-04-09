FROM maven:3.6.3-jdk-11 AS builder
WORKDIR /usr/src/app
COPY pom.xml .
RUN mvn dependency:resolve
COPY . .
RUN mvn package
RUN ls target

FROM openjdk:11-slim
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/target/docker-demo.jar .

ENTRYPOINT ["java","-jar","docker-demo.jar"]
