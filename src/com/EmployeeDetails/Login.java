package com.EmployeeDetails;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/login")
public class Login extends HttpServlet {
	public void init() throws ServletException{
	}
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		res.setContentType("text/html");
		ServletContext sc= getServletContext();
		sc.getRequestDispatcher("/login.html").include(req, res);
	}
	public void destroy(){
	}
}
