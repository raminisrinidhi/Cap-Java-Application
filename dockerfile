FROM openjdk:latest
WORKDIR /usr/src/app
COPY . .
EXPOSE 8090
CMD ["mvn", "jetty:run"]
