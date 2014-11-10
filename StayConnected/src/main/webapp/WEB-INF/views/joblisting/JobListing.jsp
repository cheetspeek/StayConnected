<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Stay Connected</title>
</head>
<body>
	<h2>View Job Listings</h2>
	<table border='1'>
 	<tr><td>Job Name</td><td>Job Position</td><td>Contact Email</td><td>Job Description</td><td>Job Location</td></tr>
 	<c:forEach items="${listing}" var="current">
     	<tr>
     	<td><c:out value = "${current.job_name}"/></td>
     	<td><c:out value = "${current.position}"/></td>
     	<td><c:out value = "${current.email}"/></td>
    	<td><c:out value = "${current.job_description}"/></td>
     	<td><c:out value = "${current.job_location}"/></td>
     	</tr>
    </c:forEach>
</table>
</body>
</html>