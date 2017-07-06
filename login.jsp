<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %> 
<%@ page import ="javax.sql.*" %> 
<% 
String userid=request.getParameter("usr"); 
String pwd=request.getParameter("pwd"); 
String utype=request.getParameter("logintype");
if (userid != null && userid.length() > 0) {
	  session.setAttribute("userid", userid);
	}


//Register Driver
Class.forName("com.mysql.jdbc.Driver"); 
//java.sql.Connection con = DriverManager.getConnection("jdbc:mysql:///minitedb","minite","minite"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/minitedb","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from login where user='"+session.getAttribute("userid")+"'"); 
if(rs.next()) 
	{ 
		if(rs.getString(2).equals(pwd)) 
	{ 
			 session.setAttribute("pwd", pwd);
			 session.setAttribute("utype", utype);

			 //if(session.getAttribute("utype")=="teacher"){
				 if(utype.equals("teacher")){
				 
				 response.sendRedirect("welcome_teacher.jsp");
				 return;
			 }
				 else if(utype.equals("hod")){
					 response.sendRedirect("hod.jsp");
					 return; 
				 }
				 else if(utype.equals("admin")){
					 
				 }
	}
		else{
			response.sendRedirect("error.jsp");
		}
	}
		

	 %>