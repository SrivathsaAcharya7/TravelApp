<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="frm" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>New Cab</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
/* Glassmorphic card style */
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

body {
	background-image: url('images/tempimg.jpg');
	background-size: cover;
}

.glass-card input[type="text"], .glass-card select {
	border: 1px solid rgba(255, 255, 255, 0.5);
	border-radius: 8px;
	padding: 10px;
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
</style>
</head>
<body>
	<jsp:include page="AdminNavbar.jsp" />
	<hr class="my-4">
	<div class="container">
		<div class="center-form">
			<div class="glass-card">
				<h1>New Cab</h1>
				<hr>
				<frm:form method="post" action="newcabinfo" modelAttribute="cab">
					<div class="form-group">
						<label>Registration Number:</label>
						<frm:input type="text" path="registrationNumber"
							placeholder="Registration Number" />
					</div>
					<div class="form-group">
						<label for="cabType">Cab Type:</label>
						<frm:select path="type" id="cabType">
							<frm:option value="" label="Select Cab Type" />
							<frm:option value="Sedan" label="Sedan" />
							<frm:option value="SUV" label="SUV" />
							<frm:option value="Van" label="Van" />
							<frm:option value="Luxury" label="Luxury" />
						</frm:select>
					</div>
					<div class="form-group">
						<label>Availability:</label>
						<frm:select path="availability">
							<frm:option value="Available" label="Available" />
							<frm:option value="Unavailable" label="Unavailable" />
						</frm:select>
					</div>
					<input type="submit" value="Add Cab" />
				</frm:form>

			</div>
		</div>
	</div>
</body>
</html>
