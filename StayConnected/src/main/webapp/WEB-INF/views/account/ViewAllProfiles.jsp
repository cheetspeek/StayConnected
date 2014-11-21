<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
<link href="<s:url value="/resources/css/visuals.css" />" rel="stylesheet">
<title>StayConnected - View All Profiles</title>
</head>
<body bgcolor=#D9C1F3>
	<img src="<s:url value="/resources/images/logo_condensed.png" />" width="220" height="75" style="float: right" />
	<h2>Profiles</h2>
	<table border='1'>
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
</table>
<P><a href="${contextPath}/"> <img src="<s:url value="/resources/images/home_box.png" />" width="93" height="35" />
</a></P>
</body>
</html>