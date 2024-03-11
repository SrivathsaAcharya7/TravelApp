<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Customer</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.glass-card {
	background: rgba(255, 255, 255, 0.2);
	backdrop-filter: blur(10px);
	border-radius: 15px;
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(4px);
	-webkit-backdrop-filter: blur(4px);
	border: 1px solid rgba(255, 255, 255, 0.18);
	color: white;
	max-width: 500px;
	margin: auto;
	padding: 20px;
}

body {
	background-image: url('images/tempimg.jpg');
	background-size: cover;
}

.center-button {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.my-4 {
	color: white;
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="AdminNavbar.jsp" />
	<div class="container">
		<h2 class="my-4">Add New Customer</h2>
		<div class="glass-card p-4">
			<form:form action="newcustomerinfo" method="POST"
				modelAttribute="customer">
				<div class="form-group">
					<label for="name">Name:</label>
					<form:input type="text" class="form-control" id="name" path="name"
						required="true" />
				</div>
				<div class="form-group">
					<label for="email">Email:</label>
					<form:input type="email" class="form-control" id="email"
						path="email" required="true" />
				</div>
				<div class="form-group">
					<label for="phone">Phone:</label>
					<form:input type="text" class="form-control" id="phone"
						path="phone" required="true" />
				</div>
				<div class="form-group">
					<label for="password">Password:</label>
					<form:input type="password" path="password" id="password" class="form-control"
						required="true" />
				</div>
				<div class="center-button">
					<button type="submit" class="btn btn-primary">Add Customer</button>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>
