
<%@ page import="java.sql.*"%>
<%@ page import="typistBeans.typist" %>
<%@ page import="companyBeans.comp" %>

<jsp:useBean id="t" class="typistBeans.typist"/>
<jsp:setProperty property="*" name="t"/> 

<jsp:useBean id="c" class="companyBeans.comp"/>
<jsp:setProperty property="*" name="c"/> 
	
<%

Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon","root","toor") ;

String user=request.getParameter("Account_type");
String username=request.getParameter("username");
String password=request.getParameter("password");




%>

	
	
<%
	
if(user.equals("Typist"))
{
	
	session.setAttribute("type", t);
	
	PreparedStatement ps=conn.prepareStatement("select * from typist where username=? AND password=? ");
	ps.setString(1,username );
	ps.setString(2, password);
	
	
	ResultSet r=ps.executeQuery();
	
if(r.next())
{
	
		
	
%>
<%response.sendRedirect("typist.jsp"); %>
<%
}
else
{

	out.println("in else<br>");

%>	
<%response.sendRedirect("main.html"); %>	
<%
}}
%>
<%
	if(user.equals("company"))
	{
		session.setAttribute("comp", c);
		PreparedStatement ps=conn.prepareStatement("select * from company where username=? AND password=?" );
		ps.setString(1, username);
		ps.setString(2, password);
		
		
		ResultSet r=ps.executeQuery();
		
	if(r.next())
	{
	%>
	<%response.sendRedirect("company2.jsp"); %>
	<%
	}
	else
	{ 
	%>
	<%response.sendRedirect("main.html"); %>	
	<%
	}}
		if(user.equals("")||username.equals("")||password.equals(""))
		{
		%>
			<%response.sendRedirect("main.html"); %>	
		
		<%
	}
	
	
	%>
		
	

<%
	

conn.close();
%>
















