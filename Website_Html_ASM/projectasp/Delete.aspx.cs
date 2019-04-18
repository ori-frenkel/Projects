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

public partial class Delete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string username = Request.QueryString["username"];
        string pass = Request.QueryString["password"];
        string strSQL = "Delete from table1 where user_d='" + username + "' AND pass_d='" + pass + "'"; 
        MyDataBase.ExecuteNonQuery(strSQL);
        
    }
}
