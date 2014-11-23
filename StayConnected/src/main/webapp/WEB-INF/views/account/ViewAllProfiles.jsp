<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
<!-- 
<link href="<s:url value="/resources/css/visuals.css" />" rel="stylesheet">
-->
<link rel="stylesheet" href="<s:url value="/resources/css/style.css" />">
<title>StayConnected - View All Profiles</title>
</head>
<body>
	<!--  
	<img src="<s:url value="/resources/images/logo_condensed.png" />" width="220" height="75" style="float: right" />
	-->
	
	<header>
		<img class="alt-logo" src="<s:url value="/resources/images/alt_logo.png" />" width="237" height="50" />
	</header>
	
	<nav>
		<a href="${contextPath}/"> 
			<img src="<s:url value="/resources/images/nav/home_box.png" />" 
			width="93" height="35" style="float:left"/>
		</a>
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
		<a href="searchlisting">Search Job Listing</a><br>
		<a href="viewallprofiles">View All Profiles</a><br>
		<a href="editmyprofile">Edit My Profile</a><br>
		<a href="j_spring_security_logout"> 
			<img src="<s:url value="/resources/images/nav/log_out_box.png" />" 
			width="93" height="35" />
		</a>
	</nav>

	<section>
	<h2>Profiles</h2>
 	<c:forEach items="${profiles}" var="current">
    <div>
    <table>
    	<tr>
    		<td>First Name:</td>
    		<td><c:out value = "${current.firstname}"/></td>
    	</tr>
       	<tr>
    		<td>Last Name:</td>
    		<td><c:out value = "${current.lastname}"/></td>
    	</tr>
    	<tr>
    		<td>Email:</td>
    		<td><c:out value = "${current.email}"/></td>
    	</tr>
    	<tr>
    		<td>Phone:</td>
    		<td><c:out value = "${current.phone}"/></td>
    	</tr>
    	<tr>
    		<td>Address:</td>
    		<td><c:out value = "${current.address}"/></td>
    	</tr>
    	<tr>
    		<td>City:</td>
    		<td><c:out value = "${current.city}"/></td>
    	</tr>
    	<tr>
    		<td>Country:</td>
    		<td><c:out value = "${current.country}"/></td>
    	</tr>
    	<tr>
    		<td>State:</td>
    		<td><c:out value = "${current.state}"/></td>
    	</tr>
    </table>
	<hr>
	</div>
	</c:forEach>
	</section>

	<footer>
		<p style="float:middle">
		Copyright � FasTrax, Inc.
		</p>
	</footer>
</body>
</html>