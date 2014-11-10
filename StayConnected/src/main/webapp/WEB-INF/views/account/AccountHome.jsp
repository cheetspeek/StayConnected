<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<html>
<head>
<title>Account Home</title>
</head>
<body>
	<P>
		Email: <security:authentication property="principal.username" />
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

