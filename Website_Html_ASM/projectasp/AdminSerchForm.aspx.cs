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

public partial class AdminSerchForm : System.Web.UI.Page
{
    string Condition = "user_d='" + us + "'";
    string where;
    string whereStr = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        // switch (Request.Form["submitBtn"].ToString())
        //{
        //  case "חפש לפי שם " :
        //     {
        //         SerchByName();
        //          PrintTable();
        //       }
        //        break;
        //
        //     case "חפש לפי שם משפחה":
        //       {
        //          SerchByLastName();
        //         PrintTable();
        //     }
        //      break;
        //  }
        //  }
        //   private void SerchByName()
        // {
        //    string fName = Request.Form["user"];
        //    if (fName.Equals("") == false)
        //    {
        //        whereStr += "Name'" + fName + "' ";
        //     }
        //    Session["WhereStr"] = whereStr;
        // }

        // private void SerchByLastName()
        //  {
        //     string lname = Request.Form["lastname"];
        //    if(lname.Equals("") == false)
        //        whereStr += " LastName='" + lname + "'";
        // }


        DataTable dt = MyDataBase.GetFullTable("table1", Condition);

        if (dt.Rows.Count == 0)
        {
            PrintTable();
        }
    }
           

    private void PrintTable()
    {
        DataTable dt = MyDataBase.GetFullTable("table1", ConditionA);
        string str =  "";

        Response.Write( "<table>");
        foreach(DataRow dr in dt.Rows)
        {
        Response.Write("<tr>");
        Response.Write("<td>" + dr["user_d"] + "</td>");
        Response.Write("<td>" + dr["fn_d"] + "</td>");
        Response.Write("<td>" + dr["ln_d"] + "</td>");
        Response.Write("<td>" + dr["email_d"] + "</td>");
        Response.Write("<td>" + dr["pass_d"] + "</td>");
        Response.Write("<td>" + dr["city_d"] + "</td>");
        Response.Write("<td>" + dr["gender_d"] + "</td>");
        Response.Write("<tr>");
        }
        Response.Write("</table>");
    }

}
