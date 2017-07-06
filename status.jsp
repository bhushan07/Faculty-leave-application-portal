<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %> 
<%@ page import ="javax.sql.*" %> 
<%
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/minitedb","root","root"); 
Statement st= con.createStatement(); 
String query="select * from notif where sender='"+session.getAttribute("userid")+"';";
ResultSet rs=st.executeQuery(query);
out.println(session.getAttribute("userid") +" your requests have been sent");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="status.css">
</head>
<body>
<table>
<tr>
<th>Appl-ID</th>
<th>Slot-ID</th>
<th>substitute</th>
<th>room</th>
<th>timeslot</th>
<th>status</th>
<th>date</th>
</tr>
<%while(rs.next()){ %>
<tr>
<th><%out.println(rs.getInt(7));%></th>
<th><%out.println(rs.getInt(8));%></th>
<th><%out.println(rs.getString(2));%></th>
<th><%out.println(rs.getString(3));%></th>
<th><%out.println(rs.getString(4));%></th>
<th><%out.println(rs.getString(5));%></th>
<th><%out.println(rs.getString(6));%></th>
</tr>
<%} %>
</table>



</body>
</html>