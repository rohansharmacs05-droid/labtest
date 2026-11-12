
FROM selenium/standalone-chrome:4.27.0

USER root

# Install Maven
RUN apt-get update && \
    apt-get install -y maven && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy Maven configuration and TestNG suite
COPY pom.xml .
COPY testng.xml .

# Copy HTML calculator and Java test files
COPY webpage ./webpage
COPY src ./src

# Run Selenium TestNG tests
RUN mvn -B clean test

# Default command when the container starts
CMD ["mvn", "-B", "test"]

