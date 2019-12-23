FROM hub.kzysure.com/microservice/openjre:1.8
MAINTAINER kzysure kzysure@kzysure.com
COPY target/ruixuemedia.jar /ruixuemedia.jar
ENTRYPOINT ["java","-jar","ruixuemedia.jar"]