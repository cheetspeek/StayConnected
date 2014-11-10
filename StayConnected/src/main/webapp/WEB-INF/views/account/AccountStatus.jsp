<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<style>
.error {
	color: #ff0000;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>
<title>Stay Connected: Account Status</title>
</head>
<body>
	<h2>Activate/Deactivate Accounts</h2>

	<table border='1'>
		<tr>
			<td>Email</td>
			<td>Active</td>
		</tr>
		<c:forEach items="${accounts}" var="current">
			<tr>
				<td><c:out value="${current.email}" /></td>
				<td><input type="radio" path="active" value="true" onclick=""
					<c:if test="${current.active == 'true'}">checked</c:if> />Yes 
					<input type="radio" path="active" value="false"
					<c:if test="${current.active == 'false'}">checked</c:if> />No
				</td>
			</tr>
		</c:forEach>
	</table>
	<tr>
		<input type="submit" />
	</tr>


	<p>
		<a href="http://localhost:8080/stayconnected/">Return Home</a>
	</p>
</body>
</html>