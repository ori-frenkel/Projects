<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminSearchFormV1.aspx.cs" Inherits="AdminSearchFormV1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="icon" href="IMG/img1.png" type="image/x-icon">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<style type ="text/css" >
        *, html {
    margin:0;
    padding:0;  
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
    text-align:center;
    
    	
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
 .box2 {
  display: inline-block;
  width: 30%;
  height: 30%;
  margin: 1em;
  padding:1%;
  border:1px;
  border:solid  #6AC5AC 3px;
  display: table-cell;
  
}


   </style>

<body dir="rtl" >
<div>
    <% if (Session["Check_Admin"] == "true")
       { %>
       
       <%}
       else
    { %>
    <p align="center">
    <%
    
        Response.Redirect("404.htm");%>
    
    <%} %></p>
    
    </div>
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
 <a href="QuizV1.aspx"><button>Quiz</button></a>
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
      <a href="AllDogsInfoAspx/BeagleV1.aspx"><button>ביגל</button></a>
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
<!-- ----------------------------------- --> 
<div>
    
    <center>
    <div>
    <% if (Session["Search"] == "true")
       { %>
      <%  Response.Write(ShowTableHeaders());%>
       <%      Response.Write(ShowTable());%>
       <%}
       else 
    { %>
    <p align="center">
    <%
    Response.Write(ShowTableHeaders());
      Response.Write(ShowFullTable1());
        %>
    
    <%} %></p>
    
    </div>
    
    
    <% %>
    <br />
    <form method="post" action="AdminSearchFormV1.aspx" style="font-family: Arial; font-size: smaller">
    <div class="box2">
    <table>
                <tr>
<h1>חיפוש משתמשים:</h1>
                    <td>
                     משתמש:
                        <input  name="user" type="text" /></td>
                   
                    <td>
                        <input  type="submit"  value=" חפש לפי שם משתמש"  />
                    </td>
                </tr>
                </table>
                </div>
    </form>
         
          
         <table width="90%">
         <td colspan="2" style="text-align:center;" >&nbsp סה"כ משתמשים רשומים באתר <%Response.Write(ShowTableCount());%></td></center>
  <tr>
  </form>
 
      <td> <form name="f1" id="f1" action="Delete.aspx" method="get" >
    <div class="box2">
    <h1>מחק משתמש</h1>
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
              size="20" placeholder="Enter Username" value="<%=Request.QueryString["username"] %>" style="color: #787878;" readonly />
            </td> <!-- [A-Za-z0-9]{3,}" -->
          </tr>
          <tr>
          <td>סיסמה:</td>
           <td>
              <input type="password" name="password" id="password"
              size="20" placeholder="Enter Password" value="<%=Request.QueryString["password"] %>" style="color: #787878;" readonly /> 
            </td>
          </tr>
          <td>
              <input type="submit" name="submit" id="submit" value="מחק"/>
               &nbsp; <input type=
              "reset" value="נקה" />
            </td>
            
          </table>
          </div>
    </form>
    
    </td>
    <br />
    
     <td>  <form name="f2" id="Form2" action="Update.aspx" method="post">
         <div class="box2"> 
<h1>עדכן פרטי משתמש</h1>

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
          </div>
    </form></td>
    </form>
   <tr><td></td></tr>
   <tr>
   
   
   </tr> 
   </div>
  </td>
  </tr>
    </table>
    
    </center>

    
    
    </div>
    <center>
    
    
    
    
    </center>
    

<!-- ----------------------------------- -->  

</body>
</html>
