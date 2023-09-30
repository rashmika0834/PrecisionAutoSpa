<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

<!-- Bootstrap link-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>


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
				<div class="card" style="width: 22rem;">
					<div class="card-header">Name : Rashmika</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">Email :
							rashmikapramodya@gmail.com</li>
						<li class="list-group-item">Contact : 0719133821</li>
						<li class="list-group-item">Country : SriLanka</li>
					</ul>
					<div class="col-12">
						<button type="submit" class="btn btn-primary">Sign Out</button>
					</div>
				</div>
				<a href="login.jsp">Click Here to Login</a>
			</div>


			<div class="con2-2">
				<h2>Enter Details for a new Booking</h2>
				<form method="post" action="BkingServlet" class="new-booking"
					id="new-booking">
					<div class="row mb-3 mt-5">
						<label for="colFormLabel" class="col-sm-2 col-form-label">Email</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="email" name="email"
								required="required">
						</div>
					</div>
					<div class="row mb-3">
						<label for="colFormLabel" class="col-sm-2 col-form-label">Name</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="username"
								name="username">
						</div>
					</div>
					<div class="row mb-3">
						<label for="colFormLabel" class="col-sm-2 col-form-label">Contact</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="contact"
								name="contact">
						</div>
					</div>
					<div class="row mb-3">
						<label for="colFormLabel" class="col-sm-2 col-form-label">Date
							of Service</label>
						<div class="col-sm-10">
							<input type="date" class="form-control" id="date" name="date">
						</div>
					</div>
					<div class="row mb-3">
						<label for="colFormLabel" class="col-sm-2 col-form-label">Mileage
							in Km</label>
						<div class="col-sm-10">
							<input type="number" class="form-control" id="mileage"
								name="mileage">
						</div>
					</div>
					<div class="row mb-3">
						<label for="colFormLabel" class="col-sm-2 col-form-label">Vehicle
							Reg. Number</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="vehicle_no"
								name="vehicle_no">
						</div>
					</div>

					<div class="row mb-3">
						<label for="colFormLabel" class="col-sm-2 col-form-label">Location</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="location"
								name="location">
						</div>
					</div>

					<label for="colFormLabel" class="col-sm-2 col-form-label">Choose
						a Time</label>
					<div class="row mb-3">

						<select class="form-select" id="specificSizeSelect"
							name="selectedTime">
							<option selected>Choose...</option>
							<option value="10:00:00.00" id="10AM">10AM</option>
							<option value="11:00:00.00" id="11AM">11AM</option>
							<option value="12:00:00.00" id="12AM">12PM</option>
						</select>
					</div>

					<div class="row mb-3">
						<label for="colFormLabel" class="col-sm-2 col-form-label">Message(Optional)
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="message"
								name="message">
						</div>
					</div>

					<div class="col-12">
						<button type="" class="btn btn-primary">Add Booking</button>
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
				<h1>Upcoming Bookings</h1>
			</div>
			
			<table class="table">
				<thead class="table-dark">
					<tr>
						<th scope="col">#</th>
						<th scope="col">Name</th>
						<th scope="col">DOS</th>
						<th scope="col">Mileage</th>
						<th scope="col">Location</th>
						<th scope="col"></th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>Mark</td>
						<td>Otto</td>
						<td>@mdo</td>
						<td>Thornton</td>
						<td><button type="" class="btn btn-danger">Delete
								Booking</button></td>

					</tr>
					<tr>
						<th scope="row">2</th>
						<td>Jacob</td>
						<td>Thornton</td>
						<td>@fat</td>
						<td>@mdo</td>
						<td><button type="" class="btn btn-danger">Delete
								Booking</button></td>

					</tr>
					<tr>
						<th scope="row">3</th>
						<td>Larry</td>
						<td>@twitter</td>
						<td>@fat</td>
						<td>@fat</td>
						<td><button type="" class="btn btn-danger">Delete
								Booking</button></td>

					</tr>
				</tbody>
			</table>
		</div>

	</div>




</body>
</html>