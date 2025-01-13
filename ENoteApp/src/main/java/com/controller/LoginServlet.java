package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDao;
import com.db.JdbcUtils;
import com.model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		User user = new User();
		user.setEmail(email);
		user.setPassword(password);

		UserDao userDao = new UserDao(JdbcUtils.getConnection());
		boolean result = userDao.login(user);

		if (result) {
			response.sendRedirect("home.jsp");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("login-fail", "Invalid UserName or Password");
			response.sendRedirect("login.jsp");
		}
	}
}