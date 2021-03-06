<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="modules" tagdir="/WEB-INF/tags"%>
<html>
<head>
<link rel="stylesheet" href="<s:url value="/resources/css/style.css" />">
<script type="text/javascript" src="<c:url value="/resources/js/countries.js" />"></script>
<title>Update Your Profile</title>
</head>
<body>
	<modules:header/>
	
	<section>
	<h2>Update Your Profile: Password Confirmation</h2>
	<form:form method="POST" action="editmyprofile" modelAttribute="profile">
		<P>Before you can update your profile, please confirm your current password.</P>
		<table>
		<tr>
				<td>Password:</td>
				<td><form:input path="password" type="password"/></td>
				<td><form:errors path="password" cssClass="error" />
			</tr>
			<tr>
				<td><form:input path="id" type="hidden" value="${profile.id}" /></td>
			</tr>
			<tr>
				<td><form:input path="roleList" type="hidden" value="${profile.roleList}" /></td>
			</tr>
			<tr>
				<td><form:input path="firstname"  type="hidden" /></td>
			</tr>
			<tr>
				<td><form:input path="lastname"  type="hidden"/></td>
			</tr>
			<tr>
				<td><form:input path="email"  type="hidden" /></td>
			</tr>
			<tr>
				<td><form:input path="emailConfirm" type="hidden"/></td>
			</tr>
			<tr>
				<td><form:input path="phone"  type="hidden" /></td>
			</tr>
			<tr>
				<td><form:input path="address"  type="hidden" /></td>
			</tr>
			<tr>
				<td><form:input path="city"  type="hidden"/></td>
			</tr>
			<tr>
				<td><form:input path="country" type="hidden"/></td>
			</tr>
			<tr>
				<td><form:input path="state" type="hidden"/></td>
			</tr>
			
			<tr>
				<td><input type="image"
					src="<s:url value="/resources/images/nav/submit_box.png" />" width="93"
					height="35" /></td>
			</tr>
		</table>
	</form:form>
	</section>

	<modules:footer/>
</body>
</html>

<script>
   	populateCountries("country", "state");
</script>