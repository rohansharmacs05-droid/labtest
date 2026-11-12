
FROM selenium/standalone-chrome:4.27.0

USER root

# Install Java 17 and Maven
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk maven && \
    rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"

WORKDIR /app

# Copy project files
COPY pom.xml .
COPY testng.xml .
COPY webpage ./webpage
COPY src ./src

# Run TestNG Selenium test cases
RUN mvn clean test

# Default container command
CMD ["mvn", "test"]


