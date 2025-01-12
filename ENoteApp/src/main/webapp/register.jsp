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
					
					<div class="card-body">
						<form>
							<div class="form-group">
								<label>Enter Full Name</label>
								<input type="text" class="form-control">
							</div>
						
							<div class="form-group">
								<label>Enter Email</label>
								<input type="email" class="form-control" aria-describedby="emailHelp"> 
							</div>

							<div class="form-group">
								<label>Enter Password</label>
								<input type="password" class="form-control">
							</div>

							<button type="submit" class="btn btn-primary badge-pill btn-block">Register</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>