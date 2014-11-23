<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="modules" tagdir="/WEB-INF/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
<link rel="stylesheet" href="<s:url value="/resources/css/style.css" />">
<title>Account Home</title>
</head>
<body>
	
	<nav>
		<security:authorize access="hasRole('Admin')">
			<a href="accountstatus"> 
				<img src="<s:url value="/resources/images/acct/status_box.png" />" 
				width="183" height="55" />
			</a>
		</security:authorize>
		<security:authorize access="hasAnyRole('Admin', 'Faculty', 'Alumni')"> 
			<a href="createlisting"> 
				<img src="<s:url value="/resources/images/acct/create_box.png" />" 
				width="183" height="55" />
			</a>
		</security:authorize>
		<security:authorize access="hasAnyRole('Admin', 'Faculty', 'Alumni')"> 
			<a href="viewlistingbyacct"> 
				<img src="<s:url value="/resources/images/acct/mylistings_box.png" />" 
				width="183" height="55" />
			</a>
		</security:authorize>
		<a href="viewlisting"> 
			<img src="<s:url value="/resources/images/acct/view_box.png" />" 
			width="183" height="55" />
		</a>
		<a href="searchlisting"> 
			<img src="<s:url value="/resources/images/acct/search_box.png" />" 
			width="183" height="55" />
		</a>
		<a href="viewallprofiles"> 
			<img src="<s:url value="/resources/images/acct/view_prof_box.png" />" 
			width="183" height="55" />
		</a>
		<a href="editmyprofile"> 
			<img src="<s:url value="/resources/images/acct/edit_prof.png" />" 
			width="183" height="55" />
		</a>
	</nav>
	
	<modules:header/>
	
	<section>
		<h2>Account Home Page</h2>
		<p>Your email address is: <security:authentication property="principal.username" /></p>
	</section>
	
	<footer>
		<p style="float:middle">
		Copyright � FasTrax, Inc.
		</p>
	</footer>
</body>
</html>

