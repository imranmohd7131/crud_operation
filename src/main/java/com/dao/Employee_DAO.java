package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;

import com.entity.Employee;
import com.mysql.cj.protocol.Resultset;

public class Employee_DAO {
	
	private Connection conn;

	public Employee_DAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean insert(Employee emp) {
		boolean f=false;
		try {
			String sql="insert into employee values(?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, emp.getId());
			ps.setString(2,emp.getName());
			ps.setString(3, emp.getLoc());
			int r=ps.executeUpdate();
			if(r==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Employee> read() {
		List<Employee> list=new ArrayList<Employee>();
		Employee emp=null;
		try {
			String sql="select * from employee";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				emp=new Employee();
				emp.setId(rs.getInt(1));
				emp.setName(rs.getString(2));
				emp.setLoc(rs.getString(3));
				list.add(emp);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Employee getEmployeeById(int id) {
		Employee e=null;
		String sql="select * from employee where emp_id=?";
		try {
			PreparedStatement  ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				e=new Employee();
				e.setId(rs.getInt(1));
				e.setName(rs.getString(2));
				e.setLoc(rs.getString(3));
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return e;
	}
	public boolean update(Employee emp) {
		boolean f=false;
		try {
			String sql="update employee set emp_name=?,emp_loc=? where emp_id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1,emp.getName());
			ps.setString(2, emp.getLoc());
			ps.setInt(3, emp.getId());
			int r=ps.executeUpdate();
			if(r==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean delete(int id) {
		System.out.println(id);
		boolean f=false;
		try {
			String sql="delete from employee where emp_id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1,id);
			int r=ps.executeUpdate();
			if(r==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean login(String e,String p) {
		boolean f=false;
		try {
			String sql="select email_id from login where email_id=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, e);
			ps.setString(2, p);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return f;
	}
}
