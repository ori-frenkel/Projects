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

public partial class Test_file1 : System.Web.UI.Page
{
    public int fullprice=0;
    public int numpointsA = 0;
    public int newprice = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        string ID = Request.Form["ID"];
        
        if (Request.Form["numpoints"] != null)
        {
            numpointsA = int.Parse(Request.Form["numpoints"]);
            Session["ID"] = Request.Form["ID"];
            Session["numpoisnts"] = Request.Form["numpoints"];
            Session["carnum"] = Request.Form["carnum"];
            fullprice = numpointsA * 12;

            string might = Request.Form["yesnornot"];
            if (might == "true")
            {
                Session["newprice"] = (fullprice * 0.9);
            }
            else
            {
                Session["newprice"] = fullprice;
            }
        }
    }
}
