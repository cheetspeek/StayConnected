<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
<link href="<s:url value="/resources/css/style.css" />" rel="stylesheet">
<title>Registration Confirmation</title>
</head>
<body>
	<img src="<s:url value="/resources/images/logo_condensed.png" />" width="220" height="75" style="float: right" />
	<h2>Registration confirmed!</h2>
 	<P> Your account will be active within 48 hours, and you will be notified at the email address you just provided. </P>
	<table>
		<tr>
			<td>First name:</td>
			<td>${account.firstname}</td>
		</tr>
		<tr>
			<td>Last name:</td>
			<td>${account.lastname}</td>
		</tr>
		<tr>
			<td>Email address:</td>
			<td>${account.email}</td>
		</tr>
	</table>
	
 	<P><a href="${contextPath}/"> <img src="<s:url value="/resources/images/nav/home_box.png" />" width="93" height="35" />
	</a> </P>
</body>
</html>