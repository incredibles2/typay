
<%@ page import="java.sql.*"%>
<%@ page import="typistBeans.typist" %>
<%@ page import="companyBeans.comp" %>
    
    <%
comp co=(comp)session.getAttribute("comp");
String username=co.getUsername();
String password=co.getPassword();
String name="null";
String email="null";
String aadhar="null";
String mobile="null";
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon","root","toor") ;

PreparedStatement ps=conn.prepareStatement("select * from company where username=? AND password=?");
ps.setString(1, username);
ps.setString(2, password);

ResultSet r=ps.executeQuery();



//DatabaseMetaData dbm = conn.getMetaData();


if(r.next())
{

	 name=r.getString("first_name");
	 //ResultSet tables = dbm.getTables(null, null, name, null);
	 email=r.getString("email");
	 mobile=r.getString("mobile");
	 //aadhar=r.getString("aadhar_number");
	 //ps=conn.prepareStatement("select * from "+name+"");
	 //ps.setString(1, name);
	 r=ps.executeQuery();
		
	 //out.println("<a href=''>"+name+"</a>");

}
 %>
 
 
 
<%
String link=request.getParameter("link_image");
String credit=request.getParameter("credit");
//String aadhar_no=request.getParameter("aadhar");
String deadline=request.getParameter("deadline");

ps=conn.prepareStatement("insert into links (contractor_name,contractor_email,mobile,link,price,deadline) values(?,?,?,?,?,?)");
ps.setString(1,name);
ps.setString(2, email);
ps.setString(3,mobile);
ps.setString(4, link);
ps.setString(5, credit);
ps.setString(6, deadline);
ps.executeUpdate();


%>
    <%response.sendRedirect("company2.jsp"); %>