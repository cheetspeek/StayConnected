<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<link href="<s:url value="/resources/css/visuals.css" />" rel="stylesheet">
<title>Account Home</title>
</head>
<body>
<div style="text-align: center;">
	<div id="floater" style="text-align: center;">
		<security:authorize access="hasRole('Admin')">
		<a href="accountstatus"> <img src="<s:url value="/resources/images/acct/status_box.png" />" width="183" height="55" /></a>
		</security:authorize>
	</div>
	<h2>Account Home Page</h2>
	<P>
		Your email address is: <security:authentication property="principal.username" />
	</P>
	<security:authorize access="hasRole('Admin')">
		<a href="accountstatus"> <img src="<s:url value="/resources/images/acct/status_box.png" />" width="183" height="55" /></a>
	</security:authorize>
	<security:authorize access="hasAnyRole('Admin', 'Faculty', 'Alumni')"> 
		<a href="createlisting"> <img src="<s:url value="/resources/images/acct/create_box.png" />" width="183" height="55" /></a>
	</security:authorize>
	<security:authorize access="hasAnyRole('Admin', 'Faculty', 'Alumni')"> 
		<a href="viewlistingbyacct"> <img src="<s:url value="/resources/images/acct/mylistings_box.png" />" width="183" height="55" /></a>
	</security:authorize>
	<a href="viewlisting"> <img src="<s:url value="/resources/images/acct/view_box.png" />" width="183" height="55" /></a>
	<a href="searchlisting">Search Job Listing</a>
	<a href="viewallprofiles">View All Profiles</a>
	<a href="editmyprofile">Edit My Profile</a>
<hr>
</div>
	<img src="<s:url value="/resources/images/alt_logo.png" />" width="237" height="50" style="float: right"/>
		<a href="j_spring_security_logout"> <img src="<s:url value="/resources/images/nav/log_out_box.png" />" width="93" height="35" /></a>
</body>
</html>

