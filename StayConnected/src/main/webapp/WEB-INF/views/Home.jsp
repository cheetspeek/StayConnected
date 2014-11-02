<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<div>
	<h2>Login Page</h2>
	<p>${error_message}</p>
	<s:url var="authUrl" value="/j_spring_security_check" />
	<form class='signin' method="post" action="${authUrl}">
		Email: <input id="username" type='text' name='j_username'><br>
		Password: <input id="password" type='password' name='j_password'><br>
		<input type='submit'name='commit' value ="Sign in">
		<input type='reset' name='reset' value ="Clear">
	</form>
</div>
</html>