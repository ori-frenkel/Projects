<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="ViewUsers.aspx.cs" Inherits="ViewUsers" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Userlist</title>
    <style type ="text/css">
    a:link {color: red;}
    a:visited {color: green;}
    </style>
</head>

<%--if (Session["Check_Admin"] = "false")Only Admin should be able to see the users
  {
      
  }
  else if(Session["Check_Admin"] = "ture")
    {
        Response.Redirect("ViewUsers.aspx");
    }
        --%>
<body dir="rtl">
<div>
    <% if (Session["Check_Admin"] == "true")
       { %>
       <p align="center">
       ברוך הבא ADMIN
       <br />
           <a href="ViewUsers.aspx">לצפייה במשתמשים</a>
           
       </p>
       <%}
       else
    { %>
    <p align="center">
    <%
    Response.Write(Session["User"]); 
    Response.Redirect("NotAdmin.aspx");%>
    שלום<br />
    אתה לא אדמין לכן אתה אין לך הרשאה לצפות בזה<br />
    <a href="login.htm">כניסה למשתמש קיים</a><br />
    <a href="RegisterTemp.htm">להרשמה בשם משתמש חדש</a>
    <a href="seasionlogin.aspx">התחבר כאדמין</a>
    <%} %></p>
    
    </div>
<div>
    <form method="post" action="ViewUsers.aspx">
    <center>
    
    <table  style="margin-bottom:3;margin-top:3" cellpadding="4">
    <%
        Response.Write(ShowTableHeaders());
        Response.Write(ShowTable());
         
         %>
   <tr><td></td></tr>
   <tr>
   
   <td colspan="4">&nbsp סה"ב <%Response.Write(ShowTableCount());%></td> &nbsp משתמשים
   </tr> 
  
    </table>
    </center>

    </form>
    </div>
    <center>
    <br /><br /><br /><br />
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
</body>

</html>
