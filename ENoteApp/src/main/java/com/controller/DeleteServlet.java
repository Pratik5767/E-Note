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

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noteId = Integer.parseInt(request.getParameter("note_id"));
		
		PostDao dao = new PostDao(JdbcUtils.getConnection());
		boolean msg = dao.DeletePost(noteId);
		
		HttpSession session = null;
		if (msg) {
			session = request.getSession();
			session.setAttribute("update-msg", "Note Deleted Successfully");
			response.sendRedirect("showNotes.jsp");
		} else {
			session = request.getSession();
			session.setAttribute("error-msg", "Something Went Wrong");
			response.sendRedirect("showNotes.jsp");
		}
	}
}