<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Logout.aspx.cs" Inherits="Logout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <div>
    
    <p align="center">
    שלום<br />
    התנתקה בהצלחה, אתה לא מחובר  עכשיו
    <% Response.Redirect("Index.aspx");%>
    </p>
    
    </div>
    <form id="form1" runat="server">
    <div>
    
    </div>
    
    
    </form>
</body>
</html>
