<%@page import="com.conn.DBconnect"%>
<%@page import="com.dao.Employee_DAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>    
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@include file="all_css.jsp" %>

</head>
<body>


<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <marquee><a class="navbar-brand" href="#">Employee Management System</a></marquee>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
       </div>
  </div>
</nav>


<%String message = (String)request.getParameter("Block");
if(message == null){
	message="success";
}
if(message.equalsIgnoreCase("Error")){
	%>
	<script>
	swal("Invalid Credentials");
	</script>
	<% }
%>

<br><br><br><p class="text-center fs-3">Employee Login</p>				
<form action="login" method="post">
				 <center><div class="mb-3" style="width:300px" >
				 	<label class="form-label">enter your email address</label>
					<input type="email" name="e" class="form-control" required="required"><br>
					<label class="form-label">enter your password</label>
					<input type="password" name="p" class="form-control" required="required"><br>  
					<button type="submit" class="btn btn-primary">Login</button>
				</div>								
</form>
</body>
</html>