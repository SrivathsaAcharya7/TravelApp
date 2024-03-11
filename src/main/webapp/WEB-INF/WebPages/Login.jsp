<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background-image: url('images/tempimg.jpg');
	background-size: cover;
	background-color: #f8f9fa;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.login-card {
	width: 500px !important;
	padding: 20px;
	border-radius: 15px;
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(4px);
	-webkit-backdrop-filter: blur(4px);
	background-color: rgba(255, 255, 255, 0.2);
	border: 1px solid rgba(255, 255, 255, 0.18);
	color: white;
}

.login-card h2 {
	margin-bottom: 20px;
	text-align: center;
	color: white;
}

.login-card .register-link {
	margin-top: 20px;
	text-align: center;
}

.login-card .register-link a {
	color: white;
}

.center-button {
	text-align: center;
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="login-card">
		<h2>Login</h2>
		<form action="login" method="post">
			<div class="form-group">
				<label for="email">Email:</label> <input type="email"
					class="form-control" id="email" name="email" required>
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					class="form-control" id="password" name="password" required>
			</div>
			<div class="center-button">
				<button type="submit" class="btn btn-primary btn-login">Login</button>
			</div>

		</form>
		<div class="register-link">
			<p>
				New user? <a href="registration">Register now</a>
			</p>
		</div>
	</div>
</body>
</html>
