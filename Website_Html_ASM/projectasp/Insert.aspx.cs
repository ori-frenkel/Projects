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


public partial class Insert : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["submit"] != null)
        {
            string us = Request.Form["username"];
            string fn = Request.Form["firstname"];
            string ln = Request.Form["lastname"];
            string email = Request.Form["email"];
            string pass = Request.Form["password"];
            string city = Request.Form["city"];
            string gender = Request.Form["gender"];






            string Condition = "user_d='" + us + "'";
            DataTable dt = MyDataBase.GetFullTable("table1", Condition);

            if (dt.Rows.Count == 0)
            {
                string sql = "insert into table1(user_d,fn_d,ln_d,email_d,pass_d,city_d,gender_d)values('" + us + "','" + fn + "','" + ln + "','" + email + "','" + pass + "','" + city + "','" + gender + "')";
                MyDataBase.ExecuteNonQuery(sql);
                Session["userExist"] = false;
            }
            else
            {
                Session["userExist"] = true;
                Session["User"] = Request.Form["username"];
                Session["Pass"] = Request.Form["password"];

            }

        }
    }
}
