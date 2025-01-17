<%@page import="com.POJO.User"%>
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
<title>Add notes</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<div class="container-fluid p-0">
		<%@include file="all_component/navbar.jsp"%>

		<h1 class="text-center mt-2" style="color: blue">ADD YOUR NOTES</h1>

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form action="addNotes" method="post">
						<div class="form-group">
							<%
							User us = (User) session.getAttribute("login-details");
							if (us != null) {
							%>
							<input type="hidden" value="<%=us.getId()%>" name="uid" />
							<%
							}
							%>
							<label for="Title">Enter Title</label> <input type="text"
								class="form-control" id="Title" name="title" required />
						</div>

						<div class="form-group">
							<label for="content">Enter Content</label>
							<textarea rows="13" cols="" class="form-control" id="content"
								name="content" required></textarea>
						</div>

						<div class="container text-center mb-3">
							<button type="submit" class="btn btn-primary">Add Notes</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>