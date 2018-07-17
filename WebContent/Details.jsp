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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Details</title>
<link rel="stylesheet" href="style.css">
</head>
<style type="text/css">

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
}</style>

<script src="script.js"></script>
<body>
<div class="clearfix">
<div class="header">
<img src="UskCorp.png" >
<h1>Employee Details</h1>
</div>
</div>
<ul>
<li><a href="Index">Home</a></li>
<li><a href="New">New</a></li>
<li><a href="Update">Update</a></li>
<li><a href="Search">Search</a></li>
<li class="float"><a href="logout" >Logout</a></li>
</ul>
<div>
<form method="POST" class="sel" id="employeeForm" onSubmit="return searchType()"> 
<br><label>Designation:</label>&nbsp<select id="designation" name="designation">
								<option value="Software Engineer">Software Engineer</option>
								<option value="Senior Software Engineer">Senior Software Engineer</option>
								<option value="Team Leader">Team Leader</option>
								<option value="Personal Assistant">Personal Assistant</option>
								<option value="HR/Operation Head">HR/Operation Head</option>
						</select>
&nbsp<label>Type:</label>&nbsp<select id="type">
<option value="Details">Details</option>
<option value="Salary">Salary</option>
</select>
<button type="submit">SEARCH</button>
</form>
</div>
<hr>
<div>
<table class="table" id="myTable2">
	<tr>
<td><input type="text" id="myInput" onkeyup="myFunction()" onkeypress="return isNumber(event)" placeholder="Id"></td>
<td><input type="text" id="myInput1" onkeyup="myFunction1()" onkeypress="return isAlpha(event)" placeholder="Name"></td>
<td><input type="text" id="myInput2" onkeyup="myFunction2()" placeholder="Date of Birth"></td>
<td><input type="text" id="myInput3" onkeyup="myFunction3()" onkeypress="return isAlpha(event)" placeholder="Current Address"></td>
<td><input type="text" id="myInput4" onkeyup="myFunction4()" onkeypress="return isAlpha(event)" placeholder="Permanent Address"></td>
<td><input type="text" id="myInput5" onkeyup="myFunction5()" onkeypress="return isNumber(event)" placeholder="Phone no"></td>
<td><input type="text" id="myInput6" onkeyup="myFunction6()" onkeypress="return isNumber(event)" placeholder="Alternative phn"></td>
<td><input type="text" id="myInput7" onkeyup="myFunction7()" onkeypress="return isAlpha(event)" placeholder="Email"></td>
</tr>
<tr>
<th onClick="sortTable(0)">ID</th>
<th onClick="sortTable(1)">Name</th>
<th onClick="sortTable(2)">Date of Birth</th>
<th onClick="sortTable(3)">Current Address</th>
<th onClick="sortTable(4)">Permanent Address</th>
<th onClick="sortTable(5)">Phone no</th>
<th onClick="sortTable(6)">Alternative phn</th>
<th onClick="sortTable(7)">Email</th>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
String query ="select * from data where designation=?";
PreparedStatement stmt=null;
stmt=connection.prepareStatement(query);
stmt.setString(1, designation);
resultSet = stmt.executeQuery();
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("id")%></td>
<td><%=resultSet.getString("firstName")%></td>
<td><%=resultSet.getString("dob")%></td>
<td><%=resultSet.getString("current") %></td>
<td><%=resultSet.getString("parmanent") %></td>
<td><%=resultSet.getString("phn") %></td>
<td><%=resultSet.getString("aphn") %></td>
<td><%=resultSet.getString("email") %></td>
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