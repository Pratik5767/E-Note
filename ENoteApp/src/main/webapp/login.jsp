<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa fa-user-circle-o fa-3x" aria-hidden="true"></i>
						<h4>Login</h4>
					</div>

					<%
					String msg = (String) session.getAttribute("login-fail");
					if (msg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=msg%></div>
					<%
					session.removeAttribute("login-fail");
					}
					%>

					<%
					String withoutLogin = (String) session.getAttribute("login-error");
					if (withoutLogin != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=withoutLogin%></div>
					<%
					session.removeAttribute("login-error");
					}
					%>

					<%
					String logOutmsg = (String) session.getAttribute("logout-msg");
					if (logOutmsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=logOutmsg%></div>
					<%
					session.removeAttribute("logout-msg");
					}
					%>
					<div class="card-body">
						<form action="login" method="post">
							<div class="form-group">
								<label>Enter Email</label> <input type="email"
									class="form-control" aria-describedby="emailHelp" name="email">
							</div>

							<div class="form-group">
								<label>Enter Password</label> <input type="password"
									class="form-control" name="password">
							</div>

							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>