
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
  <img src="logo.png" style="float:left;"/>
  <button type="button" id="sign_out" >Sign out</button>
  <a href="main.html"><button type="button" id="home">Home</button></a>
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
  <div class="money_earned"><font  style="font-size:22px;font-family:monospace;font-weight:bold;">Money Earned:22330</font></div>
  <div class="submissions"><font style="font-size:22px;font-family:monospace;font-weight:bold;">Total Submissions:247</font>
    <br><br><br><br><select name="sort" style="margin-left:70px; height:25px;width:200px;">
      <option>Sort by</option>
      <option value="Credit">Credit</option>
      <option value="Deadline">Deadline</option>
    </select></div>
</div>


<div class="container_3_typist">

  <br><br>
<div class="project_div">
  <div class="div1">
    <div class="div1_A" >
      <br><br>
      <a href="" style="text-decoration:none;a:hover{color:RED;}">put link here</a>
    </div>
    <div class="div1_B">
      <br><br>
      Contractor:put name here
    </div>
  </div>
  <div class="div2">
    <div class="div2_A">
      <br><br>
      ID:put id here
    </div>
    <div class="div2_B">
      <br><br>
      Contact:put number here
    </div>
    <div class="div2_C">
      <div class="div2_C1">
        <br><br>
        Credit:put credit here
      </div>
      <div class="div2_C2">
        <br><br>
        Deadline:put deadline here
      </div>
    </div>
  </div>
</div>
<br><br>
<div class="project_div">
<div class="div1">
  <div class="div1_A" >
    <br><br>
    <a href="" style="text-decoration:none;a:hover{color:RED;}">put link here</a>
  </div>
  <div class="div1_B">
    <br><br>
    Contractor:put name here
  </div>
</div>
<div class="div2">
  <div class="div2_A">
    <br><br>
    ID:put id here
  </div>
  <div class="div2_B">
    <br><br>
    Contact:put number here
  </div>
  <div class="div2_C">
    <div class="div2_C1">
      <br><br>
      Credit:put credit here
    </div>
    <div class="div2_C2">
      <br><br>
      Deadline:put deadline here
    </div>
  </div>
</div>
</div>
<br><br>
<div class="project_div">
<div class="div1">
  <div class="div1_A" >
    <br><br>
    <a href="" style="text-decoration:none;a:hover{color:RED;}">put link here</a>
  </div>
  <div class="div1_B">
    <br><br>
    Contractor:put name here
  </div>
</div>
<div class="div2">
  <div class="div2_A">
    <br><br>
    ID:put id here
  </div>
  <div class="div2_B">
    <br><br>
    Contact:put number here
  </div>
  <div class="div2_C">
    <div class="div2_C1">
      <br><br>
      Credit:put credit here
    </div>
    <div class="div2_C2">
      <br><br>
      Deadline:put deadline here
    </div>
  </div>
</div>
</div>
</div>
<br><br>
<button type="button" id="upload" style="height:35px;width:370px;margin-left:470px;background-color:blue;color:white;border-color:blue;border-radius:6px;"><font style="font-weight:bold;font-family:monospace;">UPLOAD TYPED PROJECT</font></button>
<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&#10008;</span>
      <h2>UPLOAD TYPED PROJECT</h2>
    </div>
    <form id="register_form" method="post">
      <br><br>
      <label>Typist Name</label>
      <input type="text" name="Typist_Name" id="typistkanaam"/>
      <br>
      <label>Contractor Name</label>
      <input type="text" name="cname" id="contractorkanaam"/>
      <br>
      <label>Project ID</label>
      <input type="text" name="pid" id="projectid"/>
      <br>
      <label>calculated pay</label><font>:put pay here extracted from database</font>
      <br>
      <input type="submit" value="UPLOAD"/>
    </form>
  </div>
</div>

</div>
<!--<script   src="https://code.jquery.com/jquery-3.2.1.js"  
          integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="   
          crossorigin="anonymous"></script>-->

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.js"></script>

<script>

/*$(document).ready(function()
{
  $('#append').click(function()
{
  $('.container_3_typist').append(
    '<br><br>\n'+
  '<div class="project_div">\n'+
    '<div class="div1">\n'+
      '<div class="div1_A" >\n'+
        '<br><br>\n'+
        '<a href="" style="text-decoration:none;a:hover{color:RED;}">put link here</a>\n'+
      '</div>\n'+
      '<div class="div1_B">\n'+
        '<br><br>\n'+
        'Contractor:put name here'+
      '</div>\n'+
    '</div>\n'+
    '<div class="div2">\n'+
      '<div class="div2_A">\n'+
        '<br><br>\n'+
        'ID:put id here'+
      '</div>\n'+
      '<div class="div2_B">\n'+
        '<br><br>\n'+
        'Contact:put number here'+
      '</div>\n'+
      '<div class="div2_C">\n'+
        '<div class="div2_C1">\n'+
          '<br><br>\n'+
          'Credit:put credit here'+
        '</div>\n'+
        '<div class="div2_C2">\n'+
          '<br><br>\n'+
          'Deadline:put deadline here'+
        '</div>\n'+
      '</div>\n'+
    '</div>\n'+
  '</div>\n'
  );
});
});
*/
$(document).ready(function()
{
  $('#clear').click(function()
{
  $('.container_3_typist').empty();
});
});

$(document).ready(function()
{
  $('#upload').click(function()
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
  $('#register_form').validate(
    {

      rules:{
             Typist_Name:"required",
             cname:"required",
             pid:"required",
      },
      messages:{
            Typist_Name:"please enter name of typist",
            cname:"please enter name of contractor",
            pid:"please enter page ID",
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
