<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Booking Status</title>
<!-- Include Bootstrap CSS -->
<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
    padding: 30px;
}

.glass-card input[type="text"],
.glass-card select {
    border: 1px solid rgba(255, 255, 255, 0.5);
    border-radius: 8px;
    padding: 11px;
    margin-bottom: 11px;
    width: 100%;
    height:100%;
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

.glass-card h2 {
    color: white;
    text-align: center;
}
.heading{
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
    <h2 class="heading">Update Booking Status</h2>
    <br/>
    <div class="glass-card">
        <form action="updateBookingStatusInfo" method="post">
            <input type="hidden" name="id" value="${booking.id}">
            <div class="form-group">
                <label for="status">New Status:</label>
                <select class="form-control" id="status" name="status" required>
                    <option value="">Select Status</option>
                    <option value="In-Progress">In Progress</option>
                    <option value="Completed">Completed</option>
                </select>
            </div>
            <div class="center-button">
            <button type="submit" class="btn btn-primary">Update Status</button>
            </div>
            
        </form>
    </div>
</div>
</body>
</html>
