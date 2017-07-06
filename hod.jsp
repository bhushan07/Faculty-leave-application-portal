<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %> 
<%@ page import ="javax.sql.*" %> 
<%
Class.forName("com.mysql.jdbc.Driver"); 
//java.sql.Connection con = DriverManager.getConnection("jdbc:mysql:///minitedb","minite","minite"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/minitedb","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from userinfo where login_id='C0001'");
if(rs.next()) 
{ 
	
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="hod.css" />
<title>HOD Login</title>
</head>
<body>
	<nav class="fixed-nav-bar">
			<!-- Fixed navigation bar content -->
			<div >
				<ul class="menu-items">
					<li><a href="http://localhost:8080/miniProject/index.html" title="Home Page"><img src="logo.png" alt="PICT" height="65" /></a></li>
					<li id="app">HOD Login</li>
					<li	id="app1">Applicant :<%out.println(rs.getString(2));out.println(rs.getString(3)); %></li>
					<li id="app2">ID &nbsp: <%out.println(rs.getString(1)); %></li>
					</ul>
				</div>
			</nav>
<%}%>			
			<br><br><br>
			<p><h3>Pending Leave Applications </h3></p><hr/>
			<form action="hodsubmit.jsp" method="post">
			<table class="credtable">
					<tr>
						<th>UserID</th>
						<th>Name</th>
						<th>From Date</th>
						<th>To Date</th>
						<th>Days</th>
						<th>Leave Type</th>
						<th>Reason</th>
						<th colspan="2">Approval</th>
					</tr>
			
<%rs=st.executeQuery("select count(login_id) from record where status='pending';");
int count=0,c=1;
if(rs.next()) 
{ 
	count=rs.getInt(1);
}
if(count<1)
{
%>
	<br> <h4>No Pending Requests.</h4>
<% 
}
else
{
 %>
 <%rs=st.executeQuery("select * from record where status='pending';");
 while(rs.next())
 {
	 
	 
 %>
 
 					<tr>
 						<td><%out.println(rs.getString(1)); %></td>
 						<td><%ResultSet rr;
 							  Statement ss= con.createStatement();
 							rr=ss.executeQuery("select * from userinfo where login_id='"+rs.getString(1)+"';");
 							if(rr.next()){
 							  out.println(rr.getString(2)+" "+rr.getString(3)); }%></td>
 						<td><%out.println(rs.getString(2)); %></td>
 						<td><%out.println(rs.getString(3)); %></td>
 						<td><%out.println(rs.getString(4)); %></td>
 						<td><%out.println(rs.getString(5)); %></td>
 						<td><%out.println(rs.getString(6)); %></td>
 						<td>Approve<input type="radio" name="<%out.println(c);%>" value="Approved" /></td>
 						<td>Disapprove<input type="radio" name="<%out.println(c);%>" value="Disapproved" /></td>
 						
 					</tr>
 <%
 c++;} %>
			
			</table>
			<br><br>

			<input type="submit" value="submit" name="subHOD" />
			</form>
 
 <%
 }
 %>
 			
</body>
</html>
