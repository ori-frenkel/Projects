<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Update.aspx.cs" Inherits="Update" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body dir="rtl">
<div>
    <% if (Session["Check_Admin"] == "true")
       {
           Response.Redirect("AdminSearchFormV1.aspx");%>
      
       <%}
       else
    { %>
    <p align="center">
    <%
    Response.Write(Session["User"]);
    Response.Redirect("404.htm");%>
    שלום<br />
    אתה לא אדמין לכן אתה אין לך הרשאה לצפות בזה<br />
    <a href="login.htm">כניסה למשתמש קיים</a><br />
    <a href="RegisterTemp.htm">להרשמה בשם משתמש חדש</a>
    <%} %></p>
    
    </div>
<center>
    
     <div>
  <!--  <form name="f2" id="f2" action="Update.aspx" method="post"> 
    <table >
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
            </td> 
          </tr>
          <tr>
          <td>סיסמה:</td>
           <td>
              <input type="password" name="password" id="password"
              size="20" placeholder="Enter Password" required />
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
              שם פרטי:
            </td>
            <td>
              <input type="text" name="firstname" id="firstname"
              size="20" placeholder="Enter First Name"    />
            </td> 
          </tr> 
          <tr>
            <td>
              שם משפחה:
            </td>
            <td>
              <input type="text" name="lastname" id="lastname"
              size="20" placeholder="Enter First Name"   />
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
          
          <td>
              <input type="submit" name="submit" id="submit" value="עדכן"/>
               &nbsp; <input type=
              "reset" value="נקה" />
            </td>
          </table>
    </form> -->
    </div>
    
    </center>
</body>
</html>
