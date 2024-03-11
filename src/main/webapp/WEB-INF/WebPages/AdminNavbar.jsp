<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.navbar-custom {
	background-color: #000;
	color: #fff;
	justify-content: flex-end;
}

.navbar-custom .nav-link {
	color: #fff !important;
}

.navbar-custom .nav-link:hover {
	color: goldenrod !important;
}

.dropdown-menu {
	border: none;
	border-radius: 0;
	box-shadow: none !important;
	background-color: #fff;
	transition: transform 0.3s ease, opacity 0.3s ease;
	transform: translateY(-20px);
	opacity: 0;
}

.dropdown-item {
	padding: 10px 20px;
	transition: background-color 0.3s ease;
}

.dropdown-item:hover {
	background-color: #f5f5f5;
}

.dropdown:hover .dropdown-menu {
	transform: translateY(0);
	opacity: 1;
}

@
keyframes rise { 0% {
	transform: translateY(0);
}
50
%
{
transform
:
translateY(
-5px
);
}
100
%
{
transform
:
translateY(
0
);
}
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-custom">
		<a class="navbar-brand" href="#">Admin Dashboard</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="" id="cabDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Cab Fare </a>
					<div class="dropdown-menu" aria-labelledby="cabDropdown">
						<a class="dropdown-item" href="newcabfare">Add Cab Fare</a> <a
							class="dropdown-item" href="viewallcabfares">View Cab Fare</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="" id="cabDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Cabs </a>
					<div class="dropdown-menu" aria-labelledby="cabDropdown">
						<a class="dropdown-item" href="newcab">Add Cabs</a> <a
							class="dropdown-item" href="caball">View Cabs</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="" id="bookingDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Bookings </a>
					<div class="dropdown-menu" aria-labelledby="bookingDropdown">
						<a class="dropdown-item" href="bookings">View Bookings</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="" id="customerDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Customers </a>
					<div class="dropdown-menu" aria-labelledby="customerDropdown">
						<a class="dropdown-item" href="newcustomer">Add Customer</a> <a
							class="dropdown-item" href="viewallcustomers">View Customers</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="logout">Logout</a>
				</li>
			</ul>
		</div>
	</nav>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
