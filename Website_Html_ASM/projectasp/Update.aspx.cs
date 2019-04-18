using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Update : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        string us = Request.Form["username"];
        string pass = Request.Form["password"];
        string email = Request.Form["email"];
        string firstname = Request.Form["firstname"];
        string lastname = Request.Form["lastname"];
        string city = Request.Form["city"];
        string strSQL = "UPDATE table1 SET pass_d='" + pass + "' , email_d='" + email + "' , city_d='" + city + "' , fn_d='" + firstname + "' , ln_d='" + lastname + "' where user_d='" + us + "'";
        MyDataBase.ExecuteNonQuery(strSQL);
    }
}
