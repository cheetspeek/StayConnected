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
		<a href="accountstatus"> <img src="<s:url value="/resources/images/status_box.png" />" width="183" height="55" /></a>
	</security:authorize></P>
	<P> <security:authorize access="hasAnyRole('Faculty', 'Alumni')"> 
		<a href="createlisting"> <img src="<s:url value="/resources/images/create_box.png" />" width="183" height="55" /></a>
	</security:authorize> </P>
	<P><security:authorize access="hasAnyRole('Faculty', 'Alumni')">
		<a href="updatelisting"> <img src="<s:url value="/resources/images/update_box.png" />" width="183" height="55" /></a>
	</security:authorize></P>
	<P> <a href="viewlisting"> <img src="<s:url value="/resources/images/view_box.png" />" width="183" height="55" /></a> </P>

	<P>
		<a href="j_spring_security_logout"> <img src="<s:url value="/resources/images/log_out_box.png" />" width="93" height="35" /></a>
	</P>
</body>
</html>

