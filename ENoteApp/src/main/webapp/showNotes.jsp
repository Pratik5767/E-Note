<%@page import="com.POJO.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.db.JdbcUtils"%>
<%@page import="com.DAO.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
User users = (User) session.getAttribute("login-details");
if (users == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "Please login....");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Notes</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<%
	String updatemsg = (String) session.getAttribute("update-msg");
	if (updatemsg != null) {
	%>
		<div class="alert alert-success" role="alert"><%=updatemsg%></div>
	<%
	session.removeAttribute("update-msg");
	}
	%>

	<div class="container">
		<h1 class="text-center mt-2" style="color: blue">SHOW NOTES</h1>

		<div class="row">
			<div class="col-md-12">
				<%
				if (user != null) {
					PostDao obj = new PostDao(JdbcUtils.getConnection());
					List<Post> list = obj.getData(user.getId());
					for (Post post : list) {
				%>
				<div class="card mt-3">
					<img alt="" src="images/page.jpg" class="card-img-top mt-2 mx-auto"
						style="max-width: 150px" />

					<div class="card-body p-4">
						<h5 class="card-title"><%=post.getTitle()%></h5>
						<p><%=post.getContent()%>
							.
						</p>

						<p>
							<b class="text-success">Published By: </b> <b
								class="text-primary"><%=users.getFname()%></b>
						</p>

						<p>
							<b class="text-success">Published Date: </b> <b
								class="text-primary"><%=post.getDate()%></b>
						</p>

						<div class="container text-center mt-2">
							<a href="delete?note_id=<%=post.getId()%>"
								class="btn btn-danger">Delete</a> <a
								href="edit.jsp?note_id=<%=post.getId()%>"
								class="btn btn-primary">Edit</a>
						</div>
					</div>
				</div>
				<%
				}
				}
				%>
			</div>
		</div>
	</div>

</body>
</html>