<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Customer</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-image: url('../images/tempimg.jpg');
	background-size: cover;
}

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
		<h1 class="my-4">Update Customer</h1>
		<div class="glass-card p-4">
			<form action="updatecustomerinfo" method="post">
				<input type="hidden" name="id" value="${customer.id}">
				<div class="form-group">
					<label for="name">Name:</label> <input type="text"
						class="form-control" id="name" name="name"
						value="${customer.name}" required>
				</div>
				<div class="form-group">
					<label for="email">Email:</label> <input type="email"
						class="form-control" id="email" name="email"
						value="${customer.email}" required>
				</div>
				<div class="form-group">
					<label for="phone">Phone:</label> <input type="text"
						class="form-control" id="phone" name="phone"
						value="${customer.phone}" required>
				</div>
				<div class="center-button">
					<button type="submit" class="btn btn-primary">Update</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
