<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>

<%

Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon","root","toor") ;


String user=request.getParameter("Account_type");
String aadhar=request.getParameter("aadhar");
String firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String email=request.getParameter("email");
String username=request.getParameter("username");
String password=request.getParameter("pass");
String mobile=request.getParameter("phone_no");





if(user.equals("company"))
{
	
	PreparedStatement ps=conn.prepareStatement("insert into company(aadhar_number,first_name,last_name,email,username,password,Mobile) values(?,?,?,?,?,?,?)");



	ps.setString(1, aadhar);
	ps.setString(2,firstname);
	ps.setString(3,lastname);
	ps.setString(4,email);
	ps.setString(5,username);
	ps.setString(6,password);
	ps.setString(7,mobile);
		
	
   int e=ps.executeUpdate();
   


   if(e!=0){
	  
		%>
		<%response.sendRedirect("main.html"); %>
		<%
		}
	}
		%>
	
	
	
	<%//response.sendRedirect("main.html"); %>
	
	
	<%
	

	
if(user.equals("Typist"))
{
	
	
		
	PreparedStatement ps=conn.prepareStatement("insert into typist(aadhar_number,first_name,last_name,email,username,password,Mobile) values(?,?,?,?,?,?,?)");



	ps.setString(1, aadhar);
	ps.setString(2,firstname);
	ps.setString(3,lastname);
	ps.setString(4,email);
	ps.setString(5,username);
	ps.setString(6,password);
	ps.setString(7,mobile);
		
	
   int e=ps.executeUpdate();
   


   if(e!=0){
	  
		%>
		<%response.sendRedirect("main.html"); %>
		<%
		}
	}
		%>