<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%> 
<%
String name= request.getParameter("name");
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
ResultSet rs = null;
ResultSet r=null;
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Details</title>
<link rel="stylesheet" href="style.css">
</head>
<style type="text/css">
textarea, select, input[type=text], input[type=Date]{
width:100%;
height: 80%;
font-size: 100%;
border-radius: 10px;
}
</style>
<script>
function add(){
	var x= getElementById("basic").value;
	var y=getElementById("support").value;
	var z= getElementById("training").value;
	var total= x+y+z;
	getElementById("total")= total;
}
</script>
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
		<li class="float"><a href="logout">Logout</a></li>
	</ul>
<div class="New-table">
<form method="POST" action="Supdated">
<table border=1>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database,userid,password);
String query="select * from data where firstName=? ";
PreparedStatement stmt=null;
stmt=connection.prepareStatement(query);
stmt.setString(1, name);
r= stmt.executeQuery();
if(r.next()){
%>
<tr>
						<th><label>Employee Name:</label></th>
						<td colspan=2><%=r.getString("firstName") %></td> <input type="hidden" name="id" value="<%=r.getInt("id") %>">
						
						
					</tr>
<%
int id=r.getInt("id");
String query2="select * from salary where id=? ";
PreparedStatement stmt1=null;
stmt1=connection.prepareStatement(query2);
stmt1.setInt(1, id);
rs= stmt1.executeQuery();
if(rs.next()){
%>
					<tr>
						<th><label>Basic</label></th>
						<td><%=rs.getString("basic") %></td>
						<td ><input type="text" name="basic" id="basic" onChange="add()"></td>
					</tr>
					<tr>
						<th><label>Support</label></th>
						<td><%=rs.getString("support") %></td>
						<td ><input  type="text" name="support"
								id="support" onChange="add()"></td>
					</tr>
					<tr>
						<th><label>Training</label></th>
						<td><%=rs.getString("training") %></td>
						<td ><input type="text" id="training" name="training" onChange="add()"></td>
					</tr>
					<tr>
						<th><label> Total</label></th>
						<td><%=rs.getString("total") %></td>
						<td ><input type="text" id="total" name="total"></td>
					</tr>
					<tr>
						<td colspan=3 align=center><input type="Submit" value="SUBMIT"
							style="background-color: DodgerBlue;font-size: 100%; width: 30%; height:100%; color: white;border-radius: 10px;"></td>
							</tr>
<%} else {
throw new Exception();
}
}else{
	throw new Exception();
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