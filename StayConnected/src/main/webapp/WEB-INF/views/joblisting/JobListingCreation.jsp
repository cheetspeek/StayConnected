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
<title>Job Listing Creation</title>
</head>
<body>

	<modules:header/>
	
	<section>
	<h2>Create a New Job Listing</h2>
	<form:form method="POST" action="jobListingConfirmation" modelAttribute ="jobListing">
		<P>Here, you can create and post a new job listing for others to see. 
		Please fill out the following form and submit it when you're done.</P>
		<table>
			<tr>
				<td>Contact email address:</td>
				<td><form:input path="email" readonly="true" /></td>
			</tr>
			<tr>
				<td>Company name:</td>
				<td><form:input path="company_name" /></td>
				<td><form:errors path="company_name" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td>Job position:</td>
				<td><form:input path="position" /></td>
				<td><form:errors path="position" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td>Job description:</td>
				<td><form:textarea path="job_description" /></td>
				<td><form:errors path="job_description" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td>Job location:</td>
				<td><form:input path="job_location" /></td>
				<td><form:errors path="job_location" cssClass="error" />
				</td>
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
