<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
<link href="<s:url value="/resources/css/visuals.css" />" rel="stylesheet">
<script type="text/javascript" src="<c:url value="/resources/js/countries.js" />"></script>
<title>StayConnected Registration</title>
</head>
<body>
	<img src="<s:url value="/resources/images/logo_condensed.png" />" width="220" height="75" style="float: right" />
	<h2>Create a New StayConnected Account</h2>
	<form:form method="POST" action="registerConfirmation" modelAttribute="account">
		<form:errors path="*" cssClass="errorblock" element="div" />
		<P>In order to register you on StayConnected, we need
		some information from you. Please fill out the following form
		and submit it when you're done.</P>
		<table>	
				<tr>
					<td>First name:</td>
					<td><form:input path="firstname" /></td>
					<td><form:errors path="firstname" cssClass="error" />
			    </tr>
			    <tr>
			    	<td>Last name:</td>
			    	<td><form:input path="lastname" /></td>
			    	<td><form:errors path="lastname" cssClass="error" />
			    </tr>
			    <tr>
			    	<td>Address:</td>
			    	<td><form:input path="address" /></td>
			    </tr>
			    <tr>
			    	<td>City:</td>
			    	<td><form:input path="city" /></td>
			    </tr>
			    <tr>
					<td>Country:</td> 
					<td><select id="country" name="country"></select></td>
				</tr>
			    <tr>
			    	<td>State:</td>
			    	<td><select id="state" name="state" ></select></td>
			    </tr>
 				<tr>
					<td>Phone Number:</td> 
					<td><form:input path="phone" /></td>
				</tr>
				<tr>
					<td>Email Address:</td> 
					<td><form:input path="email" /></td>
					<td><form:errors path="email" cssClass="error" />
				</tr>
				<tr>
					<td>Confirm Email Address:</td> 
					<td><form:input path="emailConfirm" /></td>
					<td><form:errors path="emailConfirm" cssClass="error" />
				</tr>
				<tr>
					<td>Password:</td> 
					<td><form:input path="password" type="password"/></td>
					<td><form:errors path="password" cssClass="error" />
				</tr>
				<tr>
					<td>Confirm Password:</td>
					<td><form:input path="passwordConfirm" type="password"/></td>
					<td><form:errors path="passwordConfirm" cssClass="error" />
				</tr>
				<tr>
					<td>Roles:</td>
				 	<td>
				 		<input type="checkbox" name="roleList" value="Faculty"/>Faculty 
						<input type="checkbox" name="roleList" value="Student"/>Student
						<input type="checkbox" name="roleList" value="Alumni"/>Alumni 
					</td>
					<td><form:errors path="roleList" cssClass="error" />
				</tr> 
		</table>
		<td>
		<input type="image" src="<s:url value="/resources/images/nav/submit_box.png" />" width="93" height="35" />
		</td>
	</form:form>
	
	<P><a href="${contextPath}/"> <img src="<s:url value="/resources/images/nav/home_box.png" />" width="93" height="35" />
	</a> </P>
</body>
</html>

<script>
   	populateCountries("country", "state");
</script>