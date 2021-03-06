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

@WebServlet("/Updated")
public class Updated extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		ServletContext sc = getServletContext();

		PrintWriter out = res.getWriter();

		String firstName = req.getParameter("firstName");
		String designation = req.getParameter("designation");

		String currentAddress = req.getParameter("current");
		String permanentAddress = req.getParameter("permanent");
		String phn = req.getParameter("phn");
		String aphn = req.getParameter("aphn");
		String email = req.getParameter("email");
		Connection con = null;
		PreparedStatement ps = null;
		try {
			java.util.Date date = new SimpleDateFormat("yyyy-mm-dd").parse(req.getParameter("dob"));
			java.sql.Date mySqlDate = new java.sql.Date(date.getTime());
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "");
			ps = con.prepareStatement(
					"INSERT INTO data(firstName,designation,dob,current,parmanent,phn,aphn,email) VALUES (?,?,?,?,?,?,?,?)");
			ps.setString(1, firstName);
			ps.setString(2, designation);
			ps.setDate(3, mySqlDate);
			ps.setString(4, currentAddress);
			ps.setString(5, permanentAddress);
			ps.setString(6, phn);
			ps.setString(7, aphn);
			ps.setString(8, email);
			ps.executeUpdate();
			res.sendRedirect("updated.html");
			ps.close();
			con.close();

		} catch (Exception e) {
			res.sendRedirect("failed.html");
			System.out.println(e);
		}

		out.close();
	}

}
