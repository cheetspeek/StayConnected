<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="modules" tagdir="/WEB-INF/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<header>
	<img class="alt-logo"
		src="<s:url value="/resources/images/alt_logo.png" />" width="237"
		height="50" /> <a href="j_spring_security_logout"> <img
		class="log_out_box"
		src="<s:url value="/resources/images/nav/log_out_box.png" />"
		width="93" height="35" />
	</a> <a href="${contextPath}/"> <img class="home_box"
		src="<s:url value="/resources/images/nav/home_box.png" />" width="93"
		height="35" />
	</a>
</header>