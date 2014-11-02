<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<P>
		Username:
		<security:authentication property="principal.username" />
	</P>

	<security:authorize access="hasRole('ROLE_DBA')">
		<a href="<c:url value="/dbaonly" />"> DBA ONLY LINK</a>
	</security:authorize>

	<security:authorize access="hasRole('ROLE_ADMIN')">
		<a href="<c:url value="/adminonly" />"> ADMIN ONLY LINK</a>
	</security:authorize>
	
	<P>
			<a href="<c:url value="j_spring_security_logout" />"> Logout</a>
	</P>
</body>
</html>

