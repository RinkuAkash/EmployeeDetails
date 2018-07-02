package com.EmployeeDetails;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//import com.mysql.jdbc.Statement;

public class ConnTest {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "");
		System.out.println(con);
		Statement stmt=con.createStatement();  
		ResultSet rs=stmt.executeQuery("select * from admin");  
		while(rs.next())  
		System.out.println(rs.getString(1)+"  "+rs.getString(2));  
		con.close();
	}

}
