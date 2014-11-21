<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>Stay Connected</title>
	<style>
	 * { font-family: Avenir }
	.error {
		color: #ff0000;
	}
	.errorblock {
		color: #000;
		background-color: #ffEEEE;
		border: 1px solid #ff0000;
		padding: 4px;
		margin: 8px;
	}
	</style>
</head>
<body bgcolor=#D9C1F3>
	<img src="<s:url value="/resources/images/logo_condensed.png" />" width="220" height="75" style="float: right" />
	<h2>Profile Updatedg</h2>
	<P> Your profile has been successfully updated!. </P>
	<table>
		<tr>
			<td>First name:</td>
			<td>${profile.firstname}</td>
		</tr>
		<tr>
			<td>Last name:</td>
			<td>${profile.lastname}</td>
		</tr>
		<tr>
			<td>Email address:</td>
			<td>${profile.email}</td>
		</tr>
	</table>
	
 	<P><a href="${contextPath}/"> <img src="<s:url value="/resources/images/home_box.png" />" width="93" height="35" />
	</a> </P>
</body>
</html>