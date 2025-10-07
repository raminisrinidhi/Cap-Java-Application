FROM openjdk:latest
RUN npm install
WORKDIR /usr/src/app
COPY . .
EXPOSE 8090
CMD ["mvn", "jetty:run"]
