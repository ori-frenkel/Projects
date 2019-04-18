<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style>
form {
    border: 3px solid #f1f1f1;
}

input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
</style>
</head>
<body dir="rtl">
<center>
   <!--
<table>
<tr>
<td style="width:80%">
<h2>Login Form</h2>

<form id="form2" name="form2" method="post" action="Insert.aspx" runat="server">
  <div class="imgcontainer">
    <img src="img_avatar2.png" alt="Avatar" class="avatar">
  </div>

  <div class="container">
    <label><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="user" required>

    <label><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>
        
    <button type="submit">Login</button>
    
  </div>

  
</form>
</table>
-->
<form name = "form2" id="form2" action="Insert2.aspx" method="post">
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
              סיסמה:
            </td>
            <td>
              <input type="password" name="password" id="password"
              size="20" placeholder="Enter Password" required />
            </td>
          </tr>
          
            <td></td>
            <td>
              <input type="submit" name="submit" id="submit" value="שלח"
               /> &nbsp; <input type=
              "reset" value="נקה" />
            </td>
          </tr>
          </table> 
   </form>  
        
        
</html>

  
    
   


