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

public partial class ViewUsers : System.Web.UI.Page
{
    string where;
    protected string ShowTableHeaders()
    {
        string str = "";
        str += "<center>";
        str += "<table border=2><table bgcolor='D8D8D8'><tr><th width=100>שם משתמש </th><th width=100> סיסמה </th><th width=100>שם פרטי</th><th width=110>שם משפחה </th><th width=100>Email </th><th width=80>מקום מגורים </th><th width=100>gedner </th><th width=120> </th></tr>";
        return str;
    }
    protected string ShowTable()
    {
        DataTable dt = MyDataBase.GetFullTable("table1", where);

        bool even = true;
        string str = "";
        str += "<table border=1>";
        str += "<tr>";
        foreach (DataRow dr in dt.Rows)
        {
            if (even)
                str += "<tr bgcolor='CCEEFF'>";
            else
                str += "<tr bgcolor='D4F045'>";
            even = !even;
            str += "<td font='Arial' width=100>" + dr["user_d"] + "</td>"; 
            str += "<td font='Arial' width=100>" + dr["pass_d"] + "</td>"; 
            str += "<td font='Arial' width=100>" + dr["fn_d"] + "</td>"; 
            str += "<td font='Arial' width=100>" + dr["ln_d"] + "</td>"; 
            str += "<td font='Arial' width=100>" + dr["email_d"] + "</td>"; 
            str += "<td font='Arial' width=100>" + dr["city_d"] + "</td>"; 
            str += "<td font='Arial' width=100>" + dr["gender_d"] + "</td>"; 
          

            str += "<td><a href='ViewUsers.aspx?username=" + dr["user_d"] + "&password=" + dr["pass_d"] + "&firstname=" + dr["fn_d"] + "&lastname=" + dr["ln_d"] + "&city=" + dr["city_d"] + "&email=" + dr["email_d"] + "'>Delete</a></td>";
            str += "<td><a href='ViewUsers.aspx?username2=" + dr["user_d"] + "&password2=" + dr["pass_d"] + "&firstname2=" + dr["fn_d"] + "&lastname2=" + dr["ln_d"] + "&city2=" + dr["city_d"] + "&email2=" + dr["email_d"] + "'>Update</a></td>";
            str += "</tr>";
        }
        str += "</table>";
        return str;
    }
    protected string ShowTableCount()
    {
        DataTable dt = MyDataBase.GetFullTable("table1");
        return dt.Rows.Count.ToString();
    }
   
}

