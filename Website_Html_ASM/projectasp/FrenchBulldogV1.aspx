<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FrenchBulldogV1.aspx.cs" Inherits="FrenchBulldogV1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
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

                pic[0] = "AllDogsInfo/GermanShepherdMain.jpg";
                pic[1] = "AllDogsInfo/GermanShepherd1.jpg";
                pic[2] = "AllDogsInfo/GermanShepherd2.jpg";
                pic[3] = "AllDogsInfo/GermanShepherd3.jpg";
                pic[4] = "AllDogsInfo/GermanShepherd4.jpg";
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
        Response.Redirect("404.htm");%>
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

<a href="Index.htm"><img src="IMG/img1.png" alt="Mountain View" style="width:304px;height:228px;border-radius:50%;" title="דף הבית"></a>


       <a href="Index.htm"><img class="pos-abs img-responsive2" src = "IMG/dog1.png" width="400" height="200"  title="דף הבית" /></a>

         
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
    <p align="center">
    <%
        Response.Redirect("404.htm");%>
    שלום<br />
    אתה לא מחובר לכן אתה אין לך הרשאה לצפות בזה<br />
    <a href="login.htm">כניסה למשתמש קיים</a><br />
    <a href="RegisterTemp.htm">להרשמה בשם משתמש חדש</a>
    <a href="seasionlogin.aspx">התחבר כאדמין</a>
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
<a href="Index.aspx"><button>דף הבית</button></a>
      <br />
 <a href="queiz.aspx"><button>queiz</button></a>
 <br />
  <a href="AllDogsInfoAspx/FrenchBulldogV1.aspx"><button class="active">בולדוג צרפתי</button></a>
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
<table width="100%">
<tr >

<td rowspan="2"></td>
<h3>
רועה גרמני  
</h3>
</td>
 <td  width="80%">                        
  <h1>מבוא:</h1>
  
<p class="ex1">
הרועה גרמני (German Shepherd) הינו אחד הגזעים הפופולאריים ביותר בארץ ובעולם. גזע זה ניחן באינטליגנציה גבוהה מאוד, קל נורא לאילוף ונחשב לאחד מכלבי העבודה הטובים והיעילים ביותר. לצד חוכמתו הרבה בה ניחן, הרועה גרמני הינו גזע ידידותי, מגונן, חם ואוהב את משפחתו אם כי פחות ידידותי כלפי זרים.
<br><br>
גזע זה פותח על ידי קפטן מקס וון סטפאניטץ אשר שם למטרה פיתוח כלב רועים שאין שני לו "תוצרת גרמניה". בתחילת דרכו שימש הרועה גרמני ככלב רועים וסייע לרועי הצאן ברעיית עדרם אך בשלב מאוחר יותר, עם התפשטות התיעוש בגרמניה, הוסב לביצוע עבודות שונות בחיק הצבא והמשטרה. כיום, גזע זה משמש ככלב נחייה לעיוורים, חילוץ, הצלה, רעייה, שמירה ועוד רבים.


</p>
</td>
<td>  <img src="AllDogsInfo/GermanShepherdMain.jpg" style="width: 150px; height: 150px; float:inherit;" id="pic" />
  <br /><br />
   <input type="button" value="הקודם" onclick="back_img()" style=" float:inherit; padding:10px">
   <input type="button" value="הבא" onclick="next_img()" style=" float:inherit; padding:10px">
   </td>
</tr>
<tr > 
<td  colspan="2">
<h1>
רועה גרמני - מקור הגזע והיסטוריה:
</h1>
<p class="ex1"> 
מקורו של הרועה הגרמני החל בתוכנית גידול שהחלה בסוף המאה ה19- בה הוכלאו מספר גזעים של כלבי רועים אירופיים על מנת לתפקד כשומרים על החוות באירופה מפני חיות הבר שארבו לצאן ולבקר, לאחר מספר הכלאות נולד הרועה הגרמני שדומה מאוד לרועה הגרמני של ימינו או בכינויו כלב זאב אשר נתבע לאחר שמספר אנשים מפוקפקים אילפו רועים גרמניים ללחימה או תקיפה ואופן תקיפתו האכזרית והחייתית מזכירה זאב.<br />
גזע זה נחשב כאחד מכלבי העבודה הטובים ביותר מפני שהוא לומד מהר את הפקודות וכך קל לאלפו למגוון תפקידים החל בתקיפה של מחבלים ועד מציאת נעדרים בהריסות.<br />
כיום הרועה הגרמני הוא כלב מועדף ברוב צבאות העולם.


</p>
<h1>רואה גרמני - נתונים ומאפיינים:</h1>
<p class="ex1">
צבעו נע <span style="color:black;font-weight:bold">משחור</span> <span style="color:brown;font-weight:bold">לחום</span> בכתמים על הגוף כל כלב צורה וצבע חום אחר (קיימים גם רועים לבקנים אבל הם מעטים במספר וצבעם מגיע בגלל מוטציה בגנים).<br />
משקל: נע סביב ה45-55 ק"ג <br />
גובה: 55-66 ס"מ <br />
אפיון מיוחד: זנב ארוך ומלא.<br />
אופי: הרועה הגרמני בטוח מאוד בעצמו, אמיץ, אוהב מאוד בני אדם, מאוד סקרן לגבי הסביבה וכמובן לאנשים שסובבים אותו שאותם הוא מחשיב לחלק מהלהקה. <br />
הרועה הגרמני מאוד אנרגטי ואוהב לרוץ, אבל כשצריך הרועה הגרמני שמבנהו שרירי, יכול לתקוף אדם ממוצע ולהשבית אותו ע"י נשיכה מאוד כואבת.

</div>
</p>
</td >
<td>  </td>
</tr>
  
  </div>
</table>
</td>
</tr>
</table>
</div>
</body>
</html>
