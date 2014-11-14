<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>Stay Connected</title>
</head>
<body>
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
 	<p> <a href="${contextPath}/" >Return Home</a> </p>
</body>
</html>