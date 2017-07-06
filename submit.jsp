<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %> 
<%@ page import ="javax.sql.*" %> 
<%
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/minitedb","root","root"); 
Statement st= con.createStatement(); 
//rs=st.executeQuery("select * from userinfo where user='"+session.getAttribute("userid")+"'");

String date=request.getParameter("date1");
String slot=request.getParameter("timeslot1");
String room=request.getParameter("room1");
String rec=request.getParameter("rep1");
int curr_aid=0;

String query="select max(aid) from notif";
ResultSet rs=st.executeQuery(query);
if(rs.next())
{
	curr_aid=rs.getInt(1);
	curr_aid++;
	
}


query="insert into notif values('"+session.getAttribute("userid")+"','"+rec+"','"+room+"','"+slot+"','pending','"+date+"',"+curr_aid+",1);";
st.executeUpdate(query);

date=request.getParameter("date2");
slot=request.getParameter("timeslot2");
room=request.getParameter("room2");
rec=request.getParameter("rep2");
query="insert into notif values('"+session.getAttribute("userid")+"','"+rec+"','"+room+"','"+slot+"','pending','"+date+"',"+curr_aid+",2);";
st.executeUpdate(query);

date=request.getParameter("date3");
slot=request.getParameter("timeslot3");
room=request.getParameter("room3");
rec=request.getParameter("rep3");
query="insert into notif values('"+session.getAttribute("userid")+"','"+rec+"','"+room+"','"+slot+"','pending','"+date+"',"+curr_aid+",3);";
st.executeUpdate(query);

date=request.getParameter("date4");
slot=request.getParameter("timeslot4");
room=request.getParameter("room4");
rec=request.getParameter("rep4");
query="insert into notif values('"+session.getAttribute("userid")+"','"+rec+"','"+room+"','"+slot+"','pending','"+date+"',"+curr_aid+",4);";
st.executeUpdate(query);





String from=request.getParameter("f_date");
String to=request.getParameter("t_date");
String days=request.getParameter("days");
String reason=request.getParameter("reason");
String type=request.getParameter("leavetype");

rs=st.executeQuery("select * from userinfo where user='"+session.getAttribute("userid")+"'");
if(rs.next()) 
{ 
	
%>





<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="submit.css" />
<title>Submited</title>
</head>
<body>
	<nav class="fixed-nav-bar">
			<!-- Fixed navigation bar content -->
			<div >
				<ul class="menu-items">
					<li><a href="http://localhost:8080/miniProject/index.html" title="Home Page"><img src="logo.png" alt="PICT" height="65" /></a></li>
					<li id="app">Application Submitted </li>
					<li	id="app1">Applicant :<%out.println(rs.getString(2));out.println(rs.getString(3)); %></li>
					<li id="app2">ID &nbsp: <%out.println(rs.getString(1)); %></li>
					
						
					</ul>
				</div>
			</nav>
<%
	int i=st.executeUpdate("insert into record values ('"+session.getAttribute("userid")+"','"+from+"','"+to+"',"+days+",'"+type+"','"+reason+"','pending')");
%>
			
			<br><br><br><br><p><h2>Form Submited.! Please Close the tab or ,</h2></p>
			<p><a href="http://localhost:8080/miniProject/index.html" title="Home Page"><h4>Click here to go to HOME PAGE</h4> </p>
</body>
</html>

<%}%>
