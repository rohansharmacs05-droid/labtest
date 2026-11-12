
FROM maven:3.9.9-eclipse-temurin-17

# Install Chromium and its matching driver
RUN apt-get update && apt-get install -y \
    chromium \
    chromium-driver \
    && rm -rf /var/lib/apt/lists/*

ENV CHROME_BIN=/usr/bin/chromium

WORKDIR /app

# Copy the project files
COPY pom.xml .
COPY testng.xml .
COPY webpage ./webpage
COPY src ./src

# Run Selenium TestNG tests during image build
RUN mvn clean test

CMD ["mvn", "test"]
