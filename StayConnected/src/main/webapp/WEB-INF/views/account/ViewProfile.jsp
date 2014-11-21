<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>StayConnected - View Profiles</title>
	<style>
 * { font-family: Avenir }
  </style>
</head>
<body bgcolor=#D9C1F3>
	<img src="<s:url value="/resources/images/logo_condensed.png" />" width="220" height="75" style="float: right" />
	<h2>Profiles</h2>
	<table border='1'>
 	<tr><td>First Name</td><td>Last Name</td><td>Email</td></tr>
 	<c:forEach items="${profiles}" var="current">
     	<tr>
     	<td><c:out value = "${current.firstname}"/></td>
     	<td><c:out value = "${current.lastname}"/></td>
     	<td><c:out value = "${current.email}"/></td>
     	</tr>
    </c:forEach>
</table>
<P><a href="${contextPath}/"> <img src="<s:url value="/resources/images/home_box.png" />" width="93" height="35" />
</a></P>
</body>
</html>