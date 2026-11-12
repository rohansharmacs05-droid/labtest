
FROM maven:3.9.9-eclipse-temurin-17

USER root

# Install Chrome and ChromeDriver
RUN apt-get update && \
    apt-get install -y chromium chromium-driver && \
    rm -rf /var/lib/apt/lists/*

ENV CHROME_BIN=/usr/bin/chromium

WORKDIR /app

# Copy Maven project files
COPY pom.xml .
COPY testng.xml .
COPY src ./src
COPY webpage ./webpage

# Download dependencies
RUN mvn -B dependency:resolve

# Run TestNG Selenium tests
CMD ["mvn", "-B", "clean", "test"]



# Default container command
CMD ["mvn", "test"]


