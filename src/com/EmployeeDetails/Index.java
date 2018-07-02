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
		HttpSession session=req.getSession();
		Object check =session.getAttribute("uname");
		System.out.println(check);
		if(check!=null) {
		res.sendRedirect("Index1.html");
		}
		else
		{
			res.sendRedirect("Index.html");
		}
	}
	public void destroy() {
		
	}

}
