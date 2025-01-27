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

@WebServlet("/edit")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer noteId = Integer.parseInt(request.getParameter("noteId"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		PostDao dao = new PostDao(JdbcUtils.getConnection());
		boolean msg = dao.UpdatePost(noteId, title, content);
		
		HttpSession session = null;
		if (msg) {
			session = request.getSession();
			session.setAttribute("update-msg", "Notes Updated SuccessFully");
			response.sendRedirect("showNotes.jsp");
		} else {
			session = request.getSession();
			session.setAttribute("error-msg", "Something Went Wrong");
			response.sendRedirect("showNotes");
		}
	}
}