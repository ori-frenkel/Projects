<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AkitaV1.aspx.cs" Inherits="AllDogsInfoAspx_AkitaV1" %>

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

                pic[0] = "Akita/Akita.jpg";
                pic[1] = "Akita/Akita1.jpg";
                pic[2] = "Akita/Akita2.jpg";
                pic[3] = "Akita/Akita3.jpg";
                pic[4] = "Akita/Akita4.jpg";
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
      <a href="AkitaV1.aspx"><button class="active">אקיטה אינו</button></a>
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
אקיטה אינו    
</h3>
</td>
 <td  width="80%">                        
  <h1>מבוא:</h1>
  
<p class="ex1">
שלא כמו שאר גזעי הכלבים היפנים, האקיטה הוא גזע כלבים מקורי של יפן.<br /> אקיטה איננו גזע שהגיע עם המהגרים והוא לא תולדה של הכלאות כאלה ואחרות.<br /> ולראייה ניתן למצוא כתבים עתיקים 
ופסלים בדמותו של הכלב עוד במאה ה-8.
בגלל מראהו ונאמנותו של אקיטה, סיפורים רבים ואגדות המהללות את אומץ ליבו ונאמנותו הבלתי נגמרת של הכלב לבעלים.<br /> ובשנת 1931 הוכרז האקיטה כנכס לאומי ביפן.<br />

</p>
</td>
<td>  <img src="Akita/Akita.jpg" style="width: 150px; height: 150px; float:inherit;" id="pic" />
  <br /><br />
   <input type="button" value="הקודם" onclick="back_img()" style=" float:inherit; padding:10px"/>
   <input type="button" value="הבא" onclick="next_img()" style=" float:inherit; padding:10px"/>
   </td>
</tr>
<tr > 
<td  colspan="2">
<h1>
אקיטה אינו - מקור הגזע והיסטוריה:
</h1>
<p class="ex1">
האקיטה הוא כלב ציד יפני אשר היה מלווה את היפנים במסעות הציד ועוזר להם לגלות היכן מתחבאות החיות ע"י התחקות אחרי העכבות. האקיטה היה כלבו של שוגון שהיה ידוע כמנהיג אשר אוהב ודואג לעולם החי. שוגון היה הראשון שחוקק חוקים נגד התעללות בבעלי חיים וגם היה הראשון שפתח בתי מחסה לכלבים.<br /> בנוסף לשוגון ולקיסרי יפן היה הכלב מלווה האקיטה נזירים במסעות רוחניים ומגן עליהם מחיות הבר.<br />



</p>
<h1>אילוף אקיטה אינו :</h1>
<p class="ex1"> 
האקיטה הוא כלב נאמן וחכם מאוד קל ללמד אותו פקודות חדשות. מעבר ללימוד המהיר של פקודות חדשות, האקיטה יעשה הכל על מנת לרצות את בעליו, לרוב הוא יחכה למילה טובה או ליטוף מהבעלים וזה עבורו הפרס הגדול ביותר.<br />
אילוף האקיטה מתאים גם לילדים, הכלב אוהב מאוד את בעליו ללא קשר לגיל, לכן ילדים אשר רוצים להתנסות באילוף, יכולים לעשות זאת עם האקיטה.<br />
האקיטה הוא כלב ציד וכך יחסו לחיות קטנות כמו חתול ארנבות ועוד.<br /> על מנת שהאקיטה יגדל בנחת ולא ירדוף אחרי כלבים וחתולים אחרים, חובה לחנך אותו מגיל צעיר שלא ירדוף או יציק לשאר החיות בבית.



</p>
<h1>טיפוח אקיטה אינו </h1>
<p class="ex1">
הפרווה של האקיטה מלאה וצפופה, ללא סירוק יומי, פרוותו של האקיטה לא תראה טוב. מעבר לסירוק יש לדאוג לניקיון העיניים והאוזניים למניעת מחלות.

</p>
<h1>אקיטה אינו - נתונים ומאפיינים:</h1>
<p class="ex1">
האקיטה הוא כלב מרשים מכל הבחינות, מבנה גופו מרשים ואתלטי, ראשו גדול, אוזניו קטנות ומחודדות.<br /> זנבו של האקיטה ארוך ותמיד מסולסל. <br />
הפרווה מלאה וצפופה , וצבעי הפרווה נעים בין <span style="color:#835C3B;font-weight:bold">חום</span> ללבן, אבל ישנם גם כלבים עם צבע פרווה אחיד לרוב פרווה לבנה.<br />
גובה:65-70 ס"מ<br />
משקל: 35-40 ק"ג



</p>
</td>


</tr>
  
  
</table>
</td>
</tr>
</table>
</div>
</body>
</html>
