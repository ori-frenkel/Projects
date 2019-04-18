<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<style type ="text/css" >
    
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
    table td, table td * {
    vertical-align: top;
}
    
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
/*------------------------------------------*/


   </style>
<body dir="rtl" >
<div class="wrapper"> 
<center>
<table width="100%">

<tr >
<td colspan="3" bgcolor="#E6E6FA" >
    
<a href="Index.aspx"><img src="IMG/img1.png" alt="Mountain View" style="width:304px;height:228px;border-radius:50%;" title="דף הבית"></a>


       <a href="Index.aspx"><img class="pos-abs img-responsive2" src = "IMG/dog1.png" width="400" height="200"  title="דף הבית" /></a>

    
</td>
    
    
</tr>
<tr >
    
<td bgcolor="#006600" width="10%" >

 <a href="LoginV1.aspx"><button>התחבר</button></a>

</td>
<td bgcolor="#006600" width="10%" >

 <a href="RegisterV1.aspx"><button>הרשם</button></a>

</td>
<td bgcolor="#4CAF50" width="70%" >
<span>
 <% if (((Session["Check_Admin"] == "true")))
       { %>
      <a href="AdminSearchFormV1.aspx"><button style="width:auto; height:auto">Control Pannel.aspx</button></a>
          
       <%}
       else
    { %>
    
    
    <%} %>
</span>
<span style="color:White">

    <% if ((Session["Check_User"] == "true") )
       { %>
     ברוך הבא משתמש : <%  Response.Write(Session["User"]);%>
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
<a href="Index.aspx"><button class="active">דף הבית</button></a>
      <br />
 <a href="QuizV1.aspx"><button>Quiz</button></a>
 <br />
  <a href="AllDogsInfoAspx/FrenchBulldogV1.aspx"><button>בולדוג צרפתי</button></a>
  <br />
   <a href="GermanShepherdV1.aspx"><button>רואה גרמני</button></a>
   <br />
    <a href="AllDogsInfoAspx/Pug.aspx"><button>פג סיני</button></a>
    <br />
     <a href="AllDogsInfoAspx/SiberianHuskyV1.aspx"><button>האסקי סיבירי</button></a>
     <br />
      <a href="AllDogsInfoAspx/SchnauzerV1.aspx"><button>שנאוצר</button></a>
      <br />
      <a href="AllDogsInfoAspx/DobermanPinscherV1.aspx"><button>דוברמן </button></a>
      <br />
      <a href="AllDogsInfoAspx/AkitaV1.aspx"><button>אקיטה אינו</button></a>
      <br />
      <a href="Beagle.aspx"><button>ביגל</button></a>
      <br />
      <a href="AllDogsInfoAspx/GoldenRetrieverV1.aspx"><button>גולדן רטריבר</button></a>
      <br />
      <a href="AllDogsInfoAspx/JackRussellTerrierV1.aspx"><button>ג'ק ראסל טרייר</button></a>
      <br />
      <a href="AllDogsInfoAspx/DalmatianV1.aspx"><button>דלמטי</button></a>
      <br />
      <a href="AllDogsInfoAspx/RottweilerV1.aspx"><button>רוטוויילר</button></a>
      
      
</td>
<td width="70%">

<h3>
דף הבית  
</h3>
<br />
  
                           
  <h1>מבוא:</h1>
  
<p class="ex1">
אתר זה ייתן מידע כגון:מקור הגזע והיסטוריה,נתונים ומאפיינים על סוגי הכלבים:
</p>
<ul>
  <li>בולדוג צרפתי</li>
  <li>רואה גרמני</li>
  <li>פג סיני</li>
  <li>האסקי סיבירי</li>
  <li>שנאוצר</li>
  <li>דוברמן</li>
  <li>אקיטה אינו</li>
  <li>ביגל</li>
  <li>גולדן רטריבר</li>
  <li>ג'ק ראסל טרייר</li>
  <li>דלמטי</li>
  <li>רוטוויילר</li>
</ul> 
<p class="ex1">
נוסף על כך משתמשים רשומים יוכלו לבחון את עצמם בעזרת שאלון, ודרכו לראות אם הבינו את המידע שלמדו דרך האתר.
<br />
תוכל לנווט באתר דרך ה-בר שנמצא בימין הדף ודרכו גם תוכל להרשם ולהתחבר לאתר.

 
</p>



    

  
</td>
</tr>
</table>
</center>
</div>
</body>
</html>
