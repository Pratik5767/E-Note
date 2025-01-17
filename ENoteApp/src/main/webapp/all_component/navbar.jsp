<%@page import="com.POJO.User"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">
	<a class="navbar-brand" href="index.jsp"><i class="fa fa-book"
		aria-hidden="true"></i> E Notes</a>

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp">
					<i class="fa fa-home" aria-hidden="true"></i> Home <span
					class="sr-only">(current)</span>
			</a></li>

			<li class="nav-item"><a class="nav-link" href="addNotes.jsp"> <i
					class="fa fa-plus-circle" aria-hidden="true"></i> Add Note
			</a></li>

			<li class="nav-item"><a class="nav-link" href="showNotes.jsp"> <i
					class="fa fa-eye" aria-hidden="true"></i> Show Note
			</a></li>
		</ul>


		<%
		User user = (User) session.getAttribute("login-details");
		if (user != null) {
		%>
		<a class="btn btn-light my-2 my-sm-0 mr-2" type="submit" href=""
			data-toggle="modal" data-target="#profile"> <i
			class="fa fa-user-circle-o" aria-hidden="true"></i> <%= user.getFname()%>
		</a> 
		<a class="btn btn-light my-2 my-sm-0 mr-2" type="submit"
			href="logout"> <i class="fa fa-sign-out" aria-hidden="true"></i> Logout
		</a>

		<!-- Modal -->
		<div class="modal fade" id="profile" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Profile</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<div class="modal-body">
						<div class="text-center">
							<i class="fa fa-user fa-3x"></i>

							<table class="table">
								<tbody>
									<tr>
										<th>Id:</th>
										<td><%= user.getId()%></td>
									</tr>
									<tr>
										<th>Full Name:</th>
										<td><%= user.getFname()%></td>
									</tr>
									<tr>
										<th>Email:</th>
										<td><%= user.getEmail()%></td>
									</tr>
								</tbody>
							</table>

							<div>
								<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%
		} else {
		%>
		<a class="btn btn-light my-2 my-sm-0 mr-2" type="submit"
			href="login.jsp"> <i class="fa fa-user-circle-o"
			aria-hidden="true"></i> Login
		</a> <a class="btn btn-light my-2 my-sm-0 mr-2" type="submit"
			href="register.jsp"> <i class="fa fa-user-plus"
			aria-hidden="true"></i> Register
		</a>
		<%
		}
		%>
	</div>
</nav>