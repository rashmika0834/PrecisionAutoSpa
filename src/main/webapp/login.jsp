<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>


<link href="css/login.css" rel="stylesheet" />
</head>




<body>
	<div class="hero">

		<div class="text-center mb-5">
			<img src="images/new.png" class="rounded" alt="...">
		</div>

		<form class="app-login-form" role="form" action="" method="post"
			autocomplete="off">
			<input
				onclick="window.location.href='https://api.asgardeo.io/t/rashmika/oauth2/authorize?response_type=code&client_id=JwZ1HxKs2I7YBnz6DWKNwZyR1bca&scope=openid%20address%20email%20phone%20profile&redirect_uri=http://localhost:8090/PrecisionAutoSpa/Authorization.jsp
'"
				type="submit" id="btn-login" class="btn btn-info" value="Log In">
		</form>
	</div>

</body>
</html>