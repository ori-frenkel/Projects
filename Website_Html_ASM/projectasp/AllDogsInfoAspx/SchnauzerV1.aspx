<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SchnauzerV1.aspx.cs" Inherits="AllDogsInfoAspx_SchnauzerV1" %>

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

                pic[0] = "Schnauzer/Schnauzer1.jpg";
                pic[1] = "Schnauzer/Schnauzer2.jpg";
                pic[2] = "Schnauzer/Schnauzer3.jpg";
                pic[3] = "Schnauzer/Schnauzer4.jpg";
                pic[4] = "Schnauzer/Schnauzer.jpg";
                
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
<a href="../Index.aspx"><button>דף הבית</button></a>
      <br />
 <a href="../QuizV1.aspx"><button>QuizV1.aspx</button></a>
 <br />
  <a href="FrenchBulldogV1.aspx"><button>בולדוג צרפתי</button></a>
  <br />
   <a href="../GermanShepherdV1.aspx"><button>רואה גרמני</button></a>
   <br />
    <a href="Pug.aspx"><button>פג סיני</button></a>
    <br />
     <a href="SiberianHuskyV1.aspx"><button>האסקי סיבירי</button></a>
     <br />
      <a href="SchnauzerV1.aspx"><button class="active">שנאוצר</button></a>
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
<tr>

<td rowspan="2"></td>
<h3>
שנאוצר   
</h3>
</td>
 <td  width="80%">                        
  <h1>מבוא:</h1>
  
<p class="ex1">
הגזע הבא מזכיר לנו סבא, השנאוצר הוא כלב בעל זקן ושפם והוא נראה כמו זקן שמהרהר לעצמו.<br />
השנאוצר הוא כלב חביב במראהו. הוא אחד הגזעים הפולארים בעולם כולו.<br />
הסיבות הן: המראה המצחיק של סבא, האהבה הגדולה לבעלים והאינטליגנציה הגבוהה.<br />
פעמים רבות שתסתובבו עם גור שנאוצר ותספרו על גילו, אנשים יחשבו שאתם טועים וכנראה גיל השנאוצר מבוגר בהרבה מהגיל שאתם סיפרתם.


</p>
</td>
<td>  <img src="Schnauzer/Schnauzer.jpg" style="width: 150px; height: 150px; float:inherit;" id="pic" />
  <br /><br />
   <input type="button" value="הקודם" onclick="back_img()" style=" float:inherit; padding:10px"/>
   <input type="button" value="הבא" onclick="next_img()" style=" float:inherit; padding:10px"/>
   </td>

<tr > 
<td  colspan="2">
<h1>
שנאוצר - מקור הגזע והיסטוריה:
</h1>
<p class="ex1">
השנאוצר מגיע מגרמניה, הוא בעל 3 תתי גזעים: השנאוצר הענק, הרגיל והננסי.<br />
השם שנאוצר מגיע מהשפה הגרמנית והפירוש הוא פה ואף של הכלב (כנראה מהמראה המוזר של הזקן והשפם).<br />
השנאוצר הגיעה מהכלאה של פינצ'ר עם עוד כמה גזעים.<br /> תקופה ארוכה התייחסו אל השנאוצר כאל פינצ'ר. השנאוצר הוא כלב בעל מגוון רב של יכולות: כלב ציד למכרסמים ציפורים, 
כלב שמירה, בייביסיטר וכלב לוויה. בקיצור השנאוצר הוא כלב עבודה המושלם.


</p>
<h1>אילוף שנאוצר:</h1>
<p class="ex1"> 
כיף וקל לאלף את השנאוצר. הוא קולט מהר מאוד פקודה חדשה. מספיק כמה חזרות והשנאוצר יודע פקודה חדשה.<br /> יצר הציד של השנאוצר גבוה ובנוסף הוא אוהב לרצות את בעליו, התכונות המושלמות לכלב עבודה טוב. השנאוצר נולד עם יכולת השמירה, אין צורך ללמד אותו לנשוך זרים שבאים לתקוף זה קורה לבד זה ב"זיכרון" של השנאוצר.<br />
השנאוצר הוא כלב עבודה מועדף בצבא ובמשטרה, בעיקר במשימות החיפוש ובשמירה.<br />
חסרון יחיד בשנאוצר הוא: אסור להביא חיית מחמד נוספת כמו תוכי או אוגרים.<br /> 
השנאוצר לא מסתדר עם עוד חיות ומבחינתו הגיע טרף חדש לבית.


</p>
<h1>טיפוח השנאוצר</h1>
<p class="ex1"> 
לרוב השנאוצרים יש פרווה ארוכה וחובה להבריש אותה כמה פעמים בשבוע. השנאוצר חי למען הבעלים,לכן חובה לשחק ולהעניק לשנאוצר מנה של אהבה ביום. <br />
חוסר בחיבה יגרום לירידה בשמחת החיים של השנאוצר.<br />
אפשר לקחת את השנאוצר למספרת כלבים בקיץ החם של ישראל. <br />
מבחינת תספורות - לא לספר בבית, במספרות הכלבים ישנם כלים מיוחדים ועובדים מיומנים.<br />
אנשים רבים מטפחים את הזקן והשפם של השנאוצר.



</p>
<h1>שנאוצר - נתונים ומאפיינים:</h1>
<p class="ex1">
השנאוצר בעל זקן ושפם מאפיין ראשי לגזע. הצבעים: לבן, <span style="color:black;font-weight:bold">שחור</span>, <span style="color:brown;font-weight:bold">חום</span> או <span style="color:gray;font-weight:bold">אפור</span>. <br />
הפרווה ארוכה במיוחד באזור הפנים. אוזניים גדולות ואף ארוך.<br />
משקל:5-45 ננסי עד ענק.<br />
גובה:30-70 ס"מ ננסי עד ענק.<br />

</p>
</td >
<td>  </td>
</tr>
</tr>

</table>
</td>
</tr>
</table>
</div>
</body>
</html>

