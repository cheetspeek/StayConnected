<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<html>
<head>
	<title>Stay Connected</title>
	<style>
	.error {
		color: #ff0000;
	}
	.errorblock {
		color: #000;
		background-color: #ffEEEE;
		border: 3px solid #ff0000;
		padding: 8px;
		margin: 16px;
	}
	</style>
</head>
<body>
	<h2>Job Listing Creation/Update</h2>
	<form:form method="POST" action="jobListingConfirmation" modelAttribute ="jobListing">
		<form:errors path="*" cssClass="errorblock" element="div" />
		<table>
			<tr>
				<td>Contact Email:</td>
				<td><security:authentication property="principal.username" /></td>
			</tr>
			<tr>
				<td>Job Position:</td>
				<td><form:input path="position" /></td>
				<td><form:errors path="position" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td>Listing name:</td>
				<td><form:input path="job_name" /></td>
				<td><form:errors path="job_name" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td>Description:</td>
				<td><form:input path="job_description" /></td>
				<td><form:errors path="job_description" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td>Location:</td>
				<td><form:input path="job_location" /></td>
				<td><form:errors path="job_location" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" /></td>
			</tr>
		</table>
	</form:form>
</body>
</html>