<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>StayConnected - View Listings</title>
	<style>
 * { font-family: Avenir }
  </style>
</head>
<body bgcolor=#D9C1F3>
	<img src="<s:url value="/resources/images/logo_condensed.png" />" width="220" height="75" style="float: right" />
	<h2>Job Listings</h2>
	<table border='1'>
 	<tr><td>Job ID</td><td>Job Name</td><td>Job Position</td><td>Contact Email</td><td>Job Description</td><td>Job Location</td><td>Action</td></tr>
 	<c:forEach items="${listing}" var="current">
 		<tr>
 		<form:form method="POST" action="updatelisting" modelAttribute="jobListing">
	     	<td><c:out value = "${current.id}"/></td>
	     	<td><c:out value = "${current.job_name}"/></td>
	     	<td><c:out value = "${current.position}"/></td>
	     	<td><c:out value = "${current.email}"/></td>
	    	<td><c:out value = "${current.job_description}"/></td>
	     	<td><c:out value = "${current.job_location}"/></td>
	     	<td>
				<input name="id" type="hidden" value=<c:out value="${current.id}" /> />
				<input type="submit" value="Update Status" />
			</td>
		</form:form>
     	</tr>
    </c:forEach>
</table>
<P><a href="${contextPath}/"> <img src="<s:url value="/resources/images/home_box.png" />" width="93" height="35" />
</a></P>
</body>
</html>