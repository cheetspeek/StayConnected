<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="modules" tagdir="/WEB-INF/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
<link rel="stylesheet" href="<s:url value="/resources/css/style.css" />">
<title>Stay Connected - Job Listing Update Confirmation</title>
</head>
<body>
	<modules:nav/>
	
	<modules:header/>
	
	<section>
	<h2>Congratulations!</h2>
	<P>Your listing has been updated.</P>

	<table>
		<tr>
			<td>Contact email address:</td>
			<td>${jobListing.email}</td>
		</tr>
		<tr>
			<td>Listing name:</td>
			<td>${jobListing.company_name}</td>
		</tr>
		<tr>
			<td>Job position:</td>
			<td>${jobListing.position}</td>
		</tr>
	    <tr>
			<td>Job description:</td>
			<td>${jobListing.job_description}</td>
		</tr>
		<tr>
			<td>Job location:</td>
			<td>${jobListing.job_location}</td>
		</tr>
	</table>
	</section>

	<modules:footer/>
</body>
</html>