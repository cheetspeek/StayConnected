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
<title>Administrator Functions</title>
<link rel="stylesheet" href="<s:url value="/resources/css/style.css" />">
</head>
<body>

	<modules:header/>
	
	<section>
	<h2>Activation or deactivation confirmed.</h2>
 
	<table>
		<tr>
			<td>Posted Email:</td>
			<td>${jobListings.email}</td>
		</tr>
		<tr>
			<td>Company Name:</td>
			<td>${jobListings.company_name}</td>
		</tr>
		<tr>
			<td>Job Position:</td>
			<td>${jobListings.position}</td>
		</tr>
				<tr>
			<td>Job Description:</td>
			<td>${jobListings.job_description}</td>
		</tr>
				<tr>
			<td>Job Location:</td>
			<td>${jobListings.job_location}</td>
		</tr>
		<tr>
			<td>Status :</td>
			<td>${jobListings.active}</td>
		</tr>
	</table>
	<p>
		<a href="${contextPath}/joblistingstatus">Return To Job Listing Status</a>
	</P>
	</section>

	<modules:footer/>
</body>
</html>