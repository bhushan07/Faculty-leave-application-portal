<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %> 
<%@ page import ="javax.sql.*" %> 
<%
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/minitedb","root","root"); 
Statement st= con.createStatement(); 
//rs=st.executeQuery("select * from userinfo where user='"+session.getAttribute("userid")+"'");

String date=request.getParameter("f_date");
String slot=request.getParameter("timeslot1");
String room=request.getParameter("room1");
String rec=request.getParameter("rep1");
int curr_aid=0;

String query="select max(aid) from notif";
ResultSet r=st.executeQuery(query);
if(r.next())
{
	curr_aid=r.getInt(1);
	curr_aid++;
	
}


query="insert into notif values('"+session.getAttribute("userid")+"','"+rec+"','"+room+"','"+slot+"','pending','"+date+"',"+curr_aid+",1);";
st.executeUpdate(query);

//date=request.getParameter("date2");
slot=request.getParameter("timeslot2");
room=request.getParameter("room2");
rec=request.getParameter("rep2");
query="insert into notif values('"+session.getAttribute("userid")+"','"+rec+"','"+room+"','"+slot+"','pending','"+date+"',"+curr_aid+",2);";
st.executeUpdate(query);

//date=request.getParameter("date3");
slot=request.getParameter("timeslot3");
room=request.getParameter("room3");
rec=request.getParameter("rep3");
query="insert into notif values('"+session.getAttribute("userid")+"','"+rec+"','"+room+"','"+slot+"','pending','"+date+"',"+curr_aid+",3);";
st.executeUpdate(query);

//date=request.getParameter("date4");
slot=request.getParameter("timeslot4");
room=request.getParameter("room4");
rec=request.getParameter("rep4");
query="insert into notif values('"+session.getAttribute("userid")+"','"+rec+"','"+room+"','"+slot+"','pending','"+date+"',"+curr_aid+",4);";
st.executeUpdate(query);


		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
YOUR APPLICATION WAS SUCCESSFULLY SUBMITTED
<a href="status.jsp">Check status of the form</a>
</body>
</html>