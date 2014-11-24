<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="modules" tagdir="/WEB-INF/tags"%>
<html>
<head>
<link rel="stylesheet" href="<s:url value="/resources/css/style.css" />">
<title>Stay Connected</title>
</head>
<body>

	<modules:header/>
	
	<section>
	<h2>Profile Updated!</h2>
	<P> Your profile has been successfully updated!. </P>
	<table>
		<tr>
    		<td>First Name:</td>
    		<td><c:out value = "${profile.firstname}"/></td>
    	</tr>
       	<tr>
    		<td>Last Name:</td>
    		<td><c:out value = "${profile.lastname}"/></td>
    	</tr>
    	<tr>
    		<td>Email:</td>
    		<td><c:out value = "${profile.email}"/></td>
    	</tr>
    	<tr>
    		<td>Phone:</td>
    		<td><c:out value = "${profile.phone}"/></td>
    	</tr>
    	<tr>
    		<td>Address:</td>
    		<td><c:out value = "${profile.address}"/></td>
    	</tr>
    	<tr>
    		<td>City:</td>
    		<td><c:out value = "${profile.city}"/></td>
    	</tr>
    	<tr>
    		<td>Country:</td>
    		<td><c:out value = "${profile.country}"/></td>
    	</tr>
    	<tr>
    		<td>State:</td>
    		<td><c:out value = "${profile.state}"/></td>
    	</tr>
	</table>
	</section>

	<modules:footer/>
</body>
</html>