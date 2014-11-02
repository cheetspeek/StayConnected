<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>StayConnected!</title>
</head>
<body>
	<h1>Welcome to StayConnected!</h1>
	<form class='signin' method="post" action="${authUrl}">
		Email: <input id="username" type='text' name='j_username'><br>
		Password: <input id="password" type='password' name='j_password'><br>
		<input type='submit'name='commit' value ="Sign in">
		<input type='reset' name='reset' value="Clear">
	</form>
	<P>  <a href="AccountRegistration">Sign Up</a> </P>	
</body>
<img src="./src/main/webapp/images/stayconnected_logo.jpg"	alt="logo" />
</html>


