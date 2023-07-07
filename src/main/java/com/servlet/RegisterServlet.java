package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBconnect;
import com.dao.Employee_DAO;
import com.entity.Employee;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("n1"));
		String name=req.getParameter("t1");
		String loc=req.getParameter("t2");
		
		Employee emp=new Employee(id,name,loc);
//		System.out.println(emp);
		
		Employee_DAO dao=new Employee_DAO(DBconnect.getConn());				
		boolean f=dao.insert(emp);
		if(f) {
			req.setAttribute("message", "Data insert successfully....(:");
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("home.jsp");
			requestDispatcher.forward(req, resp);
//			System.out.println("Data insert successfully....(:");
		}else {
			req.setAttribute("errorMessage", "something wrong on server");
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("home.jsp");
			requestDispatcher.forward(req, resp);
//			System.out.println("something wrong on server");
		}
	}
		
	
}
