package com.EmployeeDetails;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Details")
public class Details extends HttpServlet {
	public void init() throws ServletException{
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		res.setContentType("text/html");
		ServletContext sc= getServletContext();
			req.getRequestDispatcher("Details.jsp").include(req, res);;
	}
	public void destroy(){
	}
}
