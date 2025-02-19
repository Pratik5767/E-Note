package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		HttpSession session = null;
		if (result) {
			session = request.getSession();
			session.setAttribute("update-msg", "Note Added SuccessFully");
			response.sendRedirect("showNotes.jsp");
		} else {
			session = request.getSession();
			session.setAttribute("error-msg", "Something Went Wrong");
			response.sendRedirect("showNotes.jsp");
		}
	}
}