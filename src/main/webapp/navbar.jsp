<%@page import="com.dao.Employee_DAO"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Employee Management System</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="insert.jsp">Add employee</a>
        </li>
        </ul>
      <form action="logout" class="d-flex">
      <%
String email=(String)session.getAttribute("email");
System.out.println("email is "+email);
if(email==null)
{
	response.sendRedirect("index.jsp");
} %>
		<button type="submit" class="btn btn-sm btn-danger ms-1">
			Logout
		</button>
      </form>
    </div>
  </div>
</nav>