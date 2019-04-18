<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JackRussellTerrier.aspx.cs" Inherits="AllDogsInfoAspx_JackRussellTerrier" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<style type ="text/css" >
    table td, table td * {
    vertical-align: top;
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
body{padding:0;}
/*------------------------------------------*/


   </style>   <script type="text/javascript">
                var pic=new Array();

                pic[0] = "JackRussellTerrier/JackRussellTerrier.jpg";
                pic[1] = "JackRussellTerrier/JackRussellTerrier1.jpg";
                pic[2] = "JackRussellTerrier/JackRussellTerrier2.jpg";
                pic[3] = "JackRussellTerrier/JackRussellTerrier3.jpg";
                pic[4] = "JackRussellTerrier/JackRussellTerrier4.jpg";
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
     <!--  <img src="dog1.png" width="400" height="200" /> -->
       <a href="../HTMLPageoldone.htm"><img src = "../IMG/dog1.png" width="400" height="200"  title="דף הבית" /></a>
    
</td>
    
    
</tr>
<tr >

<td bgcolor="#006600" width="10%" >

 <a href="login.htm"><button>התחבר</button></a>

</td>
<td bgcolor="#006600" width="10%" >

 <a href="../register.htm"><button>הרשם</button></a>

</td>
<td bgcolor="#006600" width="70%" >

</td>
    
    
</tr>
<tr >
<td colspan="2" bgcolor="#4CAF50">
<a href="../HTMLPageoldone.htm"><button>דף הבית</button></a>
      <br />
 <a href="../queiz.htm"><button>queiz</button></a>
 <br />
  <a href="NewFrBulldog.htm"><button>בולדוג צרפתי</button></a>
  <br />
   <a href="register.htm"><button>רואה גרמני</button></a>
   <br />
    <a href="register.htm"><button>פג סיני</button></a>
    <br />
     <a href="register.htm"><button>האסקי סיבירי</button></a>
     <br />
      <a href="register.htm"><button>שנאוצר</button></a>
      <br />
      <a href="register.htm"><button>דוברמן </button></a>
      <br />
      <a href="register.htm"><button>אקיטה אינו</button></a>
      <br />
      <a href="register.htm"><button>ביגל</button></a>
      <br />
      <a href="register.htm"><button>גולדן רטריבר</button></a>
      <br />
      <a href="register.htm"><button>ג'ק ראסל טרייר</button></a>
      <br />
      <a href="register.htm"><button>דלמטי</button></a>
      <br />
      <a href="register.htm"><button>רוטוויילר</button></a>
      
      
</td>
<td width="70%">
<table width="100%">
<tr >

<td rowspan="2"></td>
<h3>
ג'ק ראסל טרייר    
</h3>
</td>
 <td  width="80%">                        
  <h1>מבוא:</h1>
  
<p class="ex1">
גזע כלבים קטנים, לבנים ברובם, בעלי פרווה משתנה מכלב לכלב. לג'ק ראסל היסטוריה בציד שועלים ושמו, שבעבר סימן את כל הטריירים הלבנים הקטנים, כיום שייך אקסקלוסיבית לגזע הספציפי והקשוח הזה. כלב אוהב, נמרץ, שמח ומסור, אוהב לשחק ועדיין אמיץ וקשוח. ג'ק ראסל טרייר או בקיצור- ג'ק, טוב עם ילדים אך חשוב שהילד לא יתגרה בו שכן אם הג'ק לא מרגיש בטוח במאה אחוז, הוא עלול להתגונן ולהתפרע.




</p>
</td>
<td>  <img src="JackRussellTerrier/JackRussellTerrier.jpg" style="width: 150px; height: 150px; float:inherit;" id="pic" />
  <br /><br />
   <input type="button" value="הקודם" onclick="back_img()" style=" float:inherit; padding:10px">
   <input type="button" value="הבא" onclick="next_img()" style=" float:inherit; padding:10px">
   </td>
</tr>
<tr > 
<td  colspan="2">
<h1>
ג'ק ראסל טרייר - מקור הגזע והיסטוריה:
</h1>
<p class="ex1">
הג'ק ראסל טרייר נקרא על שם הכומר ג'ון ראסל (1795-1883), שפיתח את הגזע, ובנוסף לפעילותו בכנסייה, עסק בציד.<br /> מטרתו של ג'ון ראסל הייתה ליצור כלב קטן ואסרטיבי, לצורך ציד שועלים.<br /> תהליך הפיתוח התרחש בדבונשייר (Devonshire) שבאנגליה במחצית השנייה של המאה ה-19. הכלב הקטן והלוחמני הזה שימש באותה תקופה באמת כעוזר לציד חיות קטנות ובעיקר שועלים, כאשר תפקידו העיקרי היה לחפור בורות מחוץ למערות השועלים ולטמון בהם פיתיונות.<br /> מרביעים שונים התלהבו ממוסר העבודה הגבוה של הג'קים והרביעו את הגזע עם כלבים שונים, מה שיצר כיום גזע מגוון ונרחב של טריירים. אף על פי שיש שני גזעים שנקראים לעתים קרובות "ג'ק ראסל", נהוג להבחין בין שני סוגים של הגזע: פארסון ראסל טרייר וג'ק ראסל טרייר.<br />


</p>
<h1>אילוף ג'ק ראסל טרייר :</h1>
<p class="ex1">
כלב צייתן ונוח לאילוף, הג'ק ראסל ידוע בכישוריו לבצע פעלולים ועל כך גזע זה מככב בתוכניות טלוויזיה וסרטים. חשוב להיות מנהיג עבור הכלב, שמא יפתח בעיות התנהגות כמו התפרעויות, נזק ונביחות בלתי פוסקות.<br /> ג'קים לא מחונכים שנותנים להם להפגין שליטה, עלולים לתקוף כלבים אחרים. על כן חובה להיות נוקשים, עקביים וקשוחים. כלבים אלו חופרים, מטפסים וקופצים, על כן לא רצוי לשחרר אותם מן הרצועה אלא אם הם מאולפים מאד.<br />




</p>
<h1>טיפוח ג'ק ראסל טרייר </h1>
<p class="ex1">
קל לטפח את כל סוגי הפרווה של הראסל. יש לסרק ולהבריש עם מברשת קשיחה כל הזמן ולרחוץ רק במידת הצורך.<br /> אם נשלח לתצוגות או תחרויות, יש לגלח את פרוותו במידה והיא מהסוג המדובלל או הקשיח. הג'ק ראסל משיר את פרוותו בצורה ממוצעת, אך יש יוצאי דופן, תלוי בסגנון הפרווה.<br />


</p>
<h1>ג'ק ראסל טרייר - נתונים ומאפיינים:</h1>
<p class="ex1">
כלב חכם, נמרץ ואוהב, הג'ק ראסל ידוע בתור אחד שאם תתנו לו אצבע, הוא ירצה את כל היד, על כן חשוב ביותר שבעלי הכלב יהיו המנהיגים שלו וילמדו אותו את מקומו. ג'ק שלא יקבל חוקים ברורים לגבי מה מותר ומה אסור, עלול לפתח בעיות התנהגות. לג'קים מוסר עבודה גבוה מאד והם עובדים על מנת לעבוד. גזע קל לאילוף, כל עוד האימונים נוקשים ועקביים. לג'קים יש אינסטינקט ציד מפותח מהרגיל, כך שיש להשגיח עליו ליד חיות קטנות וכלבים אחרים.<br /> הג'ק ראסל מגיע לגובה של כ-25 עד 38 ס"מ ולמשקל ממוצע של כ-7 ק"ג.<br />


</p>
</td >
<td>  </td>
</tr>
  
  
</table>
</td>
</tr>
</table>
    </div>
    </form>
</body>
</html>
