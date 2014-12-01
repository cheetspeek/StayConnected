<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="modules" tagdir="/WEB-INF/tags" %>
<html>
<head>
<title>StayConnected</title>
<link rel="stylesheet" href="<s:url value="/resources/css/style.css" />">
</head>
<body>
	<!-- <modules:header/> -->
	<div style="text-align: center;">
		<img src="<s:url value="/resources/images/alt_logo.png" />" width="340" height="73" />
		<!-- <br><br><br> -->
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
	
	<P><a href="register"> <img src="<s:url value="/resources/images/nav/sign_up_box.png" />" width="183" height="55" />
	</a> </P>
	</div>
	
	<modules:footer/>
</body>
</html>