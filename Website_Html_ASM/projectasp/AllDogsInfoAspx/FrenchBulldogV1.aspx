<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FrenchBulldogV1.aspx.cs" Inherits="AllDogsInfoAspx_FrenchBulldogV1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="icon" href="../IMG/img1.png" type="image/x-icon">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>

<style type ="text/css" >
    *, html {
    margin:0;
    padding:0;  
}
input[type="button"] {
/* text-decoration: none; */
/* display: inline-block; */
font-size: 16px;
margin: 9px 7px;
cursor: pointer;
background-color: #555555;
border: none;
/* border-radius: 50px; */
color: white;
}
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
   <script type="text/javascript">
                var pic=new Array();

                pic[0] = "FrenchBulldog/1.jpg";
                pic[1] = "FrenchBulldog/2.jpg";
                pic[2] = "FrenchBulldog/5.jpg";
                pic[3] = "FrenchBulldog/4.jpg";
                
                var num=0;
                function next_img()
                {
                  num++;
                  if (num>pic.length-1)
                      {num=0;}
                  document.getElementById("pic").src=pic[num];
                }
                function back_img()
                {
                  num--;
                  if (num < 0)
                      {num=pic.length-1;}
                  document.getElementById("pic").src=pic[num];
                }
   </script>  

<body dir="rtl" >
<div>
    <% if ((Session["Check_User"] == "true") || (Session["Check_Admin"] == "true"))
       { %>
      
       <%}
       else
       { %>
    <p align="center">
    <%
Response.Redirect("../404.htm");%>
   
    <%} %></p>
    
    </div>
<div class="wrapper"> 
<center>
<table width="100%">

<tr >
<td colspan="3" bgcolor="#E6E6FA" >

<a href="../Index.aspx"><img src="../IMG/img1.png" alt="Mountain View" style="width:304px;height:228px;border-radius:50%;" title="דף הבית"></a>
    

       <img class="pos-abs img-responsive2" src = "../IMG/dog1.png" width="400" height="200"  />

         
</td>
    
    
</tr>
<tr >

<td bgcolor="#006600" width="10%" >

 <a href="../LoginV1.aspx"><button>התחבר</button></a>

</td>
<td bgcolor="#006600" width="10%" >

 <a href="../RegisterV1.aspx"><button>הרשם</button></a>

</td>
<td bgcolor="#4CAF50" width="70%" >
<span>
  <% if (((Session["Check_Admin"] == "true")))
     { %>
      <a href="../AdminSearchFormV1.aspx"><button style="width:auto; height:auto">Control Pannel.aspx</button></a>
          
       <%}
     else
     { %>
    
    
    <%} %>
</span>
<span style="color:White">



   
    <% if ((Session["Check_User"] == "true"))
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
    <a href="../Logout.aspx" class="white">התנתק</a></button>

</td>
    
    
</tr>
<tr >
<td colspan="2" bgcolor="#4CAF50">
<a href="../Index.aspx"><button>דף הבית</button></a>
      <br />
 <a href="../QuizV1.aspx"><button>Quiz</button></a>
 <br />
  <a href="FrenchBulldogV1.aspx"><button class="active">בולדוג צרפתי</button></a>
  <br />
   <a href="../GermanShepherdV1.aspx"><button>רואה גרמני</button></a>
   <br />
    <a href="Pug.aspx"><button>פג סיני</button></a>
    <br />
     <a href="SiberianHuskyV1.aspx"><button>האסקי סיבירי</button></a>
     <br />
      <a href="SchnauzerV1.aspx"><button>שנאוצר</button></a>
      <br />
      <a href="DobermanPinscherV1.aspx"><button>דוברמן </button></a>
      <br />
      <a href="AkitaV1.aspx"><button>אקיטה אינו</button></a>
      <br />
      <a href="BeagleV1.aspx"><button>ביגל</button></a>
      <br />
      <a href="GoldenRetrieverV1.aspx"><button>גולדן רטריבר</button></a>
      <br />
      <a href="JackRussellTerrierV1.aspx"><button>ג'ק ראסל טרייר</button></a>
      <br />
      <a href="DalmatianV1.aspx"><button>דלמטי</button></a>
      <br />
      <a href="RottweilerV1.aspx"><button>רוטוויילר</button></a>
      
      
</td>
<td width="70%">
<table width="100%">
<tr >

<td rowspan="2"></td>
<h3>
בולדוג צרפתי  
</h3>
</td>
 <td  width="80%">                        
  <h1>מבוא:</h1>
  
<p class="ex1">

הבולדוג הצרפתי הוא גזע קטן וחברותי של כלבים, שעל אף שצרפת היא ארץ המוצא שלו, לאמריקאים ולבריטים הייתה יד רחבה בפיתוח הגזע הקומפקטי.<br /> הבולדוג הצרפתי או הפרנצ'י, ניחן באישיות כמעט ליצנית, כאשר הוא נהנה להשתטות ולהסב את מירב תשומת הלב שהוא יכול לקבל.<br /> למרות שהבולדוג מתחבב ומחבב פחות או יותר את כולם, הוא נקשר עמוקות בדרך כלל לאדם אחד בלבד.

</p>
</td>
<td>  <img src="FrenchBulldog/frenchpic.jpg" style="width: 150px; height: 150px; float:inherit;" id="pic" />
  <br /><br />
   <input type="button" value="הקודם" onclick="back_img()" style=" float:inherit; padding:10px">
   <input type="button" value="הבא" onclick="next_img()" style=" float:inherit; padding:10px">
   </td>
</tr>
<tr >
<td  colspan="2">
<h1>
בולדוג צרפתי - מקור הגזע והיסטוריה:
</h1>
<p class="ex1"> 
פותח לראשונה באנגליה כגרסה מיניאטורית של הבולדוג האנגלי וב1860, מרביע בולדוגים צרפתי ייבא מבריטניה מספר בולדוגים ועירב אותם עם טרייר צרפתי.<br /> הגזע החדש והמקסים הפך ללהיט בקהילת היצאניות בצרפת, שהעניקו לו את שמו, "הבולדוג הצרפתי".<br /> לאחר שהופץ הגזע החדש, התלהמו האנגלים על שמו בטענה שהבולדוג הינו פרי יצירתה של אנגליה ולא של צרפת ויתרה מזאת, הבולדוג הפך עם השנים לסמל בבריטניה.

</p>
<h1>בולדוג צרפתי - נתונים ומאפיינים:</h1>
<p class="ex1">
כלב נעים וקל לטיפול, מלא חיבה ואוהב לשחק, הבולדוג הצרפתי ניחן בקסם מצחיק ומעט מוזר, מסתדר בקלות עם זרים ובעלי חיים אחרים. גזע זה זקוק לחברה ולא יוכל לשרוד בלעדיה. הבולדוג הצרפתי זקוק להרבה תשומת לב ובעליו זקוק להרבה סבלנות ועקביות באילוף.<br /> זהו כלב שלומד לאט יחסית, אך בדרכים קלות שלא דורשות אפילו טון אגרסיבי.<br /> הצרפתי קטן מימדים ועגלגל עם אוזני עטלף עגולות, גובהו מגיע לממוצע של כ-30 ס"מ ומשקלו יכול להגיע לממוצע של כ-11 ק"ג.


</p>
</td >
<td>  </td>
</tr>
  
  
</table>
</td>
</tr>
</table>
</div>
</body>
</html>
