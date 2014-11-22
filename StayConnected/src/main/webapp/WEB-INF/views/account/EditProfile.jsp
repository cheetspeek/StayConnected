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
<script type="text/javascript" src="<c:url value="/resources/js/countries.js" />"></script>
<title>Stay Connected</title>
</head>
<body>
	<img src="<s:url value="/resources/images/logo_condensed.png" />"
		width="220" height="75" style="float: right" />
	<h2>Profile Updating</h2>
	<form:form method="POST" action="editprofileconfirmation" modelAttribute="profile">
		<form:errors path="*" cssClass="errorblock" element="div" />
		<P>Message text here?</P>
		<table>
			<tr>
				<td><form:input path="id" type="hidden" value="${profile.id}" /></td>
			</tr>
			<tr>
				<td><form:input path="roleList" type="hidden" value="${profile.roleList}" /></td>
			</tr>
			<tr>
				<td>First Name:</td>
				<td><form:input path="firstname" /></td>
				<td><form:errors path="firstname" cssClass="error" />
			</tr>
			<tr>
				<td>Last Name:</td>
				<td><form:input path="lastname" /></td>
				<td><form:errors path="lastname" cssClass="error" />
			</tr>
			<tr>
				<td>Email:</td>
				<td><form:input path="email" /></td>
				<td><form:errors path="email" cssClass="error" />
			</tr>

			<tr>
				<td>Phone:</td>
				<td><form:input path="phone" /></td>
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
				<!--  
				<td><form:input path="country" value="${current.country}" /></td>
				-->
				<td><select id="country" name="country"></select></td>
			</tr>
			<tr>
				<td>State:</td>
				<!--
				<td><form:input path="state" value="${current.state}" /></td>
				-->
				<td><select id="state" name="state"></select></td>
			</tr>
			<tr>
				<td><input type="image"
					src="<s:url value="/resources/images/nav/submit_box.png" />" width="93"
					height="35" /></td>
			</tr>
		</table>
	</form:form>
	<a href="${contextPath}/"> <img
		src="<s:url value="/resources/images/nav/home_box.png" />" width="93"
		height="35" />
	</a>
</body>
</html>

<script>
   	populateCountries("country", "state");
</script>