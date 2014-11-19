<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>StayConnected - View Your Listings</title>
	<style>
 * { font-family: Avenir }
  </style>
</head>
<body bgcolor=#D9C1F3>
	<img src="<s:url value="/resources/images/logo_condensed.png" />" width="220" height="75" style="float: right" />
	<h2>Your Job Listings</h2>
    <c:forEach items="${listing}" var="current">
    <div>
    <table>
    	<form:form method="POST" action="updatelisting" modelAttribute="jobListing">
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
    	<tr>
    		<td>
				<input name="id" type="hidden" value=<c:out value="${current.id}" /> />
				<input type="submit" value="Update" />
			</td>
		</tr>
		</form:form>
    </table>
	<hr>
	</div>
	</c:forEach>

<P><a href="${contextPath}/"> <img src="<s:url value="/resources/images/home_box.png" />" width="93" height="35" />
</a></P>
</body>
</html>