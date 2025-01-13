<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
						<h4>Registration</h4>
					</div>
					
					<%
						String msg = (String)session.getAttribute("reg-success");
						if(msg != null) {
					%>
							<div class="alert alert-success" role="alert"><%= msg%> <a href="login.jsp">login</a></div>
					<%
							session.removeAttribute("reg-success");
						}
					%>
					
					<%
						String failedMsg = (String)session.getAttribute("failed-msg");
						if(failedMsg != null) {
					%>
							<div class="alert alert-danger" role="alert"><%= failedMsg%></div>
					<%
							session.removeAttribute("failed-msg");
						}
					%>
					<div class="card-body">
						<form action="register" method="post">
							<div class="form-group">
								<label>Enter Full Name</label> <input type="text"
									class="form-control" name="fname">
							</div>

							<div class="form-group">
								<label>Enter Email</label> <input type="email"
									class="form-control" aria-describedby="emailHelp" name="email">
							</div>

							<div class="form-group">
								<label>Enter Password</label> <input type="password"
									class="form-control" name="password">
							</div>

							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Register</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>