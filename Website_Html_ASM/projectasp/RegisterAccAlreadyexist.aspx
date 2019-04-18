<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegisterAccAlreadyexist.aspx.cs" Inherits="RegisterAccAlreadyexist" %>

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
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
p.ex1 {
    padding: 20px;
}
    p.ex2 {
    padding: 20px;
    color: black;
    font-size: 20px;
}
.alert.warning {background-color: #f44336; height:20%;}

   </style>   <script type="text/javascript">
 

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
<center>
<table width="100%">

<tr >
<td colspan="3" bgcolor="#E6E6FA" >
    <a href="Index.aspx"><img src="IMG/img1.png" alt="Mountain View" style="width:304px;height:228px;border-radius:50%;" title="דף הבית"></a>


      <img class="pos-abs img-responsive2" src = "IMG/dog1.png" width="400" height="200"  title="דף הבית" />

   
    
</td>
    
    
</tr>
<tr >

<td bgcolor="#006600" width="10%" >

 <a href="LoginV1.aspx"><button>התחבר</button></a>

</td>
<td bgcolor="#006600" width="10%" >

 <a href="RegisterV1.aspx"><button class="active">הרשם</button></a>

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

<td width="70%">
<div class="alert warning ">
   
 <center> <strong style="color:White;"><br />השם משתמש כבר קיים<br />This UserName Is Already Exist</strong></center> 
</div>
<h3>
הרשמה לאתר 
</h3>
<br />
  
                           
  
  <center>

<form name = "form1" id="form1" action="Insert.aspx" method="post">
 

        
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
              size="20" placeholder="Enter Username" pattern=".{2,}" title="Two or more characters" required />
            </td> <!-- [A-Za-z0-9]{3,}" -->
          </tr>
          <tr>
            <td>
              שם פרטי:
            </td>
            <td>
              <input type="text" name="firstname" id="firstname"
              size="20" placeholder="Enter First Name" pattern="[A-Za-zא-ת]{3,}" title="מעל שני אותיות ואסור שהיו מספרים" required />
            </td> <!-- [A-Za-z]{3,}" -->
          </tr> 
          <tr>
            <td>
              שם משפחה:
            </td>
            <td>
              <input type="text" name="lastname" id="lastname"
              size="20" placeholder="Enter Last Name" pattern="[A-Za-zא-ת]{3,}" title="מעל שני אותיות ואסור שהיו מספרים" required />
            </td>
          </tr>
          <tr>
            <td>
              איימיל:
            </td>
            <td>
              <input type="email" name="email" id="email" size="20" pattern="[A-Za-z0-9_%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,3}$"
              placeholder="Enter Email" title="האיימיל צריך להיות בפורמט הזה email@gmail.com לאחר הנקודה חייב להיות 2 או 3 אותיות" required />
            </td>
          </tr>
          <tr>
            <td>
              סיסמה:
            </td>
            <td>
              <input type="password" name="password" id="password"
              size="20" placeholder="Enter Password" required />
            </td>
          </tr>
          <tr>
            <td>
              חזור שנית על הסיסמה:
            </td>
            <td>
              <input type="password" name="password1" id=
              "password1" size="20" placeholder=
              "Repeat Password" required />
            </td>
          </tr>
          <tr>
            <td>
              מקום מגורים:
            </td>
            <td>
              <select name="city">
                <option value="tel-aviv;" selected="selected">
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
          <tr>
            <td>
              מין:
            </td>
            <td>
              זכר <input type="radio" name="gender" value="male"
              checked="checked" /> &nbsp; &nbsp; נקבה <input type=
              "radio" name="gender" value="female" />
            </td>
          </tr>
          <br />
          <tr>
            <td></td>
            <td>
              <input type="submit" name="submit" id="submit" value="שלח"
              onclick="return checkpassword()" /> &nbsp; <input type=
              "reset" value="נקה" />
            </td>
          </tr>
           </tr> 
   </form>       
        </table>  
    </form>

 </center>
 
</div>
</body>
</html>
