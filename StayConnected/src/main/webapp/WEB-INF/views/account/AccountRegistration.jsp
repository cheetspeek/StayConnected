<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<html>
<head>
<title>StayConnected Registration</title>
  <style>
 * { font-family: Avenir }
 	error {
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
</head>
<body bgcolor="plum" >
	<div>
		<img src="<s:url value="/resources/images/logo_condensed.png" />" width="294" height="100" />
	</div>
	<h2>Create a New StayConnected Account</h2>
	<form:form method="POST" action="registerConfirmation" modelAttribute="account">
		<form:errors path="*" cssClass="errorblock" element="div" />
		<table>			
				<tr>
					<td>In order to register you on StayConnected, we need
					some information from you. Please fill out the following form
					and submit it when you're done.</td>
				</tr>
				<tr>
					<td>First name:</td>
					<td><form:input path="firstname" /></td>
			    </tr>
			    <tr>
			    	<td>Last name:</td> 
			    	<td><form:input path="lastname" /></td>
			    </tr>
				<tr>
					<td>Email address:</td> 
					<td><form:input path="email" /></td>
				</tr>
				<tr>
					<td>Confirm email address:</td> 
					<td><form:input path="emailConfirm" /></td>
				</tr>
				<tr>
					<td>Password:</td> 
					<td><form:input path="password" /></td>
				</tr>
				<tr>
					<td>Confirm password:</td> 
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
					<td colspan="1"><input type="submit" /></td>
				</tr>
		</table>
	</form:form>
	
	<P><a href="http://localhost:8080/stayconnected/"> <img src="<s:url value="/resources/images/home_box.png" />" width="93" height="35" />
	</a> </P>
</body>
</html>







