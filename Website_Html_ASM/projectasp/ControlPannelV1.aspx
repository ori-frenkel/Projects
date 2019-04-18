<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ControlPannelV1.aspx.cs" Inherits="ControlPannelV1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="icon" href="IMG/img1.png" type="image/x-icon">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<style type ="text/css" >
    table td, table td * {
    vertical-align: top;
}
.pos-abs {
    bottom: -100px;
    position: relative;
    left: -100px;
    z-index: 2;
}
.img-responsive2 {
    max-width: 100%;
}
/*------------------------------------------*/
.wrapper {
    width: 940px;
    margin: auto;
    text-align: right;
    direction: rtl;
    color: #333333;
    background-color: white;
}
body{background-color: #555555; margin:0px; padding:0px;}
/*------------------------------------------*/
    
    button:hover { 
    background-color: #555555;
}
   
    h2 {
    text-decoration: underline; 
}
    h1
    {
    padding: 20px;
    color: black;
    font-size: 20px;
    font-family: sans-serif;
    	
    }
    h3
    {
    	color: black;
    	text-decoration: underline;
    	font-size: 30px;
    	 text-align: center;  
    }
     h4
    {
    	color: white;
    	font-size: 20px;
    	 text-align: center; 
    }
    h7
    {
    	color: white;
    	font-size: 20px;
    }
    button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    border: none;
    cursor: pointer;
    width: 100%;
}
p.ex1 {
    padding: 20px;
   font-family: sans-serif;
}
    p.ex2 {
    padding: 20px;
    color: black;
    font-size: 20px;
    font-family: sans-serif;
}
button.active {background-color:#795231;}
button.active:hover {background-color:#795548;}
 button.logout
    {
    	color: white;
    	border: none;
        cursor: pointer;
        background-color: #f44336;
        float: left;
        width: 10%;
        text-decoration:none;
        
    	}
    	button.logout:hover
    	{
        box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.2);
    		background-color: #990000;
    	}
    	.white
    	{
    		color: white;
    		text-decoration:none;
    	}

/*------------------------------------------*/


   </style>
 

<body dir="rtl" >

<div class="wrapper"> 
<center>
<table width="100%">

<tr >
<td colspan="3" bgcolor="#E6E6FA" >

<a href="Index.htm"><img src="IMG/img1.png" alt="Mountain View" style="width:304px;height:228px;border-radius:50%;" title="דף הבית"></a>


       <a href="Index.htm"><img class="pos-abs img-responsive2" src = "IMG/dog1.png" width="400" height="200"  title="דף הבית" /></a>

         
</td>
    
    
</tr>
<tr >

<td bgcolor="#006600" width="10%" >

 <a href="LoginV1.aspx"><button>התחבר</button></a>

</td>
<td bgcolor="#006600" width="10%" >

 <a href="register.htm"><button>הרשם</button></a>

</td>
<td bgcolor="#4CAF50" width="70%" >
<div>
    <% if ((Session["Check_Admin"] == "true"))
       { %>
      <button class="active">
          <a href="ControlPannelV1.aspx">Control Pannel</a></button>
       <%}
       else
    { %>
    <p align="center">
    <%
        Response.Redirect("404.htm");%>
    
    <%} %></p>
    
    </div>
<span style="color:White">



   <% if ((Session["Check_User"] == "true") )
       { %>
      
       <%}
       else if ((Session["Check_Admin"] == "true"))
    { %>
    
    ברוך הבא : ADMIN
    
    <%}
       else
    { %>
    
    ברוך הבא אורח;
    <%} %>
    
    

</span>
<button class="logout" >
    <a href="Logout.aspx" class="white">התנתק</a></button>

</td>
    
    
</tr>
<tr >
<td colspan="2" bgcolor="#4CAF50">
<a href="Index.aspx"><button>דף הבית</button></a>
      <br />
 <a href="queiz.aspx"><button>queiz</button></a>
 <br />
  <a href="NewFrBulldog.htm"><button>בולדוג צרפתי</button></a>
  <br />
   <a href="register.htm"><button >רואה גרמני</button></a>
   <br />
    <a href="register.htm"><button>פג סיני</button></a>
    <br />
     <a href="register.htm"><button>האסקי סיבירי</button></a>
     <br />
      <a href="register.htm"><button>שנאוצר</button></a>
      <br />
      <a href="register.htm"><button>דוברמן </button></a>
      <br />
      <a href="register.htm"><button>אקיטה אינו</button></a>
      <br />
      <a href="register.htm"><button>ביגל</button></a>
      <br />
      <a href="register.htm"><button>גולדן רטריבר</button></a>
      <br />
      <a href="register.htm"><button>ג'ק ראסל טרייר</button></a>
      <br />
      <a href="register.htm"><button>דלמטי</button></a>
      <br />
      <a href="register.htm"><button>רוטוויילר</button></a>
      
      
</td>
<td width="70%">
<table width="100%">


</table>
</body>
</html>
