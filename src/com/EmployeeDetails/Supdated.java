package com.EmployeeDetails;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.time.format.DateTimeFormatter;
import java.time.LocalDate;
import java.time.LocalDateTime;


import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Supdated")
public class Supdated extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		ServletContext sc = getServletContext();

		PrintWriter out = res.getWriter();
		String id= req.getParameter("id");
		String basic = req.getParameter("basic");
		String support = req.getParameter("support");
		String training = req.getParameter("training");
		String total= req.getParameter("total");
		Connection con = null;
		PreparedStatement ps = null;
		try {
			long millis=System.currentTimeMillis();
			java.sql.Date mySqlDate = new java.sql.Date(millis);
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "");
			ps = con.prepareStatement(
					"UPDATE salary SET date=?,basic=?,support=?,training=?,total=? WHERE id=?");
			ps.setDate(1, mySqlDate);
			ps.setString(2, basic);
			ps.setString(3, support);
			ps.setString(4, training);
			ps.setString(5, total);
			ps.setString(6, id);
			int count= ps.executeUpdate();
			if(count>0) {
			sc.getRequestDispatcher("/updated.html").include(req, res);
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
