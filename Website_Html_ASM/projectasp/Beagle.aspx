<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Beagle.aspx.cs" Inherits="Beagle" %>

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
    font-family: sans-serif;
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
    	 font-family: sans-serif;
    }
     h4
    {
    	color: white;
    	font-size: 20px;
    	 text-align: center; 
    	 font-family: sans-serif;
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
    		background-color: #f44336;
    	}
    	.white
    	{
    		color: white;
    		text-decoration:none;
    	}
/*------------------------------------------*/


   </style>   <script type="text/javascript">
                var pic=new Array();

                pic[0] = "AllDogsInfoAspx/Beagle/Beagle.jpg";
                pic[1] = "AllDogsInfoAspx/Beagle/Beagle1.jpg";
                pic[2] = "AllDogsInfoAspx/Beagle/Beagle2.jpg";
                pic[3] = "AllDogsInfoAspx/Beagle/Beagle3.jpg";
                pic[4] = "AllDogsInfoAspx/Beagle/Beagle4.jpg";
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
                }    </script>  
<body dir="rtl">
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
    <form id="form1" runat="server">
    <div>
    <center>
<table width="90%">

<tr >
<td colspan="3" bgcolor="#E6E6FA" >
     <!--  <img src="dog1.png" width="400" height="200" /> -->
       <a href="../HTMLPageoldone.htm"><img src = "IMG/dog1.png" width="400" height="200"  title="דף הבית" /></a>
  
</td>
    
    
</tr>
<tr >

<td bgcolor="#006600" width="10%" >

 <a href="LoginV1.aspx"><button>התחבר</button></a>

</td>
<td bgcolor="#006600" width="10%" >

 <a href="RegisterV1.aspx"><button>הרשם</button></a>

</td>
<td bgcolor="#006600" width="70%" >
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
<a href="Index.aspx"><button class="active">דף הבית</button></a>
      <br />
 <a href="queiz.aspx"><button>queiz</button></a>
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
<table width="100%">
<tr >

<td rowspan="2"></td>
<h3>
ביגל    
</h3>
</td>
 <td  width="80%">                        
  <h1>מבוא:</h1>
  
<p class="ex1">
כלב ציד בגודל קטן עד בינוני, ידוע באופיו הרגוע, באוזניו הרכות ובמחסור בעיות הבריאות התורשתיות שפוקדות כלבים רבים בעולם. לכלב הביגל חוש ריח מפותח ביותר וכלבים מסוג זה שימשו ועדיין משמשים ככלבי ציד שמטרתם הייתה לגשש אחר ארנבים, סנאים וחיות אחרות.
בימינו הביגלים משמשים יותר בתור כלבי גישוש וחיפוש עבור משטרה וכדומה

</p>
</td>
<td>  <img src="AllDogsInfoAspx/Beagle/Beagle.jpg" style="width: 150px; height: 150px; float:inherit;" id="pic" />
  <br /><br />
   <input type="button" value="הקודם" onclick="back_img()" style=" float:inherit; padding:10px">
   <input type="button" value="הבא" onclick="next_img()" style=" float:inherit; padding:10px">
   </td>
</tr>
<tr > 
<td  colspan="2">
<h1>
ביגל - מקור הגזע והיסטוריה:
</h1>
<p class="ex1">
העדות הממשית הראשונה לקיום הגזע, היא משנת 1475.<br /> מקור שמו של הביגל אינו ברור, אך משוער כי הוא במילה beag ('קטן' בשפה הקלטית) או מהמילה beuguel (קולני, פירוש מילולי פתוח-גרון).<br /> הביגל הוכר כגזע ב-1873, וב-1890 הוקם בבריטניה מועדון מגדלי הביגל הראשון.<br /> הגזע הגיע לאמריקה הצפונית עם המתיישבים הראשונים, ושם פותח תת-זן קטן יותר.


</p>
<h1>אילוף ביגל :</h1>
<p class="ex1"> 
תפקידו של הביגל מעיקרו הוא להוות עזר לציידים, לבני אדם.<br /> בנוסף לרמת האינטליגנציה הגבוהה שלו, הוא סך הכל ניתן לאילוף אך יש לזכור שהביגל כלב נורא עקשן ודעתן, כך שחשוב לשמור על שיטת אילוף אחידה הכוללת שעות רבות של ספורט ולהראות לו בכל זמן נתון שאתה הוא ראש הלהקה, המנהיג. הביגל זקוק להרבה טיולים ותשומת לב על מנת שלא יסבול מחרדת נטישה.<br />



</p>
<h1>טיפוח ביגל </h1>
<p class="ex1">
את פרוותו הבינונית והקשיחה של הביגל קל לטפח. יש לסרק את הכלב לעתים קרובות במברשת קשיחה ולרחוץ אותו עם שמפו לכלבים אך ורק בשעת הצורך (לעתים רצוי להשתמש בשמפו יבש). חשוב לבדוק את אוזניו הרגישות של הביגל לעתים קרובות מלכלוכים וסימנים לדלקות שונות ויש לגזוז את ציפורניו אצל הווטרינר.<br /> הביגל משיר את פרוותו בצורה ממוצעת.<br />



</p>
<h1>ביגל - נתונים ומאפיינים:</h1>
<p class="ex1">
כלב מאושר ונאמן מאד. עדין, סקרן, אנרגטי ביותר, אמיץ ואינטליגנט, תמיד מנסה ללמוד ולעזור. הביגל ידידותי מאד לאנשים וכלבים אחרים אך לא מומלץ להשאירו לבד עם חיות אחרות.<br /> לביגל דעה משלו וחשוב להראות לו כל הזמן שאתם בעלי הבית ולא הוא.<br /> הביגל בגודל קטן עד בינוני, פרוותו בינונית וקשיחה, הוא יכול להגיע בכל מיני צבעים, רגליו חזקות, אוזניו ארוכות, נפולות ורכות במיוחד ועיניו הגדולות משדרות הבעה כמעט מתחננת. <br />
זכר בוגר מגיע לגובה של כ36 עד 41 ס"מ (נקבה 33- 38) ומשקלו כ10 עד 11 ק"ג (נקבה 9- 10).<br />
פרוותו קצרה בשילוב של כמה גוונים, קצה זנב לבן

</p>
</td >
<td>  </td>
</tr>
  
  
</table>
    </div>
    </form>
</body>
</html>
