package com.EmployeeDetails;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Pay")
public class Pay extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		ServletContext sc = getServletContext();

		PrintWriter out = res.getWriter();
		int id= Integer.parseInt(req.getParameter("id"));
		System.out.println("==========="+id);
		String total=null;
		Connection con = null;
		PreparedStatement ps = null;
		PreparedStatement ps1=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "");
			ResultSet rs=null;
			ps= con.prepareStatement("select total from salary where id=?;");
			ps.setInt(1, id);
			rs=ps.executeQuery();
			if(rs.next()) {
				total=rs.getString("total");
				System.out.println(total);
			}
			else {
				throw new Exception();
			}
			long millis=System.currentTimeMillis();
			java.sql.Date mySqlDate = new java.sql.Date(millis);
			ps1 = con.prepareStatement(
					"insert into statement(id,date,total) values(?,?,?)");
			ps1.setInt(1, id);
			ps1.setDate(2, mySqlDate);
			ps1.setString(3, total);
			int count= ps1.executeUpdate();
			if(count>0) {
			res.sendRedirect("Search");
			}
			else {
				throw new Exception();
			}
			
			ps.close();
			con.close();
		}
		catch (Exception e) {
			res.sendRedirect("failed.html");
			System.out.println(e);
		}

		out.close();
	}

}
