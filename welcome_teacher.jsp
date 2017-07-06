<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import ="java.sql.*" %> 
<%@ page import ="javax.sql.*" %> 
<% 
Class.forName("com.mysql.jdbc.Driver"); 
//java.sql.Connection con = DriverManager.getConnection("jdbc:mysql:///minitedb","minite","minite"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/minitedb","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=null;%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>


<link rel="stylesheet" type="text/css" href="welcome_teacher.css">


</head>



<body>
<h1>WELCOME</h1>
<div class="left">

<%
String query="select * from leaves where user='"+session.getAttribute("userid")+"';";
rs=st.executeQuery(query);
int cl,ml,el,coff;
if(rs.next()){
	cl=rs.getInt(2);
	ml=rs.getInt(3);
	el=rs.getInt(4);
	coff=rs.getInt(5);

%>
<TABLE>	

<tr>
<th>LEAVE TYPE</th>
<th>COUNT</th>
</tr>

<tr>
<td>CASUAL</td>
<td><%out.println(cl); %></td>

</tr>

<tr>
<td>MEDICAL</td>
<td><%out.println(ml); %></td>

</tr>

<tr>
<td>EARNED</td>
<td><%out.println(el); %></td>
</tr>

<tr>
<td>C-OFF</td>
<td><%out.println(coff); %></td>
</tr>
</TABLE>

<br><br>
<form action="form.jsp" method="post">
<input type="submit" value="Apply" name="apply">
</form>
<br>
<br>
<a href="status.jsp">Check status of previous application</a>
</div>
<%} %>

<!--notifications code -->
<div class="right">
<ul class="notification-bar">
<%
query="select * from notif where receiver='"+session.getAttribute("userid")+"' and status='pending';";
rs=st.executeQuery(query);
while(rs.next()){

%>

<li>
<i class="ion-ios-bolt"></i>
<div class="single-noti">
<form action="approve.jsp" method="post"> 
<ul type="square">
<%String sender=rs.getString(1); %>
<li><input type="text" name="sender" value="<%out.println(sender);%>"/></li>
<li><input type="text" name="date" value="<%out.println(rs.getString(6)); %>" />></li>
<li><input type="text" name="room" value="<%out.println(rs.getString(3)); %>" /></li>
<li><input type="text" name="timeslot" value="<%out.println(rs.getString(4)); %>" /></li>
<li><input type="text" name="aid" value="<%out.println(rs.getInt(7)); %>" /></li>
<li><input type="text" name="sid" value="<%out.println(rs.getInt(8)); %>" /></li>
<li><input type="submit" value="Approve"></li></ul>
<%session.setAttribute("room",rs.getString(3));%>
</form>
</div>

</li>
<br>
<%} %>
</ul>
</div>

</body>
</html>