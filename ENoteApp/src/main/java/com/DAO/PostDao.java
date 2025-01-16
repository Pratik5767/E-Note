package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PostDao {
	private Connection connection = null;
	private PreparedStatement preparedStatement = null;

	private static final String InsertQuery = "INSERT INTO post (`title`,`content`,`uid`)VALUES(?,?,?)";

	public PostDao(Connection connection) {
		this.connection = connection;
	}

	public boolean addNotes(String title, String content, int uid) {
		try {
			if (connection != null) {
				preparedStatement = connection.prepareStatement(InsertQuery);
			}
			
			if (preparedStatement != null) {
				preparedStatement.setString(1, title);
				preparedStatement.setString(2, content);
				preparedStatement.setInt(3, uid);
			}

			int count = preparedStatement.executeUpdate();
			
			if (count == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
