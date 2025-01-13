package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.User;

public class UserDao {
	private Connection connection = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;

	private static final String registerQuery = "INSERT INTO users (`fname`, `email`, `password`)VALUE(?,?,?)";
	private static final String loginQuery = "SELECT `id`,`fname`,`email`,`password` FROM users WHERE email=? and password=?";

	public UserDao(Connection connection) {
		this.connection = connection;
	}

	public boolean register(User user) {
		try {
			preparedStatement = connection.prepareStatement(registerQuery);

			if (preparedStatement != null) {
				preparedStatement.setString(1, user.getFname());
				preparedStatement.setString(2, user.getEmail());
				preparedStatement.setString(3, user.getPassword());
			}

			int count = preparedStatement.executeUpdate();
			if (count == 1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean login(User user) {
		try {
			preparedStatement = connection.prepareStatement(loginQuery);

			if (preparedStatement != null) {
				preparedStatement.setString(1, user.getEmail());
				preparedStatement.setString(2, user.getPassword());
			}

			if (preparedStatement != null) {
				resultSet = preparedStatement.executeQuery();
			}

			if (resultSet != null) {
				if (resultSet.next()) {
					return true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}