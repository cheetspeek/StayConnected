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
<<<<<<< HEAD
					<td>First Name:</td>
					<td><form:input path="firstname" /></td>
					<td><form:errors path="firstname" cssClass="error" />
=======
					First Name: <input type="text" name="firstname" path="firstname"> 

			    </tr>
			    <tr>
<<<<<<< HEAD
			    	<td>Last Name:</td>
			    	<td><form:input path="lastname"/></td>
			    	<td><form:errors path="lastname" cssClass="error" />
=======
			    	Last Name: <input type="text" name="lastname" path="lastname"> 
>>>>>>> branch 'master' of ssh://fastrax@134.198.169.34/home/fastrax/git/StayConnected
			    </tr>
				<tr>
<<<<<<< HEAD
					<td>Email:</td>
					<td><form:input path="email"/></td>
					<td><form:errors path="email" cssClass="error" />
=======
					Email: <input type="text" name="email" path="email"> 
>>>>>>> branch 'master' of ssh://fastrax@134.198.169.34/home/fastrax/git/StayConnected
				</tr>
				<tr>
<<<<<<< HEAD
					<td>Confirm Email:</td>
					<td><form:input path="emailConfirm"/></td>
					<td><form:errors path="emailConfirm" cssClass="error" />
=======
					Confirm Email: <input type="text" name="emailConfirm" path="emailConfirm"> 
>>>>>>> branch 'master' of ssh://fastrax@134.198.169.34/home/fastrax/git/StayConnected
				</tr>
				<tr>
<<<<<<< HEAD
					<td>Password:</td>
					<td><form:input path="password"/></td>
					<td><form:errors path="password" cssClass="error" />
=======
					Password: <input type="text" name="password" path="password"> 
>>>>>>> branch 'master' of ssh://fastrax@134.198.169.34/home/fastrax/git/StayConnected
				</tr>
				<tr>
<<<<<<< HEAD
					<td>Confirm Password:</td>
					<td><form:input path="passwordConfirm"/></td>
					<td><form:errors path="passwordConfirm" cssClass="error" />
=======
					Confirm Password: <input type="text" name="passwordConfirm" path="passwordConfirm"> 
>>>>>>> branch 'master' of ssh://fastrax@134.198.169.34/home/fastrax/git/StayConnected
				</tr>
				<tr>
<<<<<<< HEAD
					<td colspan="3"><input type="submit" /></td>
=======
				 		<input type="radio" name="role" value="Faculty"/>Faculty 
						<input type="radio" name="role" value="Student"/>Student
						<input type="radio" name="role" value="Alumni"/>Alumni 
				</tr> 
				<tr>
					<input type="submit" />
>>>>>>> branch 'master' of ssh://fastrax@134.198.169.34/home/fastrax/git/StayConnected
				</tr>
		</table>
	</form:form>
	<p>
		<a href="http://localhost:8080/stayconnected/">Return Home</a>
	</p>
</body>
</html>







