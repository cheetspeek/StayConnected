<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="modules" tagdir="/WEB-INF/tags" %>
<html>
<head>
<link rel="stylesheet" href="<s:url value="/resources/css/style.css" />">
<title>Stay Connected</title>
</head>
<body>
	<modules:nav/>
	
	<modules:header/>
	
	<section>
	<h2>Search Job Listings</h2>
	<form:form method="POST" action="searchLocationConfirmation" modelAttribute ="searchListing">
		<form:errors path="*" cssClass="errorblock" element="div" />
		<P>Please enter at least one of the following fields (multi-field searches are allowed)</P>
		<table>
			<tr>
				<td>Posted Email:</td>
				<td><form:input path="email" readonly="false" /></td>
			</tr>
			<tr>
				<td>Position:</td>
				<td><form:input path="position" readonly="false" /></td>
			</tr>
			<tr>
				<td>Company:</td>
				<td><form:input path="company_name" readonly="false" /></td>
			</tr>
			<tr>
				<td>Job Description:</td>
				<td><form:input path="job_description" readonly="false" /></td>
			</tr>
			<tr>
				<td>Location:</td>
				<td><form:input path="job_location" readonly="false" /></td>
			</tr>
			<tr>
				<td><input type="image" src="<s:url value="/resources/images/nav/submit_box.png" />" width="93" height="35" /></td>
			</tr>
		</table>
	</form:form>
	</section>

	<modules:footer/>
</body>
</html>