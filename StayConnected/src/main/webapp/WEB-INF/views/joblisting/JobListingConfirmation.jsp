<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<html>
<body>
	<h2>Your listing has been posted.</h2>

	<table>
		<tr>
			<td>Name:</td>
			<td>${listing.name}</td>
		</tr>
	    <tr>
			<td>Date:</td>
			<td>${listing.date}</td>
		</tr>
		<tr>
			<td>Time:</td>
			<td>${listing.time}</td>
		</tr>
		<tr>
			<td>Location:</td>
			<td>${listing.location}</td>
		</tr>
		<tr>
			<td>Description:</td>
			<td>${listing.description}</td>
		</tr>
	</table>
</body>
</html>