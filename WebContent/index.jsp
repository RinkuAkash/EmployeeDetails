<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%
String designation= request.getParameter("designation");
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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Details</title>
<link rel="stylesheet" href="style.css">
</head>
<script src="script.js"></script>
<style>
td {
    text-align: left;
    padding:10px;
}
td, th{
 border-left:solid black 2px;
    border-top:solid black 1px;
}
td:first-child, th:first-child {
     border-left: none;
}
th{
	text-align: center;
	
	padding: 10px;
	font-size: 120%;
	background-color: rgb(0,140,200);
	color:white;
}

tr:nth-child(even){background-color: #f2f2f2}
input[type=text]{
width:100%;
height:30px;
}

</style>
<body>
	<div class="clearfix">
		<div class="header">
			<img src="UskCorp.png">
			<h1>Employee Details</h1>
		</div>
	</div>
	<ul>
		<li><a href="Index">Home</a></li>
		<li><a href="New">New</a></li>
		<li><a href="Update">Update</a></li>
		<li><a href="Search">Search</a></li>
		<% Object check= session.getAttribute("login");%>
		<%if(check!=null){ %>
		<li class="float"><a href="logout">Logout</a></li>
		<%} else{ %>
		<li class="float"><a href="login">Login</a></li>
		<%} %>
	</ul>
	<div>
	
<table class="table" id="myTable2">
	<tr>
<td><input type="text" id="myInput" onkeyup="myFunction()"  onkeypress="return isNumber(event)" placeholder="id"></td>
<td><input type="text" id="myInput1" onkeyup="myFunction1()" onkeypress="return isAlpha(event)" placeholder="Name"></td>
<td><input type="text" id="myInput2" onkeyup="myFunction2()" onkeypress="return isAlpha(event)" placeholder="Designation"></td>
<td><input type="text" id="myInput3" onkeyup="myFunction3()" onkeypress="return isNumber(event)" placeholder="Salary"></td>
</tr>
<tr>
<th onClick="sortTable(0)">ID</th>
<th onClick="sortTable(1)">Name</th>
<th onClick="sortTable(2)">Designation</th>
<th onClick="sortTable(3)">Salary</th>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
String query ="select id, firstName,designation from data";
PreparedStatement stmt=null;
PreparedStatement stmt1=null;
stmt=connection.prepareStatement(query);
resultSet = stmt.executeQuery();
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("id")%></td>
<td><%=resultSet.getString("firstName")%></td>
<td><%=resultSet.getString("designation") %></td>
<% String Squery ="select total from salary where id=?";
stmt1=connection.prepareStatement(Squery);
int id= resultSet.getInt("id");
stmt1.setInt(1,id);
rs= stmt1.executeQuery();
while(rs.next()){
%>
<td><%=rs.getString("total") %></td>
<%
}
%>
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