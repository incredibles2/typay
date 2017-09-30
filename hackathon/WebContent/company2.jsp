
<%@ page import="java.sql.*"%>
<%@ page import="typistBeans.typist" %>
<%@ page import="companyBeans.comp" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="company.css">
  <title>company_account</title>
</head>

<body>

<div id="big_container_company">

<div id="container_1_company">
  <div id="company_logo_and_name">
    <font>Welcome,
    
    <%
comp co=(comp)session.getAttribute("comp");
String username=co.getUsername();
String password=co.getPassword();
String name="null";
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon","root","toor") ;

PreparedStatement ps=conn.prepareStatement("select first_name from company where username=? AND password=?");
ps.setString(1, username);
ps.setString(2, password);

ResultSet r=ps.executeQuery();

if(r.next())
{

	 name=r.getString("first_name");
	
	 out.println("<a href=''>"+name+"</a>");

}
 %>
    
    </font>
  </div>
  <div id="rest">
  </div>
</div>

<div id="container_2_company">
  <button type="button" id="btn">Upload Handwritten Document</button>
  <div id="myModal" class="modal">

    <!-- Modal content -->
    <div class="modal-content">
      <div class="modal-header">
        <span class="close">&#10008;</span>
        <h2>UPLOAD IMAGE</h2>
      </div>
      <form id="upload_form" action="company1.jsp">
        <br><br>
        <label>contractor name:</label>
        
        <%
        
        
        
        	
        	 out.println(""+name+"");

         %>
        <br><br>
        <label>Link of image:</label>
        <input type="text" name="link_image"/>
        <br><br>
        <label>Credits(&#8377):</label>
        <input type="number" name="credit"/>
        <br><br>
        <label>Deadline:</label>
        <input type="date" name="deadline"/>
        <br><br>
        <input type="submit" value="Upload"/>
      </form>
    </div>
  </div>

</div>

<div id="container_3_company">
</div>

</div>


<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<script>
$(document).ready(function()
{
  $('#btn').click(function()
{
  $('.modal').css('display','block');
});
});

$(document).ready(function()
{
 $('.close').click(function()
 {
    $('.modal').css('display','none');
 });
});

$(document).ready(function()
{
  $("#upload_form").validate(
    {
       rules:
       {
         cname:"required",
         link_image:"required",
         credit:{
            required:true,
            number:true,
         },
         deadline:"required",
       },

       messages:
       {
         cname:"Enter contractor name",
         link_image:{
           required:"please give url",
           url:true,
         },
         credit:"please enter credit",
         deadline:"give deadline",
       },

       submitHandler:function(form)
       {
         form.submit();
       }


    });
});
</script>
</body>

</html>
