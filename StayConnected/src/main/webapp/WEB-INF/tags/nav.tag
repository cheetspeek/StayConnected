<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="modules" tagdir="/WEB-INF/tags"%>
<nav>
	<security:authorize access="hasRole('Admin')">
		<a href="accountstatus"> <img
			src="<s:url value="/resources/images/acct/status_box.png" />"
			width="183" height="55" />
		</a>
	</security:authorize>
	<security:authorize access="hasAnyRole('Admin', 'Faculty', 'Alumni')">
		<a href="createlisting"> <img
			src="<s:url value="/resources/images/acct/create_box.png" />"
			width="183" height="55" />
		</a>
	</security:authorize>
	<security:authorize access="hasAnyRole('Admin', 'Faculty', 'Alumni')">
		<a href="viewlistingbyacct"> <img
			src="<s:url value="/resources/images/acct/mylistings_box.png" />"
			width="183" height="55" />
		</a>
	</security:authorize>
	<a href="viewlisting"> <img
		src="<s:url value="/resources/images/acct/view_box.png" />"
		width="183" height="55" />
	</a> <a href="searchlisting"> <img
		src="<s:url value="/resources/images/acct/search_box.png" />"
		width="183" height="55" />
	</a> <a href="viewallprofiles"> <img
		src="<s:url value="/resources/images/acct/view_prof_box.png" />"
		width="183" height="55" />
	</a> <a href="editprofilepasswordcheck"> <img
		src="<s:url value="/resources/images/acct/edit_prof.png" />"
		width="183" height="55" />
	</a>
</nav>