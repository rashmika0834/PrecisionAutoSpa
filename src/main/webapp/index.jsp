<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.io.BufferedReader, java.io.InputStreamReader, java.net.HttpURLConnection, java.net.URL, java.io.OutputStream" %>
<%@ page import="java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement, java.sql.Connection" %>



<%
String id = request.getParameter("booking_id");
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://172.187.178.153:3306/isec_assessment2";
String userid = "isec";
String password = "EUHHaYAmtzbv";

try {
	Class.forName(driver);
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

HttpSession loginSession = request.getSession(false);
if (loginSession == null || loginSession.getAttribute("isLoggedIn") == null || !(boolean)loginSession.getAttribute("isLoggedIn")) {
   response.sendRedirect("login.jsp");
}

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Precision Auto Spa</title>

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>

<!-- Google fonts-->

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Manrope:wght@800&display=swap"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>

 <script>
    function handleLogout() {
     
        localStorage.removeItem('access_token');
        localStorage.removeItem('id_token');

        window.location.href = 'login.jsp';

        return false;
    }
</script>

<link href="css/index-style.css" rel="stylesheet" />
</head>

<body>

	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
	<div class="cont">
		<h1>Welcome to Precision Auto Spa</h1>
	</div>

	<div class="mainCont">
		<div class="cont-2">

			<div class="con2-1">
				<h2>User Info</h2>
				<div class="card" style="width: 22rem;" id="infoTable">
					<div class="card-header" id="userName">First Name : <c:out value="${data.given_name}" /></div>
					<div class="card-header" id="lastName">Last Name : <c:out value="${data.family_name}" /> </div>
					<div class="card-header" id="email">Email : <c:out value="${data.email}" /></div>
					<div class="card-header" id="contact">Contact Number: <c:out value="${data.phone_number}" /></div>
					<div class="card-header" id="country">Country : <c:out value="${data.address.country}" /> </div>
					<div class="col-12">
					
		<form class="app-login-form" role="form" 
		action="https://api.asgardeo.io/t/rashmika/oidc/logout" 
		method="post" autocomplete="off" >
		
			<input type="submit" id="btn-login" class="btn btn-primary" value="Sign out">
		</form>
					
			
					</div>
				</div>
				
			</div>


			<div class="con2-2">
				<h2>Enter Details for a new Booking</h2>
				<form method="post" action="BkingServlet" class="new-booking"
					id="new-booking">
			
						
						
							<input type="hidden" class="form-control" id="formUsername" name="username">
					
				
					<div class="row mb-3">
						<label for="colFormLabel" class="col-sm-2 col-form-label">Date
							of Service</label>
						<div class="col-sm-10">
							<input type="date" class="form-control" id="date" name="date" required="required">
						</div>
					</div>
					<div class="row mb-3">
						<label for="colFormLabel" class="col-sm-2 col-form-label">Mileage
							in Km</label>
						<div class="col-sm-10">
							<input type="number" class="form-control" id="mileage" name="mileage" required="required">
						</div>
					</div>
					<div class="row mb-3">
						<label for="colFormLabel" class="col-sm-2 col-form-label">Vehicle
							Reg. Number</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="vehicle_no" name="vehicle_no" required="required">
						</div>
					</div>

					<div class="row mb-3">
						<label for="colFormLabel" class="col-sm-2 col-form-label">Location</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="location" name="location" required="required">
						</div>
					</div>

					
					<div class="row mb-3">
						<label for="colFormLabel" class="col-sm-2 col-form-label" >Choose
						a Time</label>
						<select class="form-select" id="specificSizeSelect"
							name="selectedTime" required="required">
							<option selected>Choose...</option>
							<option value="10:00:00.00" id="10AM">10AM</option>
							<option value="11:00:00.00" id="11AM">11AM</option>
							<option value="12:00:00.00" id="12AM">12PM</option>
						</select>
					</div>

					<div class="row mb-3">
						<label for="colFormLabel" class="col-sm-2 col-form-label">Message
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="message"
								name="message">
						</div>
					</div>

					<div class="col-12">
						<button type="submit" class="btn btn-primary">Add Booking</button>
					</div>
				</form>

			</div>

			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
			<link rel="stylesheet" href="alert/dist/sweetalert.css">

			<script type="text/javascript">
				var status = document.getElementById("status").value;
				if (status == "success") {
					swal("Done!", "New Booking has Created", "success");
				}
			</script>
			


		</div>


		<div class="tableMain">
			<div class="table-heading">
				<h1>All Bookings</h1>
			</div>

			<table class="table">


				<thead class="table-dark">
					<tr>
						<th scope="col">Booking ID</th>
						<th scope="col">Name</th>
						<th scope="col">DOS</th>
						<th scope="col">Mileage</th>
						<th scope="col">Location</th>
						<th scope="col"></th>

					</tr>
				</thead>

				<%
				try {
					connection = DriverManager.getConnection(connectionUrl, userid, password);
					statement = connection.createStatement();
					String sql = "select * from vehicle_service where username = 'hello@gmail.com'";
					resultSet = statement.executeQuery(sql);
					while (resultSet.next()) {

						String bookingId = resultSet.getString("booking_id");
						String username = resultSet.getString("username");
						String mileage = resultSet.getString("mileage");
						String location = resultSet.getString("location");
						String date = resultSet.getString("date");
				%>

				<tbody>
					<tr>
						<th scope="row"><%=bookingId%></th>
						<td><%=username%></td>
						<td><%=date%></td>
						<td><%=mileage%></td>
						<td><%=location%></td>
						<td>
							<form method="post" action="DltBookingServlet">
								<input type="hidden" name="booking_id" value="<%=bookingId%>">
								<button type="submit" class="btn btn-danger">Delete
									Booking</button>
							</form>
						</td>

					</tr>

					<%
					}
					} catch (Exception e) {
					e.printStackTrace();
					}
					%>

				</tbody>
			</table>
		</div>

	</div>




</body>

<script>
    document.addEventListener("DOMContentLoaded", function () {
      
        fetch("https://api.asgardeo.io/t/rashmika/oauth2/userinfo", {
        	
            method: "GET",
            headers: {
                "Authorization": "Bearer " + localStorage.getItem('access_token') 
            }
        })
        .then(response => response.json())
        .then(data => {
           
            console.log("User Info:", data);
            
            document.getElementById("formUsername").value = data.username;
            
            document.getElementById("userName").textContent = "First Name : " + data.given_name;
            document.getElementById("lastName").textContent = "Last Name : " + data.family_name;
            document.getElementById("email").textContent = "Email : " + data.username;
            document.getElementById("contact").textContent = "Contact : " + data.phone_number;
            document.getElementById("country").textContent = "Country : " + data.address.country;
          
         
        })
        .catch(error => console.error("Error fetching userinfo:", error));
    });
</script>


</html>