package com.example;

import java.nio.file.Path;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import org.testng.Assert;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

public class CalculatorTest {

    WebDriver driver;

    @BeforeMethod
    public void setup() {

        ChromeOptions options = new ChromeOptions();

        options.addArguments(
            "--headless=new",
            "--no-sandbox",
            "--disable-dev-shm-usage"
        );

        driver = new ChromeDriver(options);

        Path html = Path.of("webpage", "index.html")
                        .toAbsolutePath();

        driver.get(html.toUri().toString());
    }

    @Test
    public void additionTest() {

        driver.findElement(By.id("num1")).sendKeys("12");
        driver.findElement(By.id("num2")).sendKeys("5");

        driver.findElement(
            By.cssSelector("[data-op='add']")
        ).click();

        String actual = driver.findElement(
            By.id("result")
        ).getText();

        Assert.assertEquals(actual, "Result: 17");
    }

    @Test
    public void subtractionTest() {

        driver.findElement(By.id("num1")).sendKeys("12");
        driver.findElement(By.id("num2")).sendKeys("5");

        driver.findElement(
            By.cssSelector("[data-op='subtract']")
        ).click();

        String actual = driver.findElement(
            By.id("result")
        ).getText();

        Assert.assertEquals(actual, "Result: 7");
    }

    @Test
    public void multiplicationTest() {

        driver.findElement(By.id("num1")).sendKeys("12");
        driver.findElement(By.id("num2")).sendKeys("5");

        driver.findElement(
            By.cssSelector("[data-op='multiply']")
        ).click();

        String actual = driver.findElement(
            By.id("result")
        ).getText();

        Assert.assertEquals(actual, "Result: 60");
    }

    @Test
    public void divisionTest() {

        driver.findElement(By.id("num1")).sendKeys("12");
        driver.findElement(By.id("num2")).sendKeys("5");

        driver.findElement(
            By.cssSelector("[data-op='divide']")
        ).click();

        String actual = driver.findElement(
            By.id("result")
        ).getText();

        Assert.assertEquals(actual, "Result: 2.4");
    }

    @AfterMethod
    public void tearDown() {

        if (driver != null) {
            driver.quit();
        }
    }
}
