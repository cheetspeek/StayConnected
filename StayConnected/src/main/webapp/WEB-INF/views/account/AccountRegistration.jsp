<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
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
					<td>First Name:</td>
					<td><form:input path="firstname" /></td>
			    </tr>
			    <tr>
			    	<td>Last Name:</td> 
			    	<td><form:input path="lastname" /></td>
			    </tr>
				<tr>
					<td>Email:</td> 
					<td><form:input path="email" /></td>
				</tr>
				<tr>
					<td>Confirm Email:</td> 
					<td><form:input path="emailConfirm" /></td>
				</tr>
				<tr>
					<td>Password:</td> 
					<td><form:input path="password" /></td>
				</tr>
				<tr>
					<td>Confirm Password:</td> 
					<td><form:input path="passwordConfirm" /></td>
				</tr>
				<tr>
					<td>Role(s):</td>
					<td>
				 		<input type="checkbox" name="roleList" value="Faculty"/>Faculty 
						<input type="checkbox" name="roleList" value="Student"/>Student
						<input type="checkbox" name="roleList" value="Alumni"/>Alumni 
					</td>
				</tr> 
				<tr>
					<td colspan="3"><input type="submit" /></td>
				</tr>
		</table>
	</form:form>
	<p>
		<a href="http://localhost:8080/stayconnected/">Return Home</a>
	</p>
</body>
</html>







