<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Stay Connected</title>
</head>
<body>
	<h2>Register Confirmation!</h2>
 
	<table>
		<tr>
			<td>First Name :</td>
			<td>${account.firstname}</td>
		</tr>
		<tr>
			<td>Last Name :</td>
			<td>${account.lastname}</td>
		</tr>
		<tr>
			<td>Email :</td>
			<td>${account.email}</td>
		</tr>
		<tr>
			<td>Password :</td>
			<td>${account.password}</td>
		</tr>
	</table>
 	<p> <a href="http://localhost:8080/stayconnected/" >Return Home</a> </p>
</body>
</html>