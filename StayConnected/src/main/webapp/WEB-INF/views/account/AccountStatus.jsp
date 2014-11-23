<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>Stay Connected: Account Status</title>
<link rel="stylesheet" href="<s:url value="/resources/css/style.css" />">
</head>
<body>
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
	<h2>Activate/Deactivate Accounts</h2>
	<table border='1'>
		<tr>
			<td>Email</td>
			<td>Role</td>
			<td>Active</td>
			<td>Action</td>
		</tr>
		<c:forEach items="${accounts}" var="current">
			<tr>
				<form:form method="POST" action="accountstatusconfirmation" modelAttribute="account">					
					<td>
						<c:out value="${current.email}" />
					</td>
					<td>
						<c:forEach items="${current.roleList}" var="role">
							<c:out value="${role}" />
							<br>
						</c:forEach>
					</td>
					<td>
				 		<input type="radio" name="active" value="true" <c:if test="${current.active == 'true'}">checked</c:if> />Yes 
						<input type="radio" name="active" value="false" <c:if test="${current.active == 'false'}">checked</c:if> />No
					</td> 
					
					<td>
						<input name="email" type="hidden" value=<c:out value="${current.email}" /> />
						<input type="submit" value="Update Status" />
					</td>
					
				</form:form>
			</tr>
		</c:forEach>
	</table>
	</section>

	<footer>
		<p style="float:middle">
		Copyright © FasTrax, Inc.
		</p>
	</footer>
</body>
</html>