<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<style>
.error {
	color: #ff0000;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>
<title>Stay Connected: Registration</title>
</head>
<body>
	<h2>Create a New Account</h2>
	<form:form method="POST" action="registerConfirmation" modelAttribute="account">
		<form:errors path="*" cssClass="errorblock" element="div" />
		<table>			
				<tr>
					First Name: <input type="text" name="firstname" path="firstname"> <br>
			    </tr>
			    <tr>
			    	Last Name: <input type="text" name="lastname" path="lastname"> <br>
			    </tr>
				<tr>
					Email: <input type="text" name="email" path="email"> <br>
				</tr>
				<tr>
					Confirm Email: <input type="text" name="emailConfirm" path="emailConfirm"> <br>
				</tr>
				<tr>
					Password: <input type="text" name="password" path="password"> <br>
				</tr>
				<tr>
					Confirm Password: <input type="text" name="passwordConfirm" path="passwordConfirm"> <br>
				</tr>
				<tr colspan="3">
					<input type="submit" />
				</tr>
		</table>
	</form:form>
	<p>
		<a href="http://localhost:8080/stayconnected/">Return Home</a>
	</p>
</body>
</html>







