package com.EmployeeDetails;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Search")
public class Search extends HttpServlet {
	public void init() throws ServletException{
	}
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		res.setContentType("text/html");
		ServletContext sc= getServletContext();
		HttpSession session = req.getSession(false);
		if (session != null) {
			sc.getRequestDispatcher("/search1.html").include(req, res);
		} else {
			sc.getRequestDispatcher("/search.html").include(req, res);
		}
	}
	public void destroy(){
	}
}
