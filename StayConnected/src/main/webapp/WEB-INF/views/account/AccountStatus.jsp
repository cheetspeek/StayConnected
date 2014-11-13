<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<style>
</style>
<title>Stay Connected: Account Status</title>
</head>
<body>
	<h2>Activate/Deactivate Accounts</h2>

	<table border='1'>
		<tr>
			<td>Email</td>
			<td>Active</td>
			<td>Action</td>
		</tr>
		<c:forEach items="${accounts}" var="current">
			<tr>
				<form:form method="POST" action="accountstatusconfirmation" modelAttribute="account">					
					<td>
						<c:out value="${current.email}" />
					</td>
					<td>
				 		<input type="radio" name="active" value="true" <c:if test="${current.active == 'true'}">checked</c:if> />Yes 
						<input type="radio" name="active" value="false" <c:if test="${current.active == 'false'}">checked</c:if> />No
					</td> 
					
					<td>
						<input name="email" type="hidden" value=<c:out value="${current.email}" /> />
						<input type="submit" value="Update Status" />
					</td>
					
				</form:form>
			</tr>
		</c:forEach>
	</table>
	<p>
		<a href="http://localhost:8080/stayconnected/">Return Home</a>
	</P>
</body>
</html>