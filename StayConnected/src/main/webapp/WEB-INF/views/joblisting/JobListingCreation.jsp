<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Stay Connected</title>
</head>
<body>
	<h2>Job Listing Creation/Update</h2>
	<form:form method="POST" action="listing" modelAttribute ="listing">
		<form:errors path="*" cssClass="errorblock" element="div" />
		<table>
			<tr>
				<td>Listing name:</td>
				<td><form:input path="name" />
				</td>
				<td><form:errors path="name" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td>Date:</td>
				<td><form:input path="date" />
				</td>
				<td><form:errors path="date" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td>Time:</td>
				<td><form:input path="time" />
				</td>
				<td><form:errors path="time" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td>Location:</td>
				<td><form:input path="location" />
				</td>
				<td><form:errors path="location" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td>Description:</td>
				<td><form:input path="description" />
				</td>
				<td><form:errors path="description" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" /></td>
			</tr>
		</table>
	</form:form>
</body>
</html>