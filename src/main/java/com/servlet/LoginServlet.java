package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBconnect;
import com.dao.Employee_DAO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String email=req.getParameter("e");
		String p=req.getParameter("p");
		Employee_DAO dao=new Employee_DAO(DBconnect.getConn());
		boolean f=dao.login(email, p);
		HttpSession session=req.getSession();
		if(f==true) {
			session.setAttribute("email",email);
			resp.sendRedirect("home.jsp");
		}else {
			resp.sendRedirect("index.jsp?Block=Error");
		}
		
	}
		
	
}
