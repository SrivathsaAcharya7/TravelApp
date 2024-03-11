<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Cab Fare</title>
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
		<h1 class="my-4">Update Cab Fare</h1>
		<div class="glass-card p-4">
			<form action="updatecabfareinfo" method="post">
				<input type="hidden" name="id" value="${cabFare.id}">
				<div class="form-group">
					<label for="pickupLocation">Pickup Location</label> <input
						type="text" class="form-control" id="pickupLocation"
						name="pickupLocation" value="${cabFare.pickupLocation}" required>
				</div>
				<div class="form-group">
					<label for="dropoffLocation">Drop-off Location</label> <input
						type="text" class="form-control" id="dropoffLocation"
						name="dropoffLocation" value="${cabFare.dropoffLocation}" required>
				</div>
				<div class="form-group">
					<label for="farePrice">Fare Price</label> <input type="number"
						class="form-control" id="farePrice" name="farePrice"
						value="${cabFare.farePrice}" required>
				</div>
				<div class="center-button">
		
					<button type="submit" class="btn btn-primary">Update Cab
						Fare</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
