#https://hub.docker.com/_/java/
FROM java:openjdk-7-jre

RUN mkdir -p /home/jar
VOLUME /home/jar/

ENTRYPOINT ["java", "-jar", "/home/jar/app.jar"]