<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<html>
<head>
<title>Stay Connected</title>
  <style>
 * { font-family: Avenir }
  </style>
</head>
<body bgcolor="plum" >
	<div style="text-align: center;">
		<img src="<s:url value="/resources/images/logo_trans.png" />" width="543" height="200" />
	</div>
	<div>
		<h2>Welcome to StayConnected!</h2>
		<p>${error_message}</p>
		<s:url var="authUrl" value="/j_spring_security_check" />
		<form class='signin' method="post" action="${authUrl}">
			Email:<input id="username" type='text' name='j_username'>
			Password: <input id="password" type='password' name='j_password'><br>
			<input id="remember_me" name="_spring_security_remember_me"
				type="checkbox" /> Remember Me <br> <input type='submit'
				name='commit' value="Sign in"> <input type='reset'
				name='reset' value="Clear">
		</form>
	</div>
	
	<P>  <a href="register" >New to StayConnected? Sign up here.</a> </P>
</body>
</html>