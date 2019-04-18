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


public partial class Insert2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["submit"] != null)
        {
            string us = Request.Form["username"];
            string pass = Request.Form["password"];
            
             if ((us == "Anna") && (pass == "12345"))
                {
                    Session["admin_user"] = us;
                    Session["admin_pass"] = pass;
                    Session["Check_Admin"] = "true";
                    Response.Redirect("Index.aspx");
                }


            string Condition = "user_d='" + us + "' AND pass_d='" + pass + "'";
            DataTable dt = MyDataBase.GetFullTable("table1", Condition);

            if (dt.Rows.Count == 0)
            {

                Session["Check_User"] = "false";
            
            }
            else
            {
                Session["Check_User"] = "true";
                Session["User"] = Request.Form["username"];
                Session["Pass"] = Request.Form["password"];

            }


        }
    }
}
