<%@ Page Language="C#" Debug="true" AutoEventWireup="true" CodeFile="Insert.aspx.cs" Inherits="Insert" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body style=""font-family: Arial Unicode MS; font-size:small; bgcolor="lime"; text-align:center">

    <form id="form1" runat="server">
    <div>
    <% if ((bool)Session["userExist"] == false)
       { %>
       <p align="center">
      <%  Response.Redirect("IndexRegisterSucces.aspx");%>
       <br />
           <a href="Index.htm">חזרה לעמוד הראשי</a>
       </p>
       <%}
       else
    { %>
    <p align="center">
    <%
        Response.Redirect("RegisterAccAlreadyexist.aspx");
    Response.Write(Session["User"]); %>
    שלום<br />
    אתה כבר קיים במערכת<br />
    <a href="login.htm">כניסה למשתמש קיים</a><br />
    <a href="RegisterTemp.htm">להרשמה בשם משתמש חדש</a>
    <%} %></p>
    
    </div>
    </form>
</body>
</html>
