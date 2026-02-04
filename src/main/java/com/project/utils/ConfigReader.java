package com.FracProPlus.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class ConfigReader {

    private static final Logger logger = LogManager.getLogger(ConfigReader.class);
    private static Properties properties;
    private static ConfigReader instance;

    // Private constructor → Singleton
    private ConfigReader() {
        loadProperties();
    }

    // Get single instance
    public static ConfigReader getInstance() {
        if (instance == null) {
            instance = new ConfigReader();
        }
        return instance;
    }

    // Load properties file
    private void loadProperties() {
        properties = new Properties();

        String filePath = System.getProperty("user.dir") 
                + FilePath.getConfigPropertyFilePath();

        File file = new File(filePath);

        try (FileInputStream fis = new FileInputStream(file)) {
            properties.load(fis);
            logger.info("Config properties loaded successfully from: " + filePath);
        } catch (IOException e) {
            logger.error("Failed to load config properties file", e);
            throw new RuntimeException("Config file not found: " + filePath);
        }
    }

    // Generic getter
    public String getProperty(String key) {
        return properties.getProperty(key);
    }

    // Common reusable getters
    public String getBrowser() {
        return getProperty("browser");
    }

    public String getBaseUrl() {
        return getProperty("baseUrl");
    }

    public int getImplicitWait() {
        return Integer.parseInt(getProperty("implicitWait"));
    }
}
