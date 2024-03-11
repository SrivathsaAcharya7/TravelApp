<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customer Dashboard</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-image: url('images/tempimg.jpg');
	background-size: cover;
}

.content {
	color: white;
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>
</head>
<body>
	<jsp:include page="CustomerNavbar.jsp" />
	<div class="container mt-4">
		<div class="content">
			<h2>Welcome to the Customer Dashboard</h2>
			<p>Here you can book a cab and view your booking history.</p>
		</div>
	</div>

</body>
</html>
