<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>All Cabs</title>
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

.text-center {
	color: white;
	text-align: center;
}

.my-4 {
	color: white;
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="AdminNavbar.jsp" />
	<hr class="my-4">
	<h1 class="text-center">All Cabs</h1>
	<hr class="my-4">
	<div class="container">
		<table class="table glass-table">
			<thead>
				<tr>
					<th>Registration Number</th>
					<th>Type</th>
					<th>Availability</th>
					<th>Operations</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cab" items="${cabList}">
					<tr>
						<td>${cab.registrationNumber}</td>
						<td>${cab.type}</td>
						<td>${cab.availability}</td>
						<td><a class="btn btn-info" href="updatecab/${cab.id }">Update</a>
							<a class="btn btn-danger" href="delcab/${cab.id }">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
