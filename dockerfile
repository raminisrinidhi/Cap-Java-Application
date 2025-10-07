# Stage 1: Build the application
FROM maven:latest AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Run the application using Maven and Jetty
FROM maven:latest
WORKDIR /app
COPY . .

EXPOSE 8078

CMD ["mvn", "jetty:run"]