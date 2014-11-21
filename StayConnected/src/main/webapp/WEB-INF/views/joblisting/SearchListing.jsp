<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>Stay Connected</title>
	<style>
	<link href="<s:url value="/resources/css/visuals.css" />" rel="stylesheet">
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
				<td><input type="image" src="<s:url value="/resources/images/submit_box.png" />" width="93" height="35" /></td>
			</tr>
		</table>
	</form:form>
	<a href="${contextPath}/"> <img src="<s:url value="/resources/images/home_box.png" />" width="93" height="35" />
	</a>
</body>
</html>