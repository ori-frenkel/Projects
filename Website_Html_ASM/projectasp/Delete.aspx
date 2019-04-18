<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Delete.aspx.cs" Inherits="Delete" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body dir="rtl">
<div>
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
   
    </div>
    </center>
</body>
</html>
