<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DalmatianV1.aspx.cs" Inherits="AllDogsInfoAspx_DalmatianV1" %>

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

                pic[0] = "Dalmatian/Dalmatian1.jpg";
                pic[1] = "Dalmatian/Dalmatian2.jpg";
                pic[2] = "Dalmatian/Dalmatian3.jpg";
                pic[3] = "Dalmatian/Dalmatian4.jpg";
                pic[4] = "Dalmatian/Dalmatian.jpg";
                
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
    <a href="../Logout.aspx" class="white">התנתק</a></button>

</td>
    
    
</tr>
<tr >
<td colspan="2" bgcolor="#4CAF50">
<a href="../Index.aspx"><button >דף הבית</button></a>
      <br />
 <a href="../QuizV1.aspx"><button>Quiz</button></a>
 <br />
  <a href="FrenchBulldogV1.aspx"><button>בולדוג צרפתי</button></a>
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
      <a href="DalmatianV1.aspx"><button class="active">דלמטי</button></a>
      <br />
      <a href="RottweilerV1.aspx"><button>רוטוויילר</button></a>
      
      
</td>
<td width="70%">
<table width="100%">
<tr >

<td rowspan="2"></td>
<h3>
דלמטי    
</h3>
</td>
 <td  width="80%">                        
  <h1>מבוא:</h1>
  
<p class="ex1">
הגזע המנוקד היחידי בעולם. הכלב הדלמטי מאד חכם, מהיר, אקטיבי ובעל סיבולת גבוהה.<br /> 
ל"כלב הכרכרות" מסורת ארוכת ימים המבוססת על חריצות ועבודה קשה, בשילוב עם אופיו הרגיש והנאמן, הוא מתאים למשפחה, שמירה, מופעים ועוד.<br />
מזוהה בארה"ב ככלב מכבי אש, לדלמטי מאפיינים הדומים לשל סוסים, שכן הוא מאד מהיר, זקוק לפעילות פיזית רבה ביומיום וידוע בעצמאותו.


</p>
</td>
<td>  <img src="Dalmatian/Dalmatian.jpg" style="width: 150px; height: 150px; float:inherit;" id="pic" />
  <br /><br />
   <input type="button" value="הקודם" onclick="back_img()" style=" float:inherit; padding:10px">
   <input type="button" value="הבא" onclick="next_img()" style=" float:inherit; padding:10px">
   </td>
</tr>
<tr > 
<td  colspan="2">
<h1>
דלמטי - מקור הגזע והיסטוריה:
</h1>
<p class="ex1">
במשך שנים רבות מתנהלים ויכוחים בנוגע למוצאו של הדלמטי.<br /> בניגוד לדעה הרווחת, אין כל הוכחה לכך שהמנוקד הגיע מדלמטיה.<br />
ציורים של כלבים מנוקדים הרצים ליד כרכרות נמצאים בקברים מצרים עתיקים. כמו כן יצירות אומנות מ-1360 הכוללות כלבים מנוקדים יושבות בכנסיית סנטה מריה שבאיטליה.<br />
הדלמטים שימשו בין היתר כלבי ציד, גישוש, מלחמה ואף שמירה על גבול דלמטיה- קרואטיה.<br /> תפקידו העיקרי של המנוקד היה לרוץ לצד כרכרות ,מכאן הזיקה והדמיון לסוסים. אם יש לכם בגינה יותר משני כלבים דלמטיים יש שיגידו שיש לכם חוות סוסים קטנה.

</p>
<h1>אילוף דלמטי  :</h1>
<p class="ex1"> 
הדלמטי כלב אינטליגנט ועל כן סך הכול קל לאילוף. אך חשוב לזכור שכלב עם עודף אנרגיה דורש עודף אנרגיה ובמינון הנכון של יציאות לריצה, פעילות ספורטיבית ומשחקים , יכול הדלמטי להגיע לרמות הגבוהות ביותר של נאמנות וציות.<br />


</p>
<h1>טיפוח דלמטי </h1>
<p class="ex1">
ככל גזע, הדלמטי תמיד משיר את פרוותו אך פעמיים בשנה הנשירה ניכרת ביותר וחובה להברישו לפחות פעמיים שלוש בשבוע.<br />
כלבים דלמטיים מאד נקיים, ריחם אינו חזק כשל כלבים אחרים ורובם אפילו נמנעים משלוליות ובוץ ברחוב, על כן צריך לקלח אותם רק כשהמצב הכרחי.


</p>
<h1>דלמטי - נתונים ומאפיינים:</h1>
<p class="ex1">
דלמטים נועדו לרוץ על יד כרכרות סוסים, לכן הסיבולת והאנרגיה שלהם היא אינסופית.<br />
הם לא אוהבים לשכב כל היום, לנוח ולא לעשות כלום, הדלמטים מאד מאושרים, אוהבים לשחק, עדינים ונאמנים.<br /> המנוקד זקוק לחברה אנושית, כשלבד נעשה מדוכא, לכן עדיף להחזיקו בבית עם משפחה מאשר בחצר גדולה ומבודדת. הדלמטי כלב נמרץ חזק מאד שלעתים לא שולט בכוחו, לכן כשמשחק עם ילדים או כלבים אחרים, רצוי שזה יהיה תחת השגחת הבעלים.<br />
פרוות הדלמטי לבנה עם נקודות לרוב בצבע <span style="color:black;font-weight:bold">שחור</span> אך לעתים <span style="color:brown;font-weight:bold">חום</span>, <span style="color:#FFA500;font-weight:bold">צהוב כהה</span> <span style="color:blue;font-weight:bold">וכחול כהה</span>.<br />
גובה הדלמטי מגיע ל50 עד 60 ס"מ (נקבה 50 עד 55) ומשקלו לכ25 ק"ג.


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

