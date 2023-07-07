<%@page import="com.entity.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.Employee_DAO"%>
<%@page import="com.conn.DBconnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<%@include file="all_css.jsp" %>
</head>


<body>

<%@include file="navbar.jsp" %>
<div class="container p-5">
<p class="text-center fs-1">All Employees Details</p>
<p class="text-center">
				<% if(request.getAttribute("message")!=null) { %>
				<%=request.getAttribute("message") %>
				<% } %>
				<% if(request.getAttribute("errorMessage")!=null) { %>
				<%=request.getAttribute("errorMessage") %>
				<% } %>
</p>
	<table class="table">
  <thead>
    <tr>
      <th scope="col">Employee ID</th>
      <th scope="col">Employee Name</th>
      <th scope="col">Employee Location</th>
    </tr>
  </thead>
  <tbody>
  <% 
    Employee_DAO obj=new Employee_DAO(DBconnect.getConn());
	List<Employee> li=obj.read(); 
    for(Employee e:li){

    %>
    <tr>
      <th><%=e.getId()%></th>
      <td><%=e.getName() %></td>
      <td><%=e.getLoc() %></td>
      <td><a href="edit.jsp?emp.getId()=<%=e.getId() %>" class="btn btn-sm btn-primary">Edit</a>
       <a href="deletee?id=<%=e.getId() %>" class="btn btn-sm btn-danger ms-1">Delete</a>
      </td>    
       <% } %>
    </tr>
  </tbody>
</table>
</div>
</body>
</html>