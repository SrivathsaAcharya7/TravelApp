<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="com.travelapp.models.CabFare"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book a Cab</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
 
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
            margin-top: 20px;
            position: relative;
            z-index: 1;
            padding: 20px;
        }
        
        body {
            background-image: url('images/tempimg.jpg');
            background-size: cover;
        }

        .glass-card-body {
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
            margin-top: 20px;
        }
        
      
        .form-group {
            position: relative;
        }
        
        select.form-control {
            background-color: rgba(255, 255, 255, 0.2);
            color: white;
            z-index: 2;
        }
    </style>
</head>
<body>
<jsp:include page="CustomerNavbar.jsp" />
    <div class="container">
        <h1 class="my-4">Book a Cab</h1>
        <div class="glass-card p-4">
            	<form:form action="mybookings" method="post" modelAttribute="booking">
			<div class="form-group">
				<label for="pickupLocation">Pickup Location:</label> <select
					class="form-control" id="pickupLocation" name="pickupLocation"
					required>
					<option value="">Select Pickup Location</option>
					<c:forEach items="${ uniquePickupLocations}" var="location">
						<option value="${ location}">${ location}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label for="dropoffLocation">Drop-off Location:</label> <select
					class="form-control" id="dropoffLocation" name="dropoffLocation"
					required>
					<option value="">Select Drop-off Location</option>
					<c:forEach items="${ uniqueDropoffLocations}" var="location">
						<option value="${ location}">${ location}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label for="dateTime">Date & Time:</label><br> <input
					type="date" id="date" name="date" required> <input
					type="time" id="time" name="time" required>
			</div>
			<div class="form-group">
				<label for="cabType">Cab Type:</label><br>
				<form:select path="cab" class="form-control" required="required">
					<form:option value="#">Select Cab Type</form:option>
					<c:forEach items="${ cabTypeList}" var="item">
						<form:option value="${ item.id}">${ item.type}</form:option>
					</c:forEach>
				</form:select>
			</div>





			<div class="form-group">
				<label for="estimatedFare">Estimated Fare:</label><br> <input
					type="text" class="form-control" id="estimatedFare"
					name="estimatedFare" readonly>
			</div>

			<input type="hidden" id="status" name="status" value="Confirmed">
			<div class="center-button">
			<button type="submit" class="btn btn-primary">Book Now</button>
			</div>
			
		</form:form>
        </div>
    </div>

    <!-- Initialize cabFareList JavaScript variable -->
    <script>
    var cabFareList = ${cabFareListJson};

    const pickupLocationSelect = document.getElementById("pickupLocation");
    const dropoffLocationSelect = document.getElementById("dropoffLocation");


    pickupLocationSelect.addEventListener("change", updateEstimatedFare);
    dropoffLocationSelect.addEventListener("change", updateEstimatedFare);


    function updateEstimatedFare() {

        const pickupLocation = pickupLocationSelect.value;
        const dropoffLocation = dropoffLocationSelect.value;


        const farePrice = getFarePrice(pickupLocation, dropoffLocation);


        document.getElementById("estimatedFare").value = farePrice;
    }


    function getFarePrice(pickupLocation, dropoffLocation) {
    
        for (const fare of cabFareList) {
            if (fare.pickupLocation === pickupLocation && fare.dropoffLocation === dropoffLocation) {
                return fare.farePrice;
            }
        }
        return ""; 
    }
    </script>

</body>
</html>
