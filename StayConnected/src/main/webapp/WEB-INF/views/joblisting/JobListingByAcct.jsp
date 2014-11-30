<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="modules" tagdir="/WEB-INF/tags"%>
<html>
<head>
<link rel="stylesheet" href="<s:url value="/resources/css/style.css" />">
<title>Your Job Listings</title>
</head>
<body>

	<modules:header/>
	
	<section>
	<h2>Your Job Listings</h2>
    <c:forEach items="${listing}" var="current">
    <div>
    <table>
    	<form:form method="POST" action="updatelisting" modelAttribute="jobListing">
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
    	<tr>
    		<td>
				<input name="id" type="hidden" value=<c:out value="${current.id}" /> />
				<input type="image" value="Update" />
			</td>
		</tr>
		</form:form>
    </table>
	<hr>
	</div>
	</c:forEach>
	</section>
	
	<modules:footer/>
</body>
</html>