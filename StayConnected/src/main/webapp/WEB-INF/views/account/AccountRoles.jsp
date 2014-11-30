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
	<h2>Change Account Roles</h2>
	<table border='1'>
		<tr>
			<td>Email</td>
			<td>Role</td>
			<td>Action</td>
		</tr>
		<c:forEach items="${accounts}" var="current">
			<c:set var="roles" value="${current.role}"/>
			<tr>
				<form:form method="POST" action="accountroleconfirmation" modelAttribute="account">					
					<td>
						<c:out value="${current.email}" />
					</td>
					<td>
						<input type="checkbox" name="roleList" value="Admin" <c:if test="${roles.adminChecked == 'true'}">checked</c:if>/>Admin
						<input type="checkbox" name="roleList" value="Faculty" <c:if test="${roles.facultyChecked == 'true'}">checked</c:if>/>Faculty
						<input type="checkbox" name="roleList" value="Alumni" <c:if test="${roles.alumniChecked == 'true'}">checked</c:if>/>Alumni
						<input type="checkbox" name="roleList" value="Student" <c:if test="${roles.studentChecked == 'true'}">checked</c:if>/>Student
						<br>				
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