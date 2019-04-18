using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Web;
//����� ���� ������ ����� ���������� ADO
//����� ������� - ��� ���� ������ ����� ����� DBMS
public class MyDataBase
{
    //������
    private static OleDbConnection GetConnection()
    {
        string location = HttpContext.Current.Server.MapPath("~/App_Data/DB1.mdb");
        OleDbConnection con = new OleDbConnection();
        con.ConnectionString = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source="+location;
        con.Open();
        return con;
    }

    static public OleDbCommand GetCommand(string sqlStr) // for static connection
    {
        OleDbCommand  cmd = new OleDbCommand();
        cmd.Connection = GetConnection(); 
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = sqlStr;
        return cmd;
    }

    static public OleDbCommand GetCommand(string sqlStr, OleDbConnection con) 
    {
        OleDbCommand cmd = new OleDbCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = sqlStr;
        return cmd;
    }

    static public int ExecuteNonQuery(string strSql)
    {
        int rowsAffected;
        OleDbConnection con = GetConnection();
        OleDbCommand cmd = GetCommand(strSql, con);
        try
        {
            rowsAffected = cmd.ExecuteNonQuery();
        }
        catch (OleDbException ex)
        { throw ex; }
        finally
        { cmd.Connection.Close(); }
        return rowsAffected;
    }


    static public Object ExecuteScalar(string strSql)
    {
        OleDbConnection con = GetConnection();
        OleDbCommand cmd = GetCommand(strSql, con);
        Object obj = cmd.ExecuteScalar();
        con.Close();
        return obj;
    }

    static public DataTable GetFullTable(string Table)  // get a full table
    {
        string strSql = "select * from " + Table;
        return GetTable(strSql);
    }

    static public DataTable GetFullTable(string Table, object whereStr)
    {
        if (whereStr == null || whereStr.Equals(""))
            return GetFullTable(Table);
        else
        {
            string strSql = "select * from " + Table + " where " + whereStr;
            return GetTable(strSql);
        }
    }

    static public DataTable GetTable( string strSql)
    {
        DataTable dt = new DataTable ();
        OleDbConnection con = GetConnection();
        OleDbCommand cmd = GetCommand(strSql, con);
        OleDbDataAdapter dataAdapter = new OleDbDataAdapter(strSql, con);
        dataAdapter.Fill(dt);
        return dt;
    }

       
}
