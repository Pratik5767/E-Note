package com.db;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class JdbcUtils {
	private static Connection connection = null;

	private JdbcUtils() {}

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {
		try {
			FileInputStream fis = new FileInputStream(
					"D:\\Pratik\\git\\ENoteRepo\\ENoteApp\\src\\main\\java\\com\\properties\\application.properties");
			Properties properties = new Properties();
			properties.load(fis);
			
			connection = DriverManager.getConnection(properties.getProperty("url"), properties.getProperty("userName"),
					properties.getProperty("password"));
		} catch (SQLException | IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (connection == null) {
			return null;
		}
		return connection;
	}
}