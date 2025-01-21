package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.POJO.Post;

public class PostDao {
	private Connection connection = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;
	
	private static final String InsertQuery = "INSERT INTO post (`title`,`content`,`uid`)VALUES(?,?,?)";
	private static final String SelectQuery = "SELECT `id`,`title`,`content`,`date` FROM post WHERE uid = ? ORDER BY id DESC";

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

	public List<Post> getData(int id) {
		List<Post> list = new ArrayList<Post>();
		Post post = null;
		try {
			if (connection != null) {
				preparedStatement = connection.prepareStatement(SelectQuery);
			}
			
			if (preparedStatement != null) {
				preparedStatement.setInt(1, id);
			}
			
			if (preparedStatement != null) {
				resultSet = preparedStatement.executeQuery();
			}
			
			if (resultSet != null) {
				while (resultSet.next()) {
					post = new Post();
					post.setId(resultSet.getInt(1));
					post.setTitle(resultSet.getString(2));
					post.setContent(resultSet.getString(3));
					post.setDate(resultSet.getTimestamp(4));	
					list.add(post);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
