<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
<link href="<s:url value="/resources/visuals.css" />" rel="stylesheet">
<title>StayConnected - View Listings</title>
</head>
<body>
	<div id="floater" style="text-align: center;">
		<security:authorize access="hasRole('Faculty')">
		<a href="accountstatus"> <img src="<s:url value="/resources/images/acct/status_box.png" />" width="183" height="55" /></a>
		</security:authorize>
	</div>
	<img src="<s:url value="/resources/images/logo_condensed.png" />" width="220" height="75" style="float: right" />
	<h2>Job Listings</h2>
    <c:forEach items="${listing}" var="current">
    <div>
    <table>
    	<tr>
    		<td>Job Name:</td>
    		<td><c:out value = "${current.job_name}"/></td>
    	</tr>
       	<tr>
    		<td>Job Position:</td>
    		<td><c:out value = "${current.position}"/></td>
    	</tr>
    	<tr>
    		<td>Job Description:</td>
    		<td><c:out value = "${current.job_description}"/></td>
    	</tr>
    	<tr>
    		<td>Location:</td>
    		<td><c:out value = "${current.job_location}"/></td>
    	</tr>
    	<tr>
    		<td>Contact Email:</td>
    		<td><c:out value = "${current.email}"/></td>
    	</tr>
    </table>
	<hr>
	</div>
	</c:forEach>

<P><a href="${contextPath}/"> <img src="<s:url value="/resources/images/home_box.png" />" width="93" height="35" />
</a></P>
</body>
</html>