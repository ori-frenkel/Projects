<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminSerchForm.aspx.cs"  Inherits="AdminSerchForm" %>

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html  dir="ltr" xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>

<body>

    <center>
             
               
            </table>
    </center>
    <br />
        <div style="font-family: Arial; font-size:smaller">
        <center>
            חיפוש משתמשים
        </div>
        <form method="post" action="AdminSerchForm.aspx" style="font-family: Arial; font-size: smaller">
            <table>
                <tr>
<th style="width: 73px; font-family: Arial; font-size:smaller">
                        שם פרטי:</th>
                    <td>
                        <input id="txt1" name="user" type="text" /></td>
                   
                    <td>
                        <input id="Submit1" type="submit" name="submitBtn" value="חפש לפי שם" style="width: 72px" />
                    </td>
                </tr>
                
                              
                
                
                <tr>
                    <th style="width: 73px; font-family: Arial; font-size:smaller">
                        שם משפחה:</th>
                    <td>
                        <input id="lastname" name="lastname" type="text" /></td>
                    <td>
                        <input />
                    </td>
                </tr>
                <br />
                
            </table>
        </form>
        
    </div>
    <br />
    
</center>
</body>
</html>
