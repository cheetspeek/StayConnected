<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<link href="<s:url value="/resources/css/visuals.css" />" rel="stylesheet">
	<title>Stay Connected</title>
	<style>
	.error {
		color: #ff0000;
	}
	.errorblock {
		color: #000;
		background-color: #ffEEEE;
		border: 2px solid #ff0000;
		padding: 4px;
		margin: 8px;
	}
	</style>
</head>
<body bgcolor=#D9C1F3>
	<img src="<s:url value="/resources/images/logo_condensed.png" />" width="220" height="75" style="float: right" />
	<h2>Job Listing Creation</h2>
	<form:form method="POST" action="jobListingConfirmation" modelAttribute ="jobListing">
		<form:errors path="*" cssClass="errorblock" element="div" />
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
				<td><form:input path="job_description" /></td>
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
	<a href="${contextPath}/"> <img src="<s:url value="/resources/images/nav/home_box.png" />" width="93" height="35" />
	</a>
</body>
</html>