<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<html>
<body>
	<h2>Your listing has been posted.</h2>

	<table>
		<tr>
			<td>Contact Email:</td>
			<td>${jobListing.email}</td>
		</tr>
		<tr>
			<td>Listing Name:</td>
			<td>${jobListing.job_name}</td>
		</tr>
		<tr>
			<td>Job Position:</td>
			<td>${jobListing.position}</td>
		</tr>
	    <tr>
			<td>Job Description:</td>
			<td>${jobListing.job_description}</td>
		</tr>
		<tr>
			<td>Job Location:</td>
			<td>${jobListing.job_location}</td>
		</tr>
	</table>
</body>
</html>