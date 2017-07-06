<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %> 
<%@include file="hod.jsp" %>
<%@ page import ="javax.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
Class.forName("com.mysql.jdbc.Driver"); 
rs=st.executeQuery("select * from record where status='pending';");
String ap=""; 
c--;
if(rs.absolute(c))
 {	
	 ap=request.getParameter("ap"+c);
	 int i=st.executeUpdate("update record set status='"+ap+"' where login_id='"+rs.getString(1)+"' and status='pending' ;");
 } 
 %>




<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hod Done</title>
</head>
<body>
<br><br><br>
done!!!!!
<%out.println(ap); %><br><%out.println("ap"+c); %>
</body>
</html>