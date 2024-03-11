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
		<a class="navbar-brand" href="#">Customer Dashboard</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="bookcab"
					id="cabDropdown" role="button"> Book Cab </a></li>
				<li class="nav-item"><a class="nav-link" href="bookinghistory"
					id="cabDropdown" role="button"> Booking History </a></li>
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
