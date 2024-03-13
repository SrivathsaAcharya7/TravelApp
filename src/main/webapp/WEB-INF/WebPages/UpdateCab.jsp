<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Cab</title>
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
	max-width: 400px;
	margin: auto;
	padding: 20px;
}

.glass-card input[type="text"], .glass-card select {
	border: 1px solid rgba(255, 255, 255, 0.5);
	border-radius: 8px;
	padding: 5px;
	margin-bottom: 10px;
	width: 100%;
}

.glass-card input[type="submit"] {
	background-color: #007bff;
	border: none;
	color: white;
	padding: 12px 20px;
	border-radius: 8px;
	cursor: pointer;
	width: 100%;
}

.glass-card input[type="submit"]:hover {
	background-color: #0056b3;
}

.glass-card h1, .glass-card h3 {
	text-align: center;
}
.my-4{
        color: white;
        text-align: center;
}
.center-button {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}
</style>
</head>
<body>
	<jsp:include page="AdminNavbar.jsp" />
	<div class="container">
		<h1 class="my-4">Update Cab</h1>
		<div class="glass-card">
			<form action="${pageContext.request.contextPath}/updatecabinfo" method="post">
				<input type="hidden" name="id" value="${cab.id}">
				<div class="form-group">
					<label for="registrationNumber">Registration Number</label> <input
						type="text" class="form-control" id="registrationNumber"
						name="registrationNumber" value="${cab.registrationNumber}"
						required>
				</div>
				<div class="form-group">
					<label for="cabType">Cab Type:</label> <select class="form-control"
						id="type" name="type" required>
						<option value="">Select Cab Type</option>
						<option value="Sedan">Sedan</option>
						<option value="SUV">SUV</option>
						<option value="Van">Van</option>
						<option value="Luxury">Luxury</option>
					</select>
				</div>
				<div class="form-group">
					<label>Availability:</label> <select class="form-control"
						name="availability" id="availability" required>
						<option value="Available">Available</option>
						<option value="Unavailable">Unavailable</option>
					</select>
				</div>
				<div class="center-button">
				<button type="submit" class="btn btn-primary">Update Cab</button>
				</div>
				
			</form>
		</div>
	</div>
</body>
</html>
