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

	<div class="container">
		<h1 class="text-center mt-2" style="color: blue">SHOW NOTES</h1>
		
		<div class="row">
			<div class="col-md-12">
				<div class="card mt-3">
					<img alt="" src="images/page.jpg" class="card-img-top mt-2 mx-auto" style="max-width: 150px"/>
					
					<div class="card-body p-4">
						<h5 class="card-title">What is Java</h5>
						<p>Java is a Object Oriented Programming Language</p>
						
						<p>
							<b class="text-success">Published By: Pratik Salunkhe</b> 
							<br/>
							<b class="text-primary"></b>
						</p>
						
						<p>
							<b class="text-success">Published Date: </b> 
							<br/>
							<b class="text-success"></b>
						</p>
						
						<div class="container text-center mt-2">
							<a href="delete?note_id=" class="btn btn-danger">Delete</a>
							<a href="edit?note_id=" class="btn btn-primary">Edit</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>