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
					First Name: <input type="text" name="firstname" path="firstname"> 
			    </tr>
			    <tr>
			    	Last Name: <input type="text" name="lastname" path="lastname"> 
			    </tr>
				<tr>
					Email: <input type="text" name="email" path="email"> 
				</tr>
				<tr>
					Confirm Email: <input type="text" name="emailConfirm" path="emailConfirm"> 
				</tr>
				<tr>
					Password: <input type="text" name="password" path="password"> 
				</tr>
				<tr>
					Confirm Password: <input type="text" name="passwordConfirm" path="passwordConfirm"> 
				</tr>
				<tr>
				 		<input type="checkbox" items="${locationList}" name="roleList" value="Faculty"/>Faculty 
						<input type="checkbox" items="${locationList}" name="roleList" value="Student"/>Student
						<input type="checkbox" items="${locationList}" name="roleList" value="Alumni"/>Alumni 
				</tr> 
				<tr>
					<input type="submit" />
				</tr>
		</table>
	</form:form>
	<p>
		<a href="http://localhost:8080/stayconnected/">Return Home</a>
	</p>
</body>
</html>







