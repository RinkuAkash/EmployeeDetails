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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Details</title>
<link rel="stylesheet" href="style.css">
</head>
<style type="text/css">
select, input[type=text], input[type=Sumbit]{
font-size: 120%;
border-radius: 10px;
width:12%;
height: 30%;
margin:3px;
}
button{
height: 30%;
width: 100px;
border-radius: 10px;
font-size: 115%;
background-color: Dodgerblue;
color:White;
}
.form{
margin: 13px;
}

</style>
<script>
function searchType(){
	 document.getElementById('employeeForm').action = document.getElementById("type").value;
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
	<div class="form">
	<form method="POST" action="Sal">
	<label>Select Employee name to edit:&nbsp</label>
	
	<select id="name" name="name">
	<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
String query ="select id, firstName from data where designation=?";
PreparedStatement stmt=null;
stmt=connection.prepareStatement(query);
stmt.setString(1, designation);
resultSet = stmt.executeQuery();
while(resultSet.next()){
%>
<option><%=resultSet.getString("firstName") %> </option>

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</select>

<button type="submit" >EDIT</button>
</form>
</div>
<table>
</table>
</body>
</html>