﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="queiz.aspx.cs" Inherits="queiz" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<style type ="text/css" >
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
p.ex1 {
    padding: 20px;
}
    p.ex2 {
    padding: 20px;
    color: black;
    font-size: 20px;
}
/*------------------------------------------*/


   </style>   <script type = "text/javascript">


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
<body dir="rtl" >
<div>
    <% if (Session["Check_User"] == "true")
       { %>
       <p align="center">
       ברוך הבא משתמש<%  Response.Write(Session["User"]);%>
       <br />
           
           
       </p>
       <%}
       else
    { %>
    <p align="center">
    <%
    Response.Redirect("NotOnline.aspx");%>
    שלום<br />
    אתה לא מחובר לכן אתה אין לך הרשאה לצפות בזה<br />
    <a href="login.htm">כניסה למשתמש קיים</a><br />
    <a href="RegisterTemp.htm">להרשמה בשם משתמש חדש</a>
    <a href="seasionlogin.aspx">התחבר כאדמין</a>
    <%} %></p>
    
    </div>
<center>
<table width="90%">

<tr >
<td colspan="3" bgcolor="#E6E6FA" >
    
       <a href="Index.htm"><img src = "IMG/dog1.png" width="400" height="200"  title="דף הבית" /></a>
    
</td>
    
    
</tr>
<tr >

<td bgcolor="#006600" width="10%" >

 <a href="login.htm"><button>התחבר</button></a>

</td>
<td bgcolor="#006600" width="10%" >

 <a href="RegisterTemp.htm"><button>הרשם</button></a>

</td>
<td bgcolor="#006600" width="70%" >

</td>
    
    
</tr>
<tr>
<td colspan="2" bgcolor="#4CAF50">
<a href="Index.htm"><button>דף הבית</button></a>
      <br />
 <a href="queiz1.htm"><button>queiz</button></a>
 <br />
  <a href="AllDogsInfo/NewFrBulldog.htm"><button>בולדוג צרפתי</button></a>
  <br />
   <a href="AllDogsInfo/GermanShepherd.htm"><button>רואה גרמני</button></a>
   <br />
    <a href="AllDogsInfo/Pug.htm"><button>פג סיני</button></a>
    <br />
     <a href="AllDogsInfo/SiberianHuskyV1.htm"><button>האסקי סיבירי</button></a>
     <br />
      <a href="AllDogsInfo/Schnauzer.htm"><button>שנאוצר</button></a>
      <br />
      <a href="AllDogsInfo/DobermanPinscher.htm"><button>דוברמן </button></a>
      <br />
      <a href="AllDogsInfo/Akita.htm"><button>אקיטה אינו</button></a>
      <br />
      <a href="AllDogsInfo/Beagle.htm"><button>ביגל</button></a>
      <br />
      <a href="AllDogsInfo/GoldenRetriever.htm"><button>גולדן רטריבר</button></a>
      <br />
      <a href="AllDogsInfo/JackRussellTerrier.htm"><button>ג'ק ראסל טרייר</button></a>
      <br />
      <a href="AllDogsInfo/Dalmatian.htm"><button>דלמטי</button></a>
      <br />
      <a href="AllDogsInfo/Rottweiler.htm"><button>רוטוויילר</button></a>
      
      
</td>
<td width="70%">
<h3>
שאלון 
</h3>
<br />
  
                           
  
  <center>

<form name = "myform">

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

</form>

 </center>
</td> 
</tr>

</table>
</center>
</body>
</html>
