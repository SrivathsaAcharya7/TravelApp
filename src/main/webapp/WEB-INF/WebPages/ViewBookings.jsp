<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Bookings</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.glass-table {
	background: rgba(255, 255, 255, 0.2);
	backdrop-filter: blur(10px);
	border-radius: 15px;
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(4px);
	-webkit-backdrop-filter: blur(4px);
	border: 1px solid rgba(255, 255, 255, 0.18);
	color: white;
	overflow: hidden;
}

body {
	background-image: url('images/tempimg.jpg');
	background-size: cover;
}

.glass-table th, .glass-table td {
	border: 1px solid rgba(255, 255, 255, 0.18);
	padding: 8px;
	color: white;
}

.glass-table tbody tr:hover {
	background-color: rgba(255, 255, 255, 0.1);
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
		<h1 class="my-4">All Bookings</h1>
		<table class="table glass-table">
			<thead>
				<tr>
					<th>Booking ID</th>
					<th>Customer Name</th>
					<th>Pickup Location</th>
					<th>Dropoff Location</th>
					<th>Date</th>
					<th>Cab Type</th>
					<th>Status</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="booking" items="${bookings}">
					<tr>
						<td>${booking.id}</td>
						<td>${booking.customerName}</td>
						<td>${booking.pickupLocation}</td>
						<td>${booking.dropoffLocation}</td>
						<td>${booking.date}</td>
						<td>${booking.cabType}</td>
						<td>${booking.status}</td>
						<td><a href="updateBookingStatus/${booking.id}"
							class="btn btn-primary btn-sm">Edit</a> <a
							href="deleteBooking/${booking.id}" class="btn btn-danger btn-sm">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
