<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<html>
<head>
<title>Account Home</title>
  <style>
 * { font-family: Avenir }
  </style>
</head>
<body bgcolor=#D9C1F3 >
	<img src="<s:url value="/resources/images/logo_condensed.png" />" width="220" height="75" style="float: right" />
	<h2>Account Home Page</h2>
	<P>
		Your email address is: <security:authentication property="principal.username" />
	</P>
	<P><security:authorize access="hasRole('Faculty')">
		<a href="<c:url value="/accountstatus" />">Update Account Statuses</a>
	</security:authorize></P>
	<P> <security:authorize access="hasAnyRole('Faculty', 'Alumni')"> 
		<a href="<c:url value="/createlisting" />">Create Job Listing</a>
	</security:authorize> </P>
	<P><security:authorize access="hasAnyRole('Faculty', 'Alumni')">
		<a href="<c:url value="/updatelisting" />">Update Job Listing</a>
	</security:authorize></P>
	<P> <a href="<c:url value="/viewlisting" />">View Job Listing</a> </P>

	<P>
		<a href="<c:url value="j_spring_security_logout" />"> Logout</a>
	</P>
</body>
</html>

