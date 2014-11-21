<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<link href="<s:url value="/resources/css/visuals.css" />" rel="stylesheet">
<title>Stay Connected</title>
<style>
.error {
	color: #ff0000;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 1px solid #ff0000;
	padding: 4px;
	margin: 8px;
}
</style>
</head>
<body bgcolor=#D9C1F3>
	<img src="<s:url value="/resources/images/logo_condensed.png" />"
		width="220" height="75" style="float: right" />
	<h2>Profile Updating</h2>
	<form:form method="POST" action="editprofileconfirmation"
		modelAttribute="profile">
		<form:errors path="*" cssClass="errorblock" element="div" />
		<P>Message text here?</P>
		<table>
			<tr>
				<td>First Name:</td>
				<td><form:input path="firstname" value="${profile.firstname}" /></td>
			</tr>
			<tr>
				<td>Last Name:</td>
				<td><form:input path="lastname" value="${profile.lastname}" /></td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><form:input path="email" value="${profile.email}" /></td>
			</tr>

			<tr>
				<td>Phone:</td>
				<td><form:input path="phone" value="${current.phone}" /></td>
			</tr>
			<tr>
				<td>Address:</td>
				<td><form:input path="address" value="${current.address}" /></td>
			</tr>
			<tr>
				<td>City:</td>
				<td><form:input path="city" value="${current.city}" /></td>
			</tr>
			<tr>
				<td>Country:</td>
				<td><form:input path="country" value="${current.country}" /></td>
			</tr>
			<tr>
				<td>State:</td>
				<td><form:input path="state" value="${current.state}" /></td>
			</tr>
			<tr>
				<td><input type="image"
					src="<s:url value="/resources/images/submit_box.png" />" width="93"
					height="35" /></td>
			</tr>
		</table>
	</form:form>
	<a href="${contextPath}/"> <img
		src="<s:url value="/resources/images/home_box.png" />" width="93"
		height="35" />
	</a>
</body>
</html>