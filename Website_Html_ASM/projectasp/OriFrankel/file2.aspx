<%@ Page Language="C#" AutoEventWireup="true" CodeFile="file2.aspx.cs" Inherits="Test_file2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<style type ="text/css" >
    
</style>
<body dir="rtl">
    <form id="form1" runat="server">
    <div>
    <center>
    קיבלתה הנחה של 10%
    <table width="100%">
    <tr>
    <td bgcolor="green" width="33%">סכום לתשלום: <%  Response.Write(Session["newprice"]);%></td>
    <td bgcolor="green" width="33%">מספר רכב: <%  Response.Write(Session["carnum"]);%></td>
    <td bgcolor="green" width="33%">מספר ת.ז: <%  Response.Write(Session["ID"]);%></td>
    </tr>
    </table>
    
    
    
    </center>
    </div>
    </form>
</body>
</html>
