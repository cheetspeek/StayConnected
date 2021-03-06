<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="modules" tagdir="/WEB-INF/tags" %>
<html>
<head>
<title>Administrator Functions</title>
<link rel="stylesheet" href="<s:url value="/resources/css/style.css" />">
</head>
<body>
	
	<modules:header/>

	<section>
	<h2>Change Job Listing Status</h2>
	<table border='1'>
		<tr>
			<td>Email</td>
			<td>Company Name</td>
			<td>Job Position</td>
			<td>Job Description</td>
			<td>Job Location</td>
			<td>Active</td>
			<td>Action</td>
		</tr>
		<c:forEach items="${jobListings}" var="current">
			<tr>
				<form:form method="POST" action="joblistingstatusconfirm" modelAttribute="jobListing">					
					<td>
						<c:out value="${current.email}" />
					</td>
					<td>
						<c:out value="${current.company_name}" />
					</td>
					<td>
						<c:out value="${current.position}" />
					</td>
					<td>
						<c:out value="${current.job_description}" />
					</td>
					<td>
						<c:out value="${current.job_location}" />
					</td>
					<td>
				 		<input type="radio" name="active" value="true" <c:if test="${current.active == 'true'}">checked</c:if> />Yes 
						<input type="radio" name="active" value="false" <c:if test="${current.active == 'false'}">checked</c:if> />No
					</td> 
					
					<td>
						<input name="id" type="hidden" value=<c:out value="${current.id}" /> />
						<input name="email" type="hidden" value=<c:out value="${current.email}" /> />
						<input type="submit" value="Update Status" />
					</td>
					
				</form:form>
			</tr>
		</c:forEach>
		
	</table>
	</section>

	<modules:footer/>
</body>
</html>