<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QuizV1.aspx.cs" Inherits="QuizV1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="icon" href="IMG/img1.png" type="image/x-icon">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<style type ="text/css" >
        *, html {
    margin:0;
    padding:0;  
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
    table td, table td * {
    vertical-align: top;
}
p{font-family: sans-serif;}
    
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
<!-- JavaScript -->
 <script type = "text/javascript">


function getAnswer1(ans) {

if (ans == "1c") {alert ("That is the right answer!")}
else {alert ("No - try again")}
}
function getAnswer2(ans) {

if (ans == "1a") {alert ("That is the right answer!")}
else {alert ("No - try again")}
}
function getAnswer3(ans) {

if (ans == "1d") {alert ("That is the right answer!")}
else {alert ("No - try again")}
}
function getAnswer4(ans) {

if (ans == "1a") {alert ("That is the right answer!")}
else {alert ("No - try again")}
}
function getAnswer5(ans) {

if (ans == "1a") {alert ("That is the right answer!")}
else {alert ("No - try again")}
}
function getAnswer6(ans) {

if (ans == "1b") {alert ("That is the right answer!")}
else {alert ("No - try again")}
}
function getAnswer7(ans) {

if (ans == "1d") {alert ("That is the right answer!")}
else {alert ("No - try again")}
}
function getAnswer8(ans) {

if (ans == "1d") {alert ("That is the right answer!")}
else {alert ("No - try again")}
}
</script>

<!-- End Of JavaScript -->   
   
   
   
<body dir="rtl" >
<div>
    <% if ((Session["Check_User"] == "true") || (Session["Check_Admin"] == "true"))
       { %>
      
       <%}
       else
    { %>
    <p align="center">
    <%
        Response.Redirect("404.htm");%>
   
    <%} %></p>
    
    </div>
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
שאלון  
</h3>
<br />
  
  <center>                         

  
<form name = "myform">
<p>
? מהו משקלו הממוצע של בולדוג צרפתי <br/>

 כ-15 ק"ג <input type = "radio" name = "rad1" onclick = "getAnswer1('1a')"/>
 כ-21 ק"ג <input type = "radio" name = "rad1" onclick = "getAnswer1('1b')"/>
 כ-11 ק"ג <input type = "radio" name = "rad1" onclick = "getAnswer1('1c')"/>
 כ-25 ק"ג <input type = "radio" name = "rad1" onclick = "getAnswer1('1d')"/>
<br/><br/>
<br />
  מהו טווח הצבעים של רואה גרמני?  <br>

משחור לחום <input type = "radio" name = "rad2" onclick = "getAnswer2('1a')"/>
משחור ללבן <input type = "radio" name = "rad2" onclick = "getAnswer2('1b')"/>
משחור לירוק <input type = "radio" name = "rad2" onclick = "getAnswer2('1c')"/>
משחור כהה לשחור בהיר <input type = "radio" name = "rad2" onclick = "getAnswer2('1d')"/>
<br/><br/>
<br />
מהו משקלו של רואה גרמני? <br/>

נע סביב ה40-50 ק"ג <input type = "radio" name = "rad2" onclick = "getAnswer3('1a')"/>
נע סביב ה30-40 ק"ג <input type = "radio" name = "rad2" onclick = "getAnswer3('1b')"/>
נע סביב ה20-35 ק"ג <input type = "radio" name = "rad2" onclick = "getAnswer3('1c')"/>
נע סביב ה45-55 ק"ג <input type = "radio" name = "rad2" onclick = "getAnswer3('1d')"/>
<br/><br/>
<br />
 ? באיזה שנה הוכר הביגל כ-גזע <br>

ב-1873 <input type = "radio" name = "rad2" onclick = "getAnswer4('1a')"/>
ב-1878 <input type = "radio" name = "rad2" onclick = "getAnswer4('1b')"/>
ב-ב-1973 <input type = "radio" name = "rad2" onclick = "getAnswer4('1c')"/>
ב-2015 <input type = "radio" name = "rad2" onclick = "getAnswer4('1d')"/>
<br/><br/>
<br />
 ? מהו המשקל שעליו מגיע אקיטה אינו <br/>

35-40 ק"ג <input type = "radio" name = "rad2" onclick = "getAnswer5('1a')"/>
25-20 ק"ג <input type = "radio" name = "rad2" onclick = "getAnswer5('1b')"/>
15-20 ק"ג <input type = "radio" name = "rad2" onclick = "getAnswer5('1c')"/>
50-55 ק"ג <input type = "radio" name = "rad2" onclick = "getAnswer5('1d')"/>
<br />
<br />
<br />
 ? מהו הגובה עליו מגיע אקיטה אינו  <br/>

15-25 ס"מ <input type = "radio" name = "rad2" onclick = "getAnswer6('1a')"/>
65-70 ס"מ <input type = "radio" name = "rad2" onclick = "getAnswer6('1b')"/>
45-50 ס"מ <input type = "radio" name = "rad2" onclick = "getAnswer6('1c')"/>
75-85 ס"מ <input type = "radio" name = "rad2" onclick = "getAnswer6('1d')"/>
<br />
<br />
<br />
 ? באיזה מדינה פותח גזע הדוברמן <br/>

בבלגיה  <input type = "radio" name = "rad2" onclick = "getAnswer7('1a')"/>
בישראל  <input type = "radio" name = "rad2" onclick = "getAnswer7('1b')"/>
בצרפת  <input type = "radio" name = "rad2" onclick = "getAnswer7('1c')"/>
בגרמניה  <input type = "radio" name = "rad2" onclick = "getAnswer7('1d')"/>
<br/><br/>
<br />
 ? מהיכן מגיע השנאוצר  <br/>

מבלגיה  <input type = "radio" name = "rad2" onclick = "getAnswer7('1a')"/>
מישראל  <input type = "radio" name = "rad2" onclick = "getAnswer7('1b')"/>
מצרפת  <input type = "radio" name = "rad2" onclick = "getAnswer7('1c')"/>
מגרמניה  <input type = "radio" name = "rad2" onclick = "getAnswer7('1d')"/>
<br/><br/>
<br />
</p>
</form>

</center>
    

  
</td>
</tr>
</table>
</center>
</div>
</body>
</html>
