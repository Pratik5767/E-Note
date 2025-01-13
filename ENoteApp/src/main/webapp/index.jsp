<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img {
	background: url("images/back.jpg");
	width: 100%;
	height: 81vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<meta charset="UTF-8">
<title>Welcome page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	
	<div class="container-fluid back-img">
		<div class="text-center pt-4">
			<h1 class="text-white"><i class="fa fa-book" aria-hidden="true"></i> E Notes-Save Your Notes</h1>
			
			<a href="login.jsp" class="btn btn-light">
				<i class="fa fa-user-circle-o" aria-hidden="true"></i> Login
			</a>
			
			<a href="register.jsp" class="btn btn-light">
				<i class="fa fa-user-plus" aria-hidden="true"></i> Register
			</a>
		</div>
	</div>
	
	<%@include file="all_component/footer.jsp"%>
</body>
</html>