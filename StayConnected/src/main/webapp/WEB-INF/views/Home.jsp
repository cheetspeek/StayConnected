<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>StayConnected!</title>
</head>
<body>
	<h1>Welcome to StayConnected!</h1>
	<p>${error_message}</p>
	<s:url var="authUrl" value="/j_spring_security_check" />
	<form class='signin' method="post" action="${authUrl}">
		User: <input id="username" type='text' name='j_username'><br>
		Password: <input id="password" type='password' name='j_password'><br>
		<input id="remember_me" name="_spring_security_remember_me"
			type="checkbox" /> Remember Me <br> <input type='submit'
			name='commit' value="Sign in"> <input type='reset'
			name='reset'>
	</form>
</body>
<img src="./src/main/webapp/images/stayconnected_logo.jpg"	alt="logo" />
</html>


