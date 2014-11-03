<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<html>
<head>
<title>Stay Connected Login</title>
</head>
<body>
	<div>
		<h2>StayConnected Login Fantastic!</h2>
		<!-- <img alt="logo" src="images/stayconnected_logo.jpg"> -->
		<!-- <img src='<c:url value="resources/images/stayconnected_logo.jpg"/>' class="logo"/> -->
		<img src="/resources/images/logo.jpg" />
		<p>${error_message}</p>
		<s:url var="authUrl" value="/j_spring_security_check" />
		<form class='signin' method="post" action="${authUrl}">
			Email: <input id="username" type='text' name='j_username'><br>
			Password: <input id="password" type='password' name='j_password'><br>
			<input id="remember_me" name="_spring_security_remember_me"
				type="checkbox" /> Remember Me <br> <input type='submit'
				name='commit' value="Sign in"> <input type='reset'
				name='reset' value="Clear">
		</form>
	</div>
	
	<P>  <a href="register" >Register</a> </P>
</body>
</html>