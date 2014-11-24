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
	<modules:nav/>
	
	<modules:header/>
	
	<section>
	<h2>Role Update Confirmation!</h2>
 
	<table>
		<tr>
			<td>Account Name :</td>
			<td>${account.email}</td>
		</tr>
		<tr>
			<td>Account Roles :</td>
			<td>
				<c:forEach items="${roleList}" var="role">
					<c:out value="${role}"/>
				</c:forEach>
			</td>
		</tr>
	</table>
	<p>
		<a href="${contextPath}/accountroles">Return To Update Account Roles</a>
	</P>
	</section>

	<modules:footer/>
</body>
</html>