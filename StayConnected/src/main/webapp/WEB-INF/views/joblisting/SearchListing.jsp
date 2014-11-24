<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="modules" tagdir="/WEB-INF/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
<link rel="stylesheet" href="<s:url value="/resources/css/style.css" />">
<title>Stay Connected</title>
</head>
<body>
	<modules:nav/>
	
	<modules:header/>
	
	<section>
	<h2>Search by location</h2>
	<form:form method="POST" action="searchLocationConfirmation" modelAttribute ="searchListing">
		<form:errors path="*" cssClass="errorblock" element="div" />
		<P>Here, you can search for job listings by location.</P>
		<table>
			<tr>
				<td>Location:</td>
				<td><form:input path="job_location" readonly="false" /></td>
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