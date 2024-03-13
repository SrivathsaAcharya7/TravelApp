<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking History</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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

        .glass-table th,
        .glass-table td {
            border: 1px solid rgba(255, 255, 255, 0.18);
            padding: 8px;
            color: white; 
        }

        .glass-table tbody tr:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .mt-4 {
            margin-top: 20px; 
        }
.ermsg, h2 {
    color: white;
    text-align: center;
}
    </style>
</head>
<body>
<jsp:include page="CustomerNavbar.jsp" />
    <div class="container mt-4">
        <h2>Booking History</h2>
        <br/>
        <c:if test="${not empty bookings}">
            <table class="table glass-table mt-4">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Customer Name</th>
                        <th>Pickup Location</th>
                        <th>Drop-off Location</th>
                        <th>Date & Time</th>
                        <th>Cab Type</th>
                        <th>Fare Price</th>
                        <th>Status</th>
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
                            <td>${booking.farePrice}</td>
                            <td>${booking.status}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <div class="ermsg">
            <c:if test="${empty bookings}">
            <p>No booking history available.</p>
            </c:if>
        </div>

    </div>
</body>
</html>
