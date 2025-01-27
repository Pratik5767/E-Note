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
	private static final String SelectAllQuery = "SELECT `id`,`title`,`content`,`date` FROM post WHERE uid = ? ORDER BY id DESC";
	private static final String SelectByIdQuery = "SELECT `id`,`title`,`content`,`date` FROM post WHERE id = ?";
	private static final String UpdateQuery = "UPDATE post SET title=?, content=? WHERE id=?";
	private static final String deleteQuery = "DELETE FROM post WHERE id = ?";
	
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
				preparedStatement = connection.prepareStatement(SelectAllQuery);
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
	
	public Post getDataById(int noteId) {
		Post post = null;
		try {
			if (connection != null) {
				preparedStatement = connection.prepareStatement(SelectByIdQuery);
			}
			
			if (preparedStatement != null) {
				preparedStatement.setInt(1, noteId);
			}
			
			if (preparedStatement != null) {
				resultSet = preparedStatement.executeQuery();
			}
			
			if (resultSet != null) {
				if (resultSet.next()) {
					post = new Post();
					post.setId(resultSet.getInt(1));
					post.setTitle(resultSet.getString(2));
					post.setContent(resultSet.getString(3));;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return post;
	}
	
	public boolean UpdatePost(int noteId, String title, String content) {
		try {
			if (connection != null) {
				preparedStatement = connection.prepareStatement(UpdateQuery);
			}
			
			if (preparedStatement != null) {
				preparedStatement.setString(1, title);
				preparedStatement.setString(2, content);
				preparedStatement.setInt(3, noteId);
			}
			
			int count = preparedStatement.executeUpdate();
			if (count == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean DeletePost(int noteId) {
		try {
			if (connection != null) {
				preparedStatement = connection.prepareStatement(deleteQuery);
			}
			
			if (preparedStatement != null) {
				preparedStatement.setInt(1, noteId);
			}
			
			int count = preparedStatement.executeUpdate();
			if (count == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
