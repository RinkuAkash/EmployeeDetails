package com.EmployeeDetails;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/logout")
public class logout extends HttpServlet {
	public void init() throws ServletException {
	// TODO Auto-generated method stub

}
public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
	HttpSession session =req.getSession(false);
	if(session!=null) {
		session.invalidate();
		session=null;
	}
	res.setContentType("text/html");
	ServletContext sc= getServletContext();
	res.sendRedirect("Index");
}
public void destroy() {
	
}

}
