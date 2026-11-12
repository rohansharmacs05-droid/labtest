
FROM selenium/standalone-chrome:4.27.0

USER root

# Install Maven
RUN apt-get update && \
    apt-get install -y maven && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy project files
COPY pom.xml .
COPY testng.xml .
COPY webpage/ ./webpage/
COPY src/ ./src/

# Run Selenium TestNG tests
RUN mvn -B clean test

# Default command
CMD ["mvn", "-B", "test"]


# Default container command
CMD ["mvn", "test"]


