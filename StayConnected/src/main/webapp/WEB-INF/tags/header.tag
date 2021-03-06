<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="modules" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<header>
	
	<a href="${contextPath}/"> <img class="alt-logo" src="<s:url value="/resources/images/alt_logo.png" />" width="285" height="60" 
		style="float:left"/></a>
		
	<div id="menu" style="float:right">
   		<ul>
      <li><a href="${contextPath}/">Home</a></li>
      <security:authorize access="hasAnyRole('Admin', 'Faculty', 'Alumni', 'Student')">
      <li><a href="#" title="Job Listings">Job Listings <img src="<s:url value="/resources/images/drop_down_arrow.png" />" width="12" height="12" /> </a>
      	<ul>
      		<security:authorize access="hasAnyRole('Admin', 'Faculty', 'Alumni')">
      			<li><a href="createlisting">Create New Listing</a></li>
      		</security:authorize>
      		<security:authorize access="hasAnyRole('Admin', 'Faculty', 'Alumni')">
      			<li><a href="viewlistingbyacct">View My Listings</a></li>
      		</security:authorize>
      		<li><a href="viewlisting">View All Listings</a></li>
      		<li><a href="searchlisting">Search Listings</a></li>
    	</ul>
      </li>
      </security:authorize>
      <security:authorize access="hasAnyRole('Admin', 'Faculty', 'Alumni', 'Student')">
      <li><a href="#" title="Profiles">Profiles <img src="<s:url value="/resources/images/drop_down_arrow.png" />" width="12" height="12" /></a>
      	<ul>
      		<li><a href="viewallprofiles">View All Profiles</a></li>
      		<li><a href="editprofilepasswordcheck">Edit My Profile</a></li>
    	</ul>
      </li>
      </security:authorize>
      <security:authorize access="hasRole('Admin')">
      	<li><a href="#">Admin <img src="<s:url value="/resources/images/drop_down_arrow.png" />" width="12" height="12" /></a>
      		<ul>
      			<li><a href="accountstatus">Account Status</a></li>
      			<li><a href="accountroles">Account Roles</a></li>
      			<li><a href="joblistingstatus">Job Listing Status</a></li>
      		</ul>
      	</li>
      </security:authorize>
      <security:authorize access="hasAnyRole('Admin', 'Faculty', 'Alumni', 'Student')">
      <li><a href="j_spring_security_logout" title="Log Out">Log Out</a></li>
      </security:authorize>
  	   </ul>
	</div>
	
	<security:authorize access="hasAnyRole('Admin', 'Faculty', 'Alumni', 'Student')">
		<div id="search" style="float:right">	
			<form:form method="POST" action="globalSearch" modelAttribute="searchTerm">
			<input id="searchTerm" type='text' name='searchTerm'>
			<input type="image" src="<s:url value="/resources/images/mag_glass.png" />" width="16" height="16" />
			</form:form>
		</div>
	</security:authorize>
	

</header>