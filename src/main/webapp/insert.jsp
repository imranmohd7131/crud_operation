<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert</title>
<%@include file="all_css.jsp" %>
</head>
<body>

<%@include file="navbar.jsp" %>
<div class="container p-4">
	<div class="row">
		<div class="col-md-6 offset-md-3">
			<div class="card">
				<div class="card-body">
				<p class="fs-3 text-center p-2">Add Employee</p>
				<c:if test="${not empty message }">
				<p class="text-center text-success">${message }</p>
				<c:remove var="message" /> 
				</c:if>
				<c:if test="${not empty errorMessage }">
				<p class="text-center text-success">${errorMessage }</p>
				<c:remove var="errorMessage"/>
				</c:if>
				<pre>
				<form action="register" method="post">
				 <div class="mb-3">
				 	<label class="form-label">employee id</label>
					<input type="number" name="n1" class="form-control"><br>
					<label class="form-label">employee name</label>
					<input type="text" name="t1" class="form-control"><br>  
					<label class="form-label">employee location</label>
					<input type="text" name="t2" class="form-control"><br>
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
				</form>
				</pre>
				</div>
		    </div>
		</div>
    </div>
    </div>
</body>
</html>