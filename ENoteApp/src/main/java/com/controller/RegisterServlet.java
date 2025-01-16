package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDao;
import com.POJO.User;
import com.db.JdbcUtils;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("fname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		User user = new User();
		user.setFname(name);
		user.setEmail(email);
		user.setPassword(password);

		HttpSession session = null;
		UserDao userDao = new UserDao(JdbcUtils.getConnection());
		boolean result = userDao.register(user);

		if (result) {
			session = request.getSession();
			session.setAttribute("reg-success", "REGISTERATION SUCCESSFULL.");
			response.sendRedirect("register.jsp");
		} else {
			session = request.getSession();
			session.setAttribute("failed-msg", "SOMETHING WENT WRONG.");
			response.sendRedirect("register.jsp");
		}
	}
}