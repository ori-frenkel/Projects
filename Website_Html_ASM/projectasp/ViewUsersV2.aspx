<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewUsersV2.aspx.cs" Inherits="ViewUsersV2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<style type ="text/css" >
    
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
/*------------------------------------------*/


   </style>

<body dir="rtl" >
<div class="wrapper"> 
<center>
<table width="100%">

<tr >
<td colspan="3" bgcolor="#E6E6FA" >
    <a href="Index.aspx"><img src="IMG/img1.png" alt="Mountain View" style="width:304px;height:228px;border-radius:50%;" title="דף הבית"></a>


       <img class="pos-abs img-responsive2" src = "IMG/dog1.png" width="400" height="200"  title="בולדוג אנגלי" />

    
</td>
    
    
</tr>
<tr >
    
<td bgcolor="#006600" width="10%" >

 <a href="Login.aspx"><button>התחבר</button></a>

</td>
<td bgcolor="#006600" width="10%" >

 <a href="RegisterTemp.htm"><button>הרשם</button></a>

</td>
<td bgcolor="#4CAF50" width="70%" >
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
<a href="Index.htm"><button>דף הבית</button></a>
      <br />
 <a href="queiz.aspx"><button>queiz</button></a>
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
      <a href="Beagle.aspx"><button>ביגל</button></a>
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
<!-- ----------------------------------- --> 
<div>
    <form method="post" action="ViewUsersV2.aspx">
    <center>
    
    <table  style="margin-bottom:3;margin-top:3" cellpadding="4">
    <%
        Response.Write(ShowTableHeaders());
        Response.Write(ShowTable());
         
         %>
           <form name="f1" id="Form1" action="Delete.aspx" method="get" >
    
    <table>
          <tr>
            <td></td>
          </tr>
          <tr>
            <td>
              שם משתמש:
            </td>
            <td>
              <input type="text" name="username" id="Text2" 
              size="20" placeholder="Enter Username" value="<%=Request.QueryString["username"] %>" style="color: #787878;" readonly >
            </td> <!-- [A-Za-z0-9]{3,}" -->
          </tr>
          <tr>
          <td>סיסמה:</td>
           <td>
              <input type="password" name="password" id="password1"
              size="20" placeholder="Enter Password" value="<%=Request.QueryString["password"] %>" style="color: #787878;" readonly > 
            </td>
          </tr>
          <td>
              <input type="submit" name="submit" id="submit2" value="מחק"/>
               &nbsp; <input type=
              "reset" value="נקה" />
            </td>
          </table>
    </form>
    
    <br />
    
       <form name="f2" id="Form2" action="Update.aspx" method="post">
    <table >
          <tr>
              
            <td></td>
          </tr>
          <tr>
            <td>
              שם משתמש:
            </td>
            <td>
              <input type="text" name="username" id="Text3"
              size="20" value="<%=Request.QueryString["username2"] %>" style="color: #787878;" readonly >
            </td> <!-- [A-Za-z0-9]{3,}" -->
          </tr>
          <tr>
          <td>סיסמה:</td>
           <td>
              <input type="password" name="password" id="password2"
              size="20" placeholder="Enter Password" value="<%=Request.QueryString["password2"] %>" >
            </td>
          </tr>
          <tr>
            <td>
              שם פרטי:
            </td>
            <td>
              <input type="text" name="firstname" id="Text4"
              size="20" placeholder="Enter First Name" value="<%=Request.QueryString["firstname2"] %>">
            </td> <!-- [A-Za-z]{3,}" -->
          </tr> 
          <tr>
            <td>
              שם משפחה:
            </td>
            <td>
              <input type="text" name="lastname" id="Text5"
              size="20" placeholder="Enter First Name" value="<%=Request.QueryString["lastname2"] %>" >
            </td> <!-- [A-Za-z]{3,}" -->
          </tr> 
           <tr>
            <td>
              איימיל:
            </td>
            <td>
              <input type="text" name="email" id="Text6"
               size="20" placeholder="Enter Email" value="<%=Request.QueryString["email2"] %>" >
            </td>
          </tr>
           <tr>
           <td>
           מקום מגורים:
           </td>
         <td>
              <select name="city">
                <option value="tel-aviv;" value="<%=Request.QueryString["city2"] %>" >
                  תל אביב
                </option>
                <option value="natania;">
                  נתניה
                </option>
                <option value="hadera;">
                  חדרה
                </option>
                <option value="other;">
                  אחר
                </option>
              </select>
            </td>
          </tr>
          
          <td>
              <input type="submit" name="submit" id="submit3" value="עדכן"/>
               &nbsp; <input type=
              "reset" value="נקה" />
            </td>
          </table>
    </form>
   <tr><td></td></tr>
   <tr>
   
   <td colspan="4">&nbsp סה"ב <%Response.Write(ShowTableCount());%></td> 
   </tr> 
   
  
    </table>
    </center>

    </form>
    </div>
    <center>
    
    
    
    <form name="f1" id="f1" action="Delete.aspx" method="get" >
    
    <table>
          <tr>
            <td></td>
          </tr>
          <tr>
            <td>
              שם משתמש:
            </td>
            <td>
              <input type="text" name="username" id="username" 
              size="20" placeholder="Enter Username" value="<%=Request.QueryString["username"] %>" style="color: #787878;" readonly >
            </td> <!-- [A-Za-z0-9]{3,}" -->
          </tr>
          <tr>
          <td>סיסמה:</td>
           <td>
              <input type="password" name="password" id="password"
              size="20" placeholder="Enter Password" value="<%=Request.QueryString["password"] %>" style="color: #787878;" readonly > 
            </td>
          </tr>
          <td>
              <input type="submit" name="submit" id="submit" value="מחק"/>
               &nbsp; <input type=
              "reset" value="נקה" />
            </td>
          </table>
    </form>
    
    <br />
    
       <form name="f2" id="f2" action="Update.aspx" method="post">
    <table >
          <tr>
              
            <td></td>
          </tr>
          <tr>
            <td>
              שם משתמש:
            </td>
            <td>
              <input type="text" name="username" id="Text1"
              size="20" value="<%=Request.QueryString["username2"] %>" style="color: #787878;" readonly >
            </td> <!-- [A-Za-z0-9]{3,}" -->
          </tr>
          <tr>
          <td>סיסמה:</td>
           <td>
              <input type="password" name="password" id="password"
              size="20" placeholder="Enter Password" value="<%=Request.QueryString["password2"] %>" >
            </td>
          </tr>
          <tr>
            <td>
              שם פרטי:
            </td>
            <td>
              <input type="text" name="firstname" id="firstname"
              size="20" placeholder="Enter First Name" value="<%=Request.QueryString["firstname2"] %>">
            </td> <!-- [A-Za-z]{3,}" -->
          </tr> 
          <tr>
            <td>
              שם משפחה:
            </td>
            <td>
              <input type="text" name="lastname" id="lastname"
              size="20" placeholder="Enter First Name" value="<%=Request.QueryString["lastname2"] %>" >
            </td> <!-- [A-Za-z]{3,}" -->
          </tr> 
           <tr>
            <td>
              איימיל:
            </td>
            <td>
              <input type="text" name="email" id="email"
               size="20" placeholder="Enter Email" value="<%=Request.QueryString["email2"] %>" >
            </td>
          </tr>
           <tr>
           <td>
           מקום מגורים:
           </td>
         <td>
              <select name="city">
                <option value="tel-aviv;" value="<%=Request.QueryString["city2"] %>" >
                  תל אביב
                </option>
                <option value="natania;">
                  נתניה
                </option>
                <option value="hadera;">
                  חדרה
                </option>
                <option value="other;">
                  אחר
                </option>
              </select>
            </td>
          </tr>
          
          <td>
              <input type="submit" name="submit" id="submit1" value="עדכן"/>
               &nbsp; <input type=
              "reset" value="נקה" />
            </td>
          </table>
    </form>
    </center>
    

<!-- ----------------------------------- -->  
</td>
</tr>
</table>
</center>
</div>
</body>
</html>
