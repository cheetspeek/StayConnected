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
<title>Stay Connected</title>
<link rel="stylesheet" href="<s:url value="/resources/css/style.css" />">
</head>
<body>

	<modules:header/>
	
	<section>
	<h2>Activation/Deactivation Confirmation!</h2>
 
	<table>
		<tr>
			<td>Account Name :</td>
			<td>${account.email}</td>
		</tr>
		<tr>
			<td>Status :</td>
			<td>${account.active}</td>
		</tr>
	</table>
	<p>
		<a href="${contextPath}/accountstatus">Return To Account Status</a>
	</P>
	</section>

	<modules:footer/>
</body>
</html>