package com.EmployeeDetails;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

//@WebServlet("/header")
public class header extends HttpServlet {
	public void init() throws ServletException{
	}
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		res.setContentType("text/html");
		ServletContext sc= getServletContext();
		sc.getRequestDispatcher("/header.html").include(req, res);
	}
	public void destroy(){
	}
}
