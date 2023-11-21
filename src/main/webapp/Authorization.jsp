<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%

String code = request.getParameter("code");

// Retrieve the 'session_state' parameter from the URL
String sessionState = request.getParameter("session_state");


%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="ISO-8859-1">
<title>Redirecting...</title>
</head>
<body>

	
	<script type="text/javascript">
	
	function getToken() {
		

        var code = '<%= code %>';
        var sessionstate = '<%= sessionState %>';
        
        
        
		var settings = {
			    "url": "https://api.asgardeo.io/t/rashmika/oauth2/token",
			    "method": "POST",
			    "timeout": 0,
			    "headers": {
			        "Content-Type": "application/x-www-form-urlencoded"
			    },
			    "data": {
			        "code": code,
			        "grant_type": "authorization_code",
			        "client_id": "JwZ1HxKs2I7YBnz6DWKNwZyR1bca",
			        "client_secret": "OipO2efUkHt8FMHcENdM7e6ahxaiLtxfTyQHW6d1cNUa",
			        "redirect_uri": "http://localhost:8080/testing/Authorization.jsp"
			    }
			};

			$.ajax(settings).done(function (response) {
			    console.log(response);
			    
			    var access_token = response.access_token;
			    var id_token = response.id_token;
			    
			    localStorage.setItem('access_token', access_token);
			    localStorage.setItem('id_token', id_token);
			    
			   
			   	window.location.href = "index.jsp";
			    
			}).fail(function (error) {
            	// Handle any errors here
            	console.log(error);
            	console.error('Errors occured:', error);
            	window.location.href = "login.jsp";
            	alert(error);
            	});


	}
	getToken();
	
	</script>
	
	
	
</body>
</html>