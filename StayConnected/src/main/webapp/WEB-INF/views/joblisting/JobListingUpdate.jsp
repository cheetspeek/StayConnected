<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Stay Connected</title>
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
	<h2>Job Listing Updating</h2>
	<form:form method="POST" action="jobListingConfirmUpdate" modelAttribute ="jobListing">
		<form:errors path="*" cssClass="errorblock" element="div" />
		<P>Here, you can update	job listing for others to see. Please fill out the following form
		and submit it when you're done.</P>
		<table>
			<tr>
				<td><form:input path="id" type="hidden" value="${jobListing.id}" /></td>
			</tr>
			<tr>
				<td>Contact email address:</td>
				<td><form:input path="email" readonly="true" /></td>
			</tr>
			<tr>
				<td>Company name:</td>
				<td><form:input path="company_name" /></td>
				<td><form:errors path="company_name" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td>Job position:</td>
				<td><form:input path="position" /></td>
				<td><form:errors path="position" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td>Job description:</td>
				<td><form:input path="job_description" /></td>
				<td><form:errors path="job_description" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td>Job location:</td>
				<td><form:input path="job_location" /></td>
				<td><form:errors path="job_location" cssClass="error" />
				</td>
			</tr>
			<tr>
				<td><input type="image" src="<s:url value="/resources/images/nav/submit_box.png" />" width="93" height="35" /></td>
			</tr>
		</table>
	</form:form>
	</section>
	
	<footer>
		<p style="float:middle">
		Copyright © FasTrax, Inc.
		</p>
	</footer>
</body>
</html>