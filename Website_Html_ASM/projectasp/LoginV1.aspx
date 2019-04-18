<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginV1.aspx.cs" Inherits="LoginV1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<style type ="text/css" >

  /*------------------------------------------*/
    .pos-abs {
    bottom: -100px;
    position: relative;
    left: -100px;
    z-index: 2;
}
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
    input:focus{background-color:lightblue;}  /* שלוחצים על היינפוט הופך אותו לצהוב */

    h111
    {
    color: black;
    font-size: 20px;    
    text-decoration: underline;
    text-align: center;
    }

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
p.ex1 {
    padding: 20px;
}
    p.ex2 {
    padding: 20px;
    color: black;
    font-size: 20px;
}
p.ex3
{
font-family: "Century Gothic";
font-size: 2em;
color:#666;
padding:5px 5px
}
button.active {background-color:#795231;}
button.active:hover {background-color:#795548;}

a.content {
color:#fff;
font-family:"Century Gothic";
border-radius:1 em;
border-top-left-radius: 1em;
border-top-right-radius: 1em;
border-bottom-right-radius: 1em;
border-bottom-left-radius: 1em;
padding:15px 20px;
background:#666666;
text-decoration:none;
position:relative;




}
a.content:hover {color:#e54040; }
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #555555;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #4CAF50;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  cursor: pointer;
}
.form button:hover {
  background: #43A047;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}


td.body {
  background: #76b852; /* fallback for old browsers */
  background: linear-gradient(to left, #76b852, #8DC26F);
  font-family: "Roboto", sans-serif;
    
}

   </style>
   <script type="text/javascript">
 

    function checkpassword()
    {
    password=document.getElementById("password");
    password1=document.getElementById("password1");
    if(password.value!=password1.value)
    {
    alert("הסיסמאות לא תואמות");
    return false;
    }
    else
    {
    return true;
    }
    }  
    </script>
<body dir="rtl" >
<div class="wrapper"> 
<table width="100%">

<tr >
<td colspan="3" bgcolor="#E6E6FA" >
    
      <a href="Index.aspx"><img src="IMG/img1.png" alt="Mountain View" style="width:304px;height:228px;border-radius:50%;" title="דף הבית"></a>


       <a href="Index.aspx"><img class="pos-abs " src = "IMG/dog1.png" width="400" height="200"  title="דף הבית" /></a>

   
    
</td>
    
    
</tr>
<tr >

<td bgcolor="#006600" width="10%" >

 <a href="LoginV1.aspx"><button class="active">התחבר</button></a>

</td>
<td bgcolor="#006600" width="10%" >

 <a href="RegisterV1.aspx"><button>הרשם</button></a>

</td>
<td bgcolor="#4CAF50" width="70%" >

</td>
    
    
</tr>
<tr>
<td colspan="2" bgcolor="#4CAF50">
<a href="Index.aspx"><button>דף הבית</button></a>
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
<td width="70%" class="body">

<br />
  
                           
  
  <center>

<div class="login-page">
  <div class="form">
    <form name = "form2" id="form2" action="Insert2.aspx" method="post">
      <input type="text" name="username" id="username" placeholder="שם משתמש"/>
      <input type="password" name="password" id="password" placeholder="סיסמה"/>
      
      <input style="background: #4CAF50; cursor:pointer" type="submit" name="submit" id="submit" value="שלח" />
      <p class="message">לא רשום? <a href="RegisterV1.aspx">הרשם עכשיו</a></p>
    </form>
  </div>
</div>

 </center>
 
    </table>
    </div>
</body>
</html>
