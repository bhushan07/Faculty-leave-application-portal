<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %> 
<%@ page import ="javax.sql.*" %> 
<%
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost/minitedb","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from userinfo where user='"+session.getAttribute("userid")+"'");
if(rs.next()) 
	{ 
		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Application form</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="form.css" />
	</head>
	<body>
		<nav class="fixed-nav-bar">
			<!-- Fixed navigation bar content -->
			<div >
				<ul class="menu-items">
					<li><a href="http://localhost:8080/miniProject/index.html" title="Home Page"><img src="logo.png" alt="PICT" height="65" /></a></li>
					<li id="app">Application Form</li>
					<li	id="app1">Applicant :<%out.println(rs.getString(2));out.println(rs.getString(3)); %></li>
					<li id="app2">ID &nbsp: <%out.println(rs.getString(1)); %></li>
					
						
					</ul>
				</div>
			</nav>
			<br><br><br>
			
			<form action="submit.jsp" method="post">
				<p>
					<h3>Credentials</h3><hr/>
					<table class="credtable" >
						<tr>
							<td>First Name:</td>
							<td colspan="2"><input type="text" name="f_name" value="<%out.println(rs.getString(2));%>" disabled/></td>
							<td align="right">Last Name:</td>
							<td colspan="2"><input type="text" name="l_name" value="<%out.println(rs.getString(3)); %>" disabled/></td>
						</tr>
						<tr>
							<td>Address:</td>
							<td colspan="4"><input type="text" name="Address" value="<%out.println(rs.getString(4)); %>" disabled></td>
						</tr>
						<tr>
							<td>Contact:</td>
							<td colspan="2"><input type="text" name="Contact" value="<%out.println(rs.getString(5)); %>" disabled/></td>
							<td align="right">E-mail ID:</td>
							<td colspan="2"><input type="text" name="email" value="<%out.println(rs.getString(7)); %>" disabled/></td>
						</tr>
						
						<tr>
							<td>Period of Leave:</td>
							<td align="right">From :</td>
							<td ><input type="date" name="f_date" placeholder="dd-mm-yyyy"/></td>
							<td align="right">To :</td>
							<td ><input type="date" name="t_date"placeholder="dd-mm-yyyy"/></td>
						</tr>
						<tr>
							<td colspan="4" align="right">No. of Leave Days:</td>
							<td><input type="text" name="days" placeholder="Enter count of leave days(e.g 2)"/></td>
						</tr>
						<tr>
							<td>Nature of Leave :</td>
							<td align="center">Casual<input type="radio" name="leavetype" value="CL" /></td>
							<td align="center">Medical<input type="radio" name="leavetype" value="ML" /></td>
							<td align="center">Earned<input type="radio" name="leavetype" value="ER" /></td>
							<td align="center">C-OFF<input type="radio" name="leavetype" value="COFF" /></td>
						</tr>
						<tr>
							<td>Reason of Leave :</td>
							<td colspan="4"><textarea name="reason" rows="4" cols="60" placeholder="Reason of Application"></textarea></td>
						</tr>
					</table>
				</p>
				</br></br>
				<hr/>

				<p>
					<h3>Alternate arrangement for Classes/Practicals</h3>
					
					<table class="credtable" cellspacing="10px">
						<tr>
							<th>Date</th>
							<th>Time slot</th>
							<th>Class Room</th>
							<th>Type</th>
							<th>Replacement</th>
							<th>Status</th>
						</tr>
						<tr>
							<th>
								<input type="date" name="date1" placeholder="dd-mm-yyyy"/>
							</th>
							<th>
								<select name="timeslot1" >
<%rs=st.executeQuery("select * from timeslots");
while(rs.next()){
%>
									<option value="<%out.println(rs.getString(1)); %>"><%out.println(rs.getString(1)); %></option>
<%} %>
								</select>
							</th>
							<th>
								<select name="room1" >
<%rs=st.executeQuery("select * from rooms");
while(rs.next()){
	
	
%>
									<option value="<%out.println(rs.getString(1)); %>"><%out.println(rs.getString(1)); %></option>
<%}%>
								</select>
							</th>
							<th>
								<select name="type1" >
									<option value="lec">Lecture</option>
									<option value="lab">Lab</option>
								</select>
							</th>
							<th>
								<select name="rep1" >
<%rs=st.executeQuery("select * from userinfo");
while(rs.next()){
%>
									<option value="<%out.println(rs.getString(1)); %>"><%out.println(rs.getString(2));out.println(rs.getString(3));out.println(rs.getString(6)); %></option>
<%} %>
								</select>
							</th>
							<th>Status</th>
						</tr>
						<tr>
							<th>
								<input type="date" name="date2" placeholder="dd-mm-yyyy"/>
							</th>
							<th>
								<select name="timeslot2" >
<%rs=st.executeQuery("select * from timeslots");
while(rs.next()){
%>
									<option value="<%out.println(rs.getString(1)); %>"><%out.println(rs.getString(1)); %></option>
<%} %>
							</select>
							</th>
							<th>
								<select name="room2" >
<%rs=st.executeQuery("select * from rooms");
while(rs.next()){
%>
									<option value="<%out.println(rs.getString(1)); %>"><%out.println(rs.getString(1)); %></option>
<%} %>
								</select>
							</th>
							<th>
								<select name="type2" >
									<option value="lec">Lecture</option>
									<option value="lab">Lab</option>
								</select>
							</th>
							<th>
								<select name="rep2" >
<%rs=st.executeQuery("select * from userinfo");
while(rs.next()){
%>
									<option value="<%out.println(rs.getString(1)); %>"><%out.println(rs.getString(4));out.println(rs.getString(2));out.println(rs.getString(3)); %></option>
<%} %>
								</select>
							</th>
							<th>Status</th>
						</tr>
						<tr>
							<th>
								<input type="date" name="date3" placeholder="dd-mm-yyyy"/>
							</th>
							<th>
								<select name="timeslot3" >
<%rs=st.executeQuery("select * from timeslots");
while(rs.next()){
%>
									<option value="<%out.println(rs.getString(1)); %>"><%out.println(rs.getString(1)); %></option>
<%} %>
							</select>
							</th>
							<th>
								<select name="room3" >
<%rs=st.executeQuery("select * from rooms");
while(rs.next()){
%>
									<option value="<%out.println(rs.getString(1)); %>"><%out.println(rs.getString(1)); %></option>
<%} %>
								</select>
							</th>
							<th>
								<select name="type3" >
									<option value="lec">Lecture</option>
									<option value="lab">Lab</option>
								</select>
							</th>
							<th>
								<select name="rep3" >
<%rs=st.executeQuery("select * from userinfo");
while(rs.next()){
%>
									<option value="<%out.println(rs.getString(1)); %>"><%out.println(rs.getString(4));out.println(rs.getString(2));out.println(rs.getString(3)); %></option>
<%} %>
								</select>
							</th>
							<th>Status</th>
						</tr>
						<tr>
							<th>
								<input type="date" name="date4" placeholder="dd-mm-yyyy"/>
							</th>
							<th>
								<select name="timeslot4" >
<%rs=st.executeQuery("select * from timeslots");
while(rs.next()){
%>
									<option value="<%out.println(rs.getString(1)); %>"><%out.println(rs.getString(1)); %></option>
<%} %>
							</select>
							</th>
							<th>
								<select name="room4" >
<%rs=st.executeQuery("select * from rooms");
while(rs.next()){
%>
									<option value="<%out.println(rs.getString(1)); %>"><%out.println(rs.getString(1)); %></option>
<%} %>
								</select>
							</th>
							<th>
								<select name="type4" >
									<option value="lec">Lecture</option>
									<option value="lab">Lab</option>
								</select>
							</th>
							<th>
								<select name="rep4" >
<%rs=st.executeQuery("select * from userinfo");
while(rs.next()){
%>
									<option value="<%out.println(rs.getString(1)); %>"><%out.println(rs.getString(4));out.println(rs.getString(2));out.println(rs.getString(3)); %></option>
<%} %>
								</select>
							</th>
							<th>Status</th>
						</tr>
						
					</table>
				<br>
				<input type="submit" value="submit" name="sub" />
			</form>
			
		</body>
	</html>		
	
	<%}%>
