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

public partial class seasionlogin : System.Web.UI.Page
{
    public string us;
    public string p;
    protected void Page_Load(object sender, EventArgs e)
    {
        string us = Request.Form["user"];
        string p = Request.Form["password"];
        if (us == null || us == "" || p == "")
            Response.Write("התחבר כאדמין");
        else
        {
            if ((us == "Anna") && (p == "12345"))
            {
                Session["admin_user"] = us;
                Session["admin_pass"] = p;
                Session["Check_Admin"] = "true";
                Response.Redirect("Index.aspx");
            }
            else
            {
                Session["Check_Admin"] = "false";
                Response.Write("פרטים לא נכונים");
            }
        }
    }
}
