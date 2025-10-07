FROM maven:latest
WORKDIR /app
COPY pom.xml .
COPY src ./src

# Package the application
RUN mvn clean package -DskipTests

# Use an official OpenJDK runtime as a parent image
FROM openjdk:latest

# Set the working directory
WORKDIR /app

# Copy the packaged JAR file from the build stage
COPY --from=build /app/target/myapp.jar ./myapp.jar

# Expose the application port
EXPOSE 8078

# Command to run the application
CMD ["java", "-jar", "myapp.jar"]
 