<%@ page import="java.sql.*"%>
    
    <%@ page import="typistBeans.typist" %>



<html>
<head>
  <title>TYpist_account</title>
  <link rel="stylesheet" type="text/css" href="typist.css">
</head>

<body>

<div class="big_container_typist">

<div class="container_1_typist">
  website name
  <button type="button" id="sign_out" >Sign out</button>
  <button type="button" id="home">Home</button>
</div>

<div class="container_2_typist">
  <div class="typist_name" style="text-align:center;">
    <font style="font-size:25px;font-family:cursive;font-weight:bold;"><br>Welcome <%
typist t=(typist)session.getAttribute("type");
String username=t.getUsername();
String password=t.getPassword();
String name;
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon","root","toor") ;

PreparedStatement ps=conn.prepareStatement("select first_name from typist where username=? AND password=?");
ps.setString(1, username);
ps.setString(2, password);

ResultSet r=ps.executeQuery();

if(r.next())
{

	 name=r.getString("first_name");

	 out.println("<h3><a href=''>"+name+"</a><h3>");

}
 %></font>
  </div>
  <div class="typist_photo">
  </div>
  <div class="money_earned"></div>
  <div class="submissions"></div>

</div>


<div class="container_3_typist">

<div class="row" style="height:40%;width:100%; background-color:blue;">

  <div class="card" style="float:left;">
    <img src="img_avatar.png" alt="Avatar" style="width:100%">
    <div class="card_info_container">
      <b>John Doe</b>
      <p>Architect & Engineer</p>
    </div>
  </div>

  <div class="card" style="float:center; margin-left:350px;">
    <img src="img_avatar.png" alt="Avatar" style="width:100%">
    <div class="card_info_container">
      <b>John Doe</b>
      <p>Architect & Engineer</p>
    </div>
  </div>


  <div class="card" style="margin-left:1050px;">
    <img src="img_avatar.png" alt="Avatar" style="width:100%">
    <div class="card_info_container">
      <b>John Doe</b>
      <p>Architect & Engineer</p>
    </div>
  </div>

</div>
<!--
  <div class="card" style="float:left;">
    <img src="img_avatar.png" alt="Avatar" style="width:100%">
    <div class="card_info_container">
      <h4><b>John Doe</b></h4>
      <p>Architect & Engineer</p>
    </div>
  </div>

  <div class="card">
    <img src="img_avatar.png" alt="Avatar" style="width:100%">
    <div class="card_info_container">
      <h4><b>John Doe</b></h4>
      <p>Architect & Engineer</p>
    </div>
  </div>

  <div class="card" style="float:right;">
    <img src="img_avatar.png" alt="Avatar" style="width:100%">
    <div class="card_info_container">
      <h4><b>John Doe</b></h4>
      <p>Architect & Engineer</p>
    </div>
  </div>

-->
</div>

</div>

</body>

</html>
