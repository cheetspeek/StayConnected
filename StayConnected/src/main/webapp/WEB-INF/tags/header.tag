<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="modules" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<header>
	
	<img class="alt-logo" src="<s:url value="/resources/images/alt_logo.png" />" width="285" height="60" 
		style="float:left"/>
	
	<div id="menu" style="float:right">
   		<ul>
      <li><a href="${contextPath}/">Home</a></li>
      <li><a href="#" title="Job Listings">Job Listings</a>
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
      <li><a href="#" title="Profiles">Profiles</a>
      	<ul>
      		<li><a href="viewallprofiles">View All Profiles</a></li>
      		<li><a href="editprofilepasswordcheck">Edit My Profile</a></li>
    	</ul>
      </li>
      <security:authorize access="hasRole('Admin')">
      	<li><a href="accountstatus">Accounts</a></li>
      </security:authorize>
      <li><a href="j_spring_security_logout" title="Log Out">Log Out</a></li>
  	   </ul>
	</div>

</header>