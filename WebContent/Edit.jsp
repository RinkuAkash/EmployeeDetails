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
<script type="text/javascript" src="script.js">
</script>
<style type="text/css">
textarea, select, input[type=text], input[type=Date]{
width:100%;
height: 80%;
font-size: 100%;
border-radius: 10px;
}
</style>
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
		<li class="float"><a href="logout">Logout</a></li>
	</ul>
<form method="POST" onSubmit="return validateForm()" action="Edited">
<table class="New-table">
<%
try{
connection = DriverManager.getConnection(connectionUrl+database,userid,password);
String query="select * from data where firstName=?";
PreparedStatement stmt=null;
stmt=connection.prepareStatement(query);
stmt.setString(1, name);
resultSet = stmt.executeQuery();
if(resultSet.next()){
%>
<tr>
						<th><label>Employee Name:</label></th>
						<td><%=resultSet.getString("firstName") %></td> <input type="hidden" name="id" value="<%=resultSet.getString("id") %>">
						<td ><input type="text" id="firstName" name="firstName" onkeypress="return isAlpha(event)" placeholder="Full Name"></td>
						
					</tr>
					<tr>
						<th><label>Designation: </label></th>
						<td><%=resultSet.getString("designation") %></td>
						<td ><select id="designation" name="designation">
									<option value="Software Engineer">Software Engineer</option>
								<option value="Senior Software Engineer">Senior Software Engineer</option>
								<option value="Team Leader">Team Leader</option>
								<option value="Personal Assistant">Personal Assistant</option>
								<option value="HR/Operation Head">HR/Operation Head</option>
						</select></td>
					</tr>
					<tr>
						<th><label>Date of Birth:</label></th>
						<td><%=resultSet.getString("dob") %></td>
						<td ><input type="date" id="dob" name="dob"></td>
					</tr>
					<tr>
						<th><label>Current Address:</label></th>
						<td><%=resultSet.getString("current") %></td>
						<td ><textarea rows="5" name="current" id="current"></textarea></td>
					</tr>
					<tr>
						<td colspan=3><input type="checkbox" name="checkBox"
							onClick="address(this.form)">Click here if current
							address and permanent address is same</td>
					</tr>
					<tr>
						<th><label>Permanent Address:</label></th>
						<td><%=resultSet.getString("parmanent") %></td>
						<td ><textarea rows="5" name="permanent"
								id="permanent"></textarea></td>
					</tr>
					<tr>
						<th><label>Phone no:</label></th>
						<td><%=resultSet.getString("phn") %></td>
						<td ><input type="text" id="phn" name="phn"></td>
					</tr>
					<tr>
						<th><label>Alternative Phone no:</label></th>
						<td><%=resultSet.getString("aphn") %></td>
						<td ><input type="text" id="aphn" name="aphn"></td>
					</tr>
					<tr>
						<th><label>Email id:</label></th>
						<td><%=resultSet.getString("email") %></td>
						<td ><input type="text" id="email" name="email"></td>
					</tr>
					
<%} else {
throw new Exception();
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}%>
					<tr>
						<td colspan=3 align=center><input type="Submit" value="SUBMIT"
							style="background-color: DodgerBlue;font-size: 100%; width: 30%; height:100%; color: white;border-radius: 10px;"></td>
							</tr>				
</table>
</form>
</body>
</html>