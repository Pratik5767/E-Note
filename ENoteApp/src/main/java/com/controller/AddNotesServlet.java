package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.PostDao;
import com.db.JdbcUtils;

@WebServlet("/addNotes")
public class AddNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("uid"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		PostDao postDao = new PostDao(JdbcUtils.getConnection());
		boolean result = postDao.addNotes(title, content, uid);	
		
		if (result) {
			System.out.println("Data Inserted");
		} else {
			System.out.println("Data Not Inserted");
		}
	}
}
