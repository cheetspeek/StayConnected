<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="modules" tagdir="/WEB-INF/tags" %>
<html>
<head>
<link rel="stylesheet" href="<s:url value="/resources/css/style.css" />">
<title>Account Home Page</title>
</head>
<body>

	<modules:header/>
	
	<section>
		<h2>Account Home Page</h2>
		<p>Your email address is: <security:authentication property="principal.username" /></p>
		<h2>Recent Job Listings</h2>
		<P>The three most recent job postings will go here?</P>
		
		<c:forEach items="${listing}" var="current">
		<table>
	    	<tr>
	    		<td>Job Name:</td>
	    		<td><c:out value = "${current.company_name}"/></td>
	    	</tr>
	       	<tr>
	    		<td>Job Position:</td>
	    		<td><c:out value = "${current.position}"/></td>
	    	</tr>
	    	<tr>
	    		<td>Job Description:</td>
	    		<td><c:out value = "${current.job_description}"/></td>
	    	</tr>
	    	<tr>
	    		<td>Location:</td>
	    		<td><c:out value = "${current.job_location}"/></td>
	    	</tr>
	    	<tr>
	    		<td>Contact Email:</td>
	    		<td><c:out value = "${current.email}"/></td>
	    	</tr>
    	</table>
		<hr>
	</c:forEach>
	</section>
	
	<modules:footer/>
</body>
</html>

