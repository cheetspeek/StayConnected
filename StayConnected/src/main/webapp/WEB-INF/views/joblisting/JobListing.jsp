<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="modules" tagdir="/WEB-INF/tags"%>
<html>
<head>
<title>View Job Listings</title>
<link rel="stylesheet" href="<s:url value="/resources/css/style.css" />">
</head>
<body>
	
	<modules:header/>
	
	<section>
	<h2>StayConnected Job Listings</h2>
    <c:forEach items="${listing}" var="current">
    <div>
    <table>
    	<tr>
    		<td>Company Name:</td>
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
    	<security:authentication var="principal" property="principal" />
    	<c:if test="${principal.username == current.email}">
	    	<tr>	
	    		<td>
	    		<form:form method="POST" action="updatelisting" modelAttribute="jobListing">
						<input name="id" type="hidden" value=<c:out value="${current.id}" /> />
						<input type="image" src="<s:url value="/resources/images/nav/update_box.png" />" width="74" height="28" 
						value="Update" style="float: left"/>
				</form:form>
				</td>
				<td>
				<form:form method="POST" action="joblistingdeactconfirm" modelAttribute="jobListing">
					<input name="id" type="hidden" value=<c:out value="${current.id}" /> />
					<input type="image" src="<s:url value="/resources/images/nav/remove_box.png" />" width="74" height="28" 
					value="Remove" style="float: left"/>
				</form:form>
				</td>
    		</tr>
    	</c:if>
    </table>
	<hr>
	</div>
	</c:forEach>
	</section>
	
	<modules:footer/>
</body>
</html>