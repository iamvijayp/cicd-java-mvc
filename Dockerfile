FROM amazoncorretto:17.0.7-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file into the container at /app
COPY target/helloworld-0.0.1-SNAPSHOT.jar /app/app.jar

#newrelic configs
RUN mkdir -p /usr/local/newrelic
ADD ./newrelic/newrelic.jar /usr/local/newrelic/newrelic.jar
ADD ./newrelic/newrelic.yml /usr/local/newrelic/newrelic.yml

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java","-javaagent:/usr/local/newrelic/newrelic.jar","-jar","app.jar"]
# CMD ["java", "-jar", "app.jar"]
