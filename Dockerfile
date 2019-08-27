FROM openjdk:8-jdk-alpine

COPY ./gradlew gradlew
COPY ./gradle/ gradle
COPY ./build.gradle build.gradle
COPY ./src src
RUN chmod +x ./gradlew
RUN ./gradlew build

EXPOSE 8080:8080

ENTRYPOINT ["java","-jar","build/libs/gs-spring-boot-docker-0.1.0.jar"]
