<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="modules" tagdir="/WEB-INF/tags"%>
<html>
<head>
<link rel="stylesheet" href="<s:url value="/resources/css/style.css" />">
<title>All Profiles</title>
</head>
<body>

	<modules:header/>

	<section>
	<h2>StayConnected Profiles</h2>
 	<c:forEach items="${profiles}" var="current">
    <div>
    <table>
    	<tr>
    		<td>First Name:</td>
    		<td><c:out value = "${current.firstname}"/></td>
    	</tr>
       	<tr>
    		<td>Last Name:</td>
    		<td><c:out value = "${current.lastname}"/></td>
    	</tr>
    	<tr>
    		<td>Email:</td>
    		<td><c:out value = "${current.email}"/></td>
    	</tr>
    	<tr>
    		<td>Phone:</td>
    		<td><c:out value = "${current.phone}"/></td>
    	</tr>
    	<tr>
    		<td>Address:</td>
    		<td><c:out value = "${current.address}"/></td>
    	</tr>
    	<tr>
    		<td>City:</td>
    		<td><c:out value = "${current.city}"/></td>
    	</tr>
    	<tr>
    		<td>Country:</td>
    		<td><c:out value = "${current.country}"/></td>
    	</tr>
    	<tr>
    		<td>State:</td>
    		<td><c:out value = "${current.state}"/></td>
    	</tr>
    </table>
	<hr>
	</div>
	</c:forEach>
	</section>

	<modules:footer/>
</body>
</html>