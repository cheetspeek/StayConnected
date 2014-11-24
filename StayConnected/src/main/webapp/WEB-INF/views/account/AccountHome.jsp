<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="modules" tagdir="/WEB-INF/tags" %>
<html>
<head>
<link rel="stylesheet" href="<s:url value="/resources/css/style.css" />">
<title>Account Home</title>
</head>
<body>

	<modules:header/>
	
	<section>
		<h2>Account Home Page</h2>
		<p>Your email address is: <security:authentication property="principal.username" /></p>
	</section>
	
	<modules:footer/>
</body>
</html>

