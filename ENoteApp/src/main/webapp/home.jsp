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
<title>Home page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<div class="container-fluid p-0">
		<%@include file="all_component/navbar.jsp"%>

		<div class="card py-5">
			<div class="card-body text-center">
				<img src="images/page.jpg" alt="page" class="img-fluid mx-auto"
					style="max-width: 500px" />

				<h1 style="color: blue; margin-top: 0.5rem;">START TAKING YOUR NOTES</h1>

				<a href="addNotes.jsp" class="btn btn-outline-primary">Start Here</a>
			</div>
		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>