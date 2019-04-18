<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Insert2.aspx.cs" Inherits="Insert2" %>

<<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body style=""font-family: Arial Unicode MS; font-size:small; bgcolor="lime"; text-align:center">

    <form id="form2" runat="server">
    <div>
    <% if ((Session["Check_User"] == "false") && (Session["Check_Admin"] == "false"))
       { %>
      <%  Response.Redirect("FalseLoginV1.aspx");%>
       <p align="center">
       המשתמש לא נמצא במערכת
       <br />
           <a href="Index.htm">חזרה לעמוד הראשי</a>
           <a href="RegisterTemp.htm">להרשמה</a>
           <a href="login.htm">כניסה למשתמש קיים</a><br />
       </p>
       <%}
       else if(Session["Check_Admin"] == "true")
    { %>
    <p align="center">
    <%
        Response.Redirect("Index.aspx");
     %>
    
    <!--------- -->
    <%}
       else if (Session["Check_User"] == "true")
    { %>
    <p align="center">
    <%
        Response.Redirect("Index.aspx");
     %>
    שלום<br />
    ברוך הבא לאתר!<br />
        <a href="Index.aspx">למעבר לדף הבית</a>
    
    <%} %></p>
    
    </div>
    </form>
</body>
</html>
