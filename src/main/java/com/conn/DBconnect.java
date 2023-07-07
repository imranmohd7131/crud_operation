package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {
	private static Connection conn=null;
	public static Connection getConn() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");                               
			conn=DriverManager.getConnection("jdbc:mysql://5.189.146.57:3306/intern","root","genr@&y&123");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
}
