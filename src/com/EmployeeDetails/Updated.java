package com.EmployeeDetails;


	import java.io.IOException;
	import java.io.PrintWriter;
	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.PreparedStatement;
	import java.text.*;
import java.text.SimpleDateFormat;
import java.sql.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import java.time.LocalDate;
	import java.util.Date;


	@WebServlet("/Updated")
	public class Updated extends HttpServlet {

		public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			res.setContentType("text/html");
			ServletContext sc= getServletContext();
			
			PrintWriter out = res.getWriter();

			String firstName = req.getParameter("firstName");
			String lastName = req.getParameter("lastName");
			String designation = req.getParameter("designation");
			//String htmlDate= req.getParameter("dob");
			String currentAddress =req.getParameter("current");
			String permanentAddress= req.getParameter("paramanent");
			String phn =req.getParameter("phn");
			String aphn = req.getParameter("aphn");
			String email=req.getParameter("email");
			Connection con = null;
			PreparedStatement ps = null;
			try {
				java.util.Date date=new SimpleDateFormat("yyyy-MM-dd").parse(req.getParameter("dob"));
				java.sql.Date mydob=new java.sql.Date(date.getTime());
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "");
				ps = con.prepareStatement("");
				ps.setString(1, firstName);
				ps.setString(2, lastName);
				ps.setString(3, designation);
				ps.setDate(3, mydob);
				ps.setString(4, currentAddress);
				ps.setString(5, permanentAddress);
				ps.setString(6, phn);
				ps.setString(7, aphn);
				ps.setString(8, email);
				ResultSet rs = ps.executeQuery();
				sc.getRequestDispatcher("/header").forward(req, res);
				out.print("<p>Updated succesfully check the data</p>");
				rs.close();
				ps.close();
				con.close();

			} catch (Exception e) {
				sc.getRequestDispatcher("/header").forward(req, res);
				out.print("<p>Sorry, unalbe to update</p>");
				System.out.println(e);
			}

			out.close();
		}

	}

