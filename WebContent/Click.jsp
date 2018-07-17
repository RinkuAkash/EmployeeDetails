<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%
String idn= request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "db";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
ResultSet rs= null;
ResultSet rs1= null;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Details</title>
<link rel="stylesheet" href="style.css">
</head>
<hr>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
String query ="select id, firstName, designation from data where id=?";
PreparedStatement stmt=null;
PreparedStatement stmt1=null;
PreparedStatement stmt2=null;
stmt=connection.prepareStatement(query);
stmt.setString(1, idn);
resultSet = stmt.executeQuery();
if(resultSet.next()){
%>
<pre>
<label><b>Employee Id  :</b>&nbsp<%=resultSet.getString("id")%></label><br>
<label><b>Employee Name:</b>&nbsp<%=resultSet.getString("firstName")%></label><br>
<label><b>Designation  :</b>&nbsp<%=resultSet.getString("designation") %></label><br>
</pre>
<% String Squery ="select * from salary where id=?";
stmt1=connection.prepareStatement(Squery);
int id= resultSet.getInt("id");
stmt1.setInt(1,id);
rs= stmt1.executeQuery();
while(rs.next()){
%>
<pre>
<label><b>Basic   :</b>&nbsp<%=rs.getString("basic")%></label>&nbsp
<label><b>Support :</b>&nbsp<%=rs.getString("support") %></label>&nbsp
<label><b>Training:</b>&nbsp<%=rs.getString("training") %></label>&nbsp
<label><b>Total   :</b>&nbsp<%=rs.getString("total") %></label>
</pre>
<%
}
%>
<div>
<table border=1>
<thead>
<tr>
<th>Date</th>
<th>Paid Salary</th>
</tr>
</thead>
<tr>
<%
String Mquery ="select * from statement where id=? order by date";
stmt2 = connection.prepareStatement(Mquery);
stmt2.setInt(1,id);
rs1= stmt2.executeQuery();
if(rs1.next()){
%>
<td><%=rs1.getString("date") %></td>
<td><%=rs1.getString("total") %>
<%
}
else{
throw new Exception();
}%>

</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</div>
</body>
</html>