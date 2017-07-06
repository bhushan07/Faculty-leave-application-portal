<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %> 
<%@ page import ="javax.sql.*" %> 
    
    <%
    

    String date=request.getParameter("date");
    String slot=request.getParameter("timeslot");
    String room=request.getParameter("room");
    String rec=request.getParameter("sender");
    int aid=Integer.parseInt(request.getParameter("aid"));
    int sid=Integer.parseInt(request.getParameter("sid"));
    
    //Register Driver
Class.forName("com.mysql.jdbc.Driver"); 
//java.sql.Connection con = DriverManager.getConnection("jdbc:mysql:///minitedb","minite","minite"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/minitedb","root","root"); 
Statement st= con.createStatement(); 
st.executeUpdate("update notif set status='approved' where aid="+aid+" and sid="+sid+";"); 
//st.executeUpdate("update notif set status='approved' where class='"+room+"';"); 
	//out.println(rec);
	//out.println(aid);
	//out.println(sid);
	response.sendRedirect("welcome_teacher.jsp");


		

	 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>