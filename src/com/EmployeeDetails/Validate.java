package com.EmployeeDetails;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Validate")
public class Validate extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();

		String un = req.getParameter("uname");
		String pass = req.getParameter("password");
		Connection con = null;
		PreparedStatement ps = null;
		ServletContext sc= getServletContext();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "");
			ps = con.prepareStatement("SELECT uname,password FROM admin WHERE uname=? AND password=?");
			ps.setString(1, un);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
			req.getSession().setAttribute("login", "true");
			req.getSession().setAttribute("uname", un);
			res.sendRedirect("index.jsp");
			}
			else
			{
				throw new Exception();
			}

		} catch (Exception e) {
			res.sendRedirect("login.html");
			out.print("<p>Sorry, username or password error</p>");
			System.out.println(e);
		}

		out.close();
	}

}
