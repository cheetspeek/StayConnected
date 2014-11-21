<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
<link href="<s:url value="/resources/css/visuals.css" />" rel="stylesheet">
<title>Stay Connected - Job Listing Update Confirmation</title>
</head>
<body bgcolor=#D9C1F3 >
	<img src="<s:url value="/resources/images/logo_condensed.png" />" width="220" height="75" style="float: right" />
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
	<a href="${contextPath}/"> <img src="<s:url value="/resources/images/home_box.png" />" width="93" height="35" />
	</a>
</body>
</html>