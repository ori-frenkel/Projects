<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Akita.aspx.cs" Inherits="AllDogsInfoAspx_Akita" %>

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
    	 text-align: center;  */ אפשר לעשות center/Justify
    }
     h4
    {
    	color: white;
    	font-size: 20px;
    	 text-align: center; */ אפשר לעשות center/Justify
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


   </style>   <script type="text/javascript">
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
                }    </script>  
<body dir="rtl">
    <form id="form1" runat="server">
    <div>
    <center>
    <table width="90%">

    <tr >
    <td colspan="3" bgcolor="#E6E6FA" >
     
       <a href="../HTMLPageoldone.htm"><img src = "../IMG/dog1.png" width="400" height="200"  title="דף הבית" /></a>
    
    </td>
    
    
    </tr>
    <tr >

    <td bgcolor="#006600" width="10%" >

 <a href="login.htm"><button>התחבר</button></a>

    </td>
    <td bgcolor="#006600" width="10%" >

    <a href="Registertable.htm"><button>הרשם</button></a>

    </td>
    <td bgcolor="#006600" width="70%" >

    </td>
    
    
    </tr>
    <tr >
    <td colspan="2" bgcolor="#4CAF50">
    <a href="../Index.htm"><button>דף הבית</button></a>
      <br />
   <a href="../queiz1.htm"><button>queiz</button></a>
   <br />
   <a href="NewFrBulldog.htm"><button>בולדוג צרפתי</button></a>
  <br />
   <a href="GermanShepherd.htm"><button>רואה גרמני</button></a>
   <br />
    <a href="Pug.htm"><button>פג סיני</button></a>
    <br />
     <a href="SiberianHusky.htm"><button>האסקי סיבירי</button></a>
     <br />
      <a href="Schnauzer.htm"><button>שנאוצר</button></a>
      <br />
      <a href="DobermanPinscher.htm"><button>דוברמן </button></a>
      <br />
      <a href="Akita.htm"><button>אקיטה אינו</button></a>
      <br />
      <a href="Beagle.htm"><button>ביגל</button></a>
      <br />
      <a href="GoldenRetriever.htm"><button>גולדן רטריבר</button></a>
      <br />
      <a href="JackRussellTerrier.htm"><button>ג'ק ראסל טרייר</button></a>
      <br />
      <a href="Dalmatian.htm"><button>דלמטי</button></a>
      <br />
      <a href="Rottweiler.htm"><button>רוטוויילר</button></a>
      
      
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
    </div>
    </form>
</body>
</html>
