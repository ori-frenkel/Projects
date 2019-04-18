<%@ Page Language="C#" AutoEventWireup="true" CodeFile="file1.aspx.cs"  Debug="true" Inherits="Test_file1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<style type ="text/css" >
body{ background-color:Green;}
h1{color:Blue; font:20px;}
h2{color:Black; font:15px;}
</style>
<body dir="rtl">
    <form id="form1" runat="server">
    <div>
    
    <form name = "form2" id="form2" action="file1.aspx" method="post">
 

        <center>
        <h1>תשלום חשבונית באינטרנט</h1>
        <h2>הנתיב המהיר מתחייב להביא אתכם ליעד תוך מספר דקות גם בשעות העומס. <br /> נסיעה טובה!</h2>
        <table>
          <tr>
            <td></td>
          </tr>
          <tr>
            <td>
              מספר ת.ז:
            </td>
            <td>
              <input type="text" name="ID" id="ID" value="<%  Response.Write(Session["ID"]);%>"
              size="20"   required />
            </td> <!-- [A-Za-z0-9]{3,}" -->
          </tr>
          <tr>
            <td>
              מספר יציאות:
            </td>
            <td>
              <input type="text" name="numpoints" id="numpoints" value="<%  Response.Write(Session["numpoints"]);%>"
              size="20"   required />
            </td> <!-- [A-Za-z]{3,}" -->
          </tr> 
          <tr>
            <td>
              מספר רכב :
            </td>
            <td>
              <input type="text" name="carnum" id="carnum" value="<%  Response.Write(Session["carnum"]);%>"
              size="20"  required />
            </td>
         <tr>
            <td>
              מנוי- כן או לא:
            </td>
            <td>
              <select name="yesnornot">
                <option value="true" selected="selected">
                  כן
                </option>
                <option value="false">
                  לא
                </option>
                
              </select>
            </td>
          </tr>
          <tr>
          <td> </td>
          <td><input type="submit" name="submit" id="submit" value="שלח" /></td>
          </tr>
         
          </table>
          <p> לתשלום____ <%=fullprice%> שקל</p>
          <p>
              <a href="file2.aspx">בדיקת הנחה</a></p>
           </center>
           
    </form>
    
    </div>
    </form>
</body>
</html>
