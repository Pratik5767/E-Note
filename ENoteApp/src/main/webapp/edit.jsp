<%@page import="com.POJO.Post"%>
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
<title>Edit Notes</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%
	Integer noteId = Integer.parseInt(request.getParameter("note_id"));
	PostDao postDao = new PostDao(JdbcUtils.getConnection());
	Post post = postDao.getDataById(noteId);
	%>
	<div class="container-fluid p-0">
		<%@include file="all_component/navbar.jsp"%>

		<h1 class="text-center mt-2" style="color: blue">EDIT YOUR NOTES</h1>

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form action="edit" method="post">
						<input type="hidden" value="<%=noteId%>" name="noteId"/>

						<div class="form-group">
							<label for="Title">Enter Title</label> <input type="text"
								class="form-control" id="Title" name="title" required
								value="<%=post.getTitle()%>" />
						</div>

						<div class="form-group">
							<label for="content">Enter Content</label>
							<textarea rows="13" cols="" class="form-control" id="content"
								name="content" required><%=post.getContent()%>
							</textarea>
						</div>

						<div class="container text-center mb-3">
							<button type="submit" class="btn btn-primary">Edit Note</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>