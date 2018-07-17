package com.EmployeeDetails;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/New")
public class New extends HttpServlet {
	public void init() throws ServletException{
	}
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		res.setContentType("text/html");
		ServletContext sc= getServletContext();
		HttpSession session = req.getSession(false);
		if (session.getAttribute("login") != null) {
			res.sendRedirect("newEmployee.html");
		} else {
			res.sendRedirect("login");
		}
	}
		public void destroy(){
	}
}
