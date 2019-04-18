<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminSearchFormV.aspx.cs" Inherits="AdminSearchFormV" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>

<body dir="rtl">
    <form id="form1" runat="server">
    <div>
    <form method="post" action="AdminSearchFormV.aspx" style="font-family: Arial; font-size: smaller">
    <table>
                <tr>

                    <td>
                     משתמש:
                        <input  name="user" type="text" /></td>
                   
                    <td>
                        <input  type="submit"  value=" חפש לפי שם משתמש"  />
                    </td>
                </tr>
                </table>
                
    </form>
    
    </div>
    
    
    </form>
</body>
</html>
