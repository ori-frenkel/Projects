<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DobermanPinscherV1.aspx.cs" Inherits="AllDogsInfoAspx_DobermanPinscherV1" %>

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

                pic[0] = "DobermanPinscher/Doberman1.jpg";
                pic[1] = "DobermanPinscher/Doberman2.jpg";
                pic[2] = "DobermanPinscher/Doberman3.jpg";
                pic[3] = "DobermanPinscher/Doberman4.jpg";
                pic[4] = "DobermanPinscher/Doberman.jpg";
                
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
    שלום<br />
    אתה לא מחובר לכן אתה אין לך הרשאה לצפות בזה<br />
    <a href="login.htm">כניסה למשתמש קיים</a><br />
    <a href="RegisterTemp.htm">להרשמה בשם משתמש חדש</a>
    <a href="seasionlogin.aspx">התחבר כאדמין</a>
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
<a href="../Index.aspx"><button>דף הבית</button></a>
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
      <a href="DobermanPinscherV1.aspx"><button class="active">דוברמן </button></a>
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
דוברמן    
</h3>
</td>
 <td  width="80%">                        
  <h1>מבוא:</h1>
  
<p class="ex1">
דוברמן פינצ'ר או בקיצור- דוברמן, הוא גזע של כלב ביתי נפוץ ביותר והוא ידוע כידידותי, אינטליגנט ונאמן ביותר. למרות שבעבר היה מוכר ככלב שמירה וכלב משטרה, כיום הדוברמן כבר לא עוסק במקצועות אלו. <br />מכוני רבייה מקצועיים "הרגיעו" את המזג התוקפני שבעבר היה מקושר עם הדוברמן, והגזע המודרני נחשב אידיאלי ביותר לחברה וחיי משפחה.<br />



</p>
</td>
<td>  <img src="DobermanPinscher/Doberman3.jpg" style="width: 150px; height: 150px; float:inherit;" id="pic" />
  <br /><br />
   <input type="button" value="הקודם" onclick="back_img()" style=" float:inherit; padding:10px">
   <input type="button" value="הבא" onclick="next_img()" style=" float:inherit; padding:10px">
   </td>
</tr>
<tr > 
<td  colspan="2">
<h1>
דוברמן - מקור הגזע והיסטוריה:
</h1>
<p class="ex1">
פותח בגרמניה בשנת 1860, לפינצ'ר דוברמן ככל הנראה מקורות מפינצ'ר גרמני, רוטוויילר, גרייהאונד וטרייר ממנצ'סטר, וכל אלו יצרו את הגזע החלקלק והמאוד חכם. <br />
לואיס דוברמן, שהיה גובה מסים בזמנו, נאלץ מתוקף התפקיד להסתובב באזורים שורצי שודדים ונבלים. נוכח העובדה שלדוברמן היה צורך בשומר ראש, הוא פיתח גזע שיוכל להתמודד עם מצבים מסוכנים. <br />
לאחר שנקרא הכלב על שמו, הוא הפך להיט בתצוגה בשנת 1876.
</p>
<h1>אילוף דוברמן :</h1>
<p class="ex1"> 
קל מאוד לאילוף, הדוברמן ממושמע מאוד ותמיד רוצה ללמוד. <br />
על הבעלים להתמיד באימונים ולהציב חוקים וגבולות ברורים לגבי מה מותר ומה אסור. <br />
תוך כדי האילוף, יש לדאוג לתת לדובי לשחרר אנרגיות, לרוץ ולשחק הרבה. <br />
אין צורך ללמד את הדובי לשמור כיון שהוא כלב שמירה מלידה וזהו אינסטינקט טבעי עבורו.<br /> יש להתמיד ולשמור על קו ישר כי במקרים אחרים, הדוברמן עלול להיות קצת חוצפן ולדרוש יותר מדי.<br />



</p>
<h1>טיפוח הדוברמן </h1>
<p class="ex1"> 
קל מאוד לטיפוח. יש לסרק לעתים את הפרווה החלקה והדקה ולרחוץ אך ורק במידת הצורך ולא לעתים קבועות.<br /> הפינצ'ר דוברמן משיר את פרוותו בצורה ממוצעת.<br />

</p>
<h1>דוברמן - נתונים ומאפיינים:</h1>
<p class="ex1">
אלגנטי, חזק וחכם מאוד, לדוברמן מבנה גוף בריא וראש מחודד ולובש כמעט את כל הצבעים.<br /> קל מאוד לאילוף, הדוברמן נחוש בדעתו, אסרטיבי וחסר פחד, אך עם זאת הוא לא מרושע כלל.<br /> הפינצ'ר דובי מאוד אוהב ונאמן למשפחתו ורוב הזמן מנסה להיות קרוב פיזית אל בני המשפחה.<br /> לדובים נוצר מוניטין של כלב אגרסיבי ומרושע וזהו כלל לא העניין, הדוברמנים מאוד מתוקים ויגנו על בעליהם בכל מחיר. <br />
גובהו של הגזע נע בין 66 ל-71 ס"מ (נקבה 61-66) ומשקלו נע בין 30 ל-40 ק"ג.<br />
תוחלת חיים:	10-12
<br />
תיאור:פרווה קצרה בדרך כלל בגווני <span style="color:black;font-weight:bold">שחור</span> <span style="color:brown;font-weight:bold">וחום</span>. לעתים גוני <span style="color:brown;font-weight:bold">חום</span>, <span style="color:blue;font-weight:bold">כחלכל</span>-<span style="color:brown;font-weight:bold">אפרפר</span> 



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

