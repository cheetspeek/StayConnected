<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="modules" tagdir="/WEB-INF/tags" %>
<html>
<head>
<title>Stay Connected: Account Roles</title>
<link rel="stylesheet" href="<s:url value="/resources/css/style.css" />">
</head>
<body>
	<modules:nav/>
	
	<modules:header/>

	<section>
	<h2>Change Account Roles</h2>
	<table border='1'>
		<tr>
			<td>Email</td>
			<td>Role</td>
			<td>Action</td>
		</tr>
		<c:forEach items="${accounts}" var="current">
			<tr>
				<form:form method="POST" action="accountroleconfirmation" modelAttribute="account">					
					<td>
						<c:out value="${current.email}" />
					</td>
					<td>							
						<c:forEach items="${current.roleList}" var="role">	
							<input type="checkbox" name="roleList" value=<c:out value="${role}"/> checked/><c:out value="${role}"/>
							<br>			
						</c:forEach>
							
					</td>					
					<td>
						<input name="email" type="hidden" value=<c:out value="${current.email}" /> />
						<input type="submit" value="Update Role" />
					</td>					
				</form:form>
			</tr>
		</c:forEach>
	</table>
	</section>

	<modules:footer/>
</body>
</html>