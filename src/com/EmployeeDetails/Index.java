package com.EmployeeDetails;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

//@WebServlet("/Index")
public class Index extends HttpServlet {

	public void init() throws ServletException {
		// TODO Auto-generated method stub

	}
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		res.setContentType("text/html");
		ServletContext sc= getServletContext();
			res.sendRedirect("index.jsp");	
	}
	public void destroy() {
		
	}

}
