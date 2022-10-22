using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_CreateAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["un"] == null)
        {
            Response.Redirect("/login.aspx");
        }
        if (!Session["type"].Equals("ADMIN"))
        {
            Response.Redirect("/login.aspx");
        }
    }

    /*Event on button Click*/
    protected void submit_Click(object sender, ImageClickEventArgs e)
    {
        if (CheckAdmin(un.Text))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Oops..','Admin With Same Username Already Exist Try Some Different Username','error');", true);
        }
        else
        {
            if (AddAdmin(un.Text.ToUpper(), passw.Text))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('congrats..!','Admin Created Successfully','success');", true);
            }
        }
    }

    /*Adding New Admin*/
    protected bool AddAdmin(string Username, string Password)
    {
        string constr = ConfigurationManager.ConnectionStrings["VirtualClass"].ConnectionString;

        SqlConnection con = new SqlConnection(constr);
        con.Open();
        string SQLQuery = "Insert into Admin Values('"+Username+"','"+Password+"','"+Session["un"].ToString()+"',NULL);";
        SqlCommand com = new SqlCommand(SQLQuery, con);
        com.ExecuteNonQuery();
        con.Close();
        return true;
    }

    /*Username TextChanged Event*/
    protected void un_TextChanged(object sender, EventArgs e)
    {
        string username = un.Text;
        if(CheckAdmin(username))
        {
            un.Text = "";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Oops..','Admin With Same Username Already Exist Try Some Different Username','error');", true);
        }

    }


    /*For checking existance of Admin Username*/
    private bool CheckAdmin(string Username)
    {
        bool boolReturnValue = false;
        string constr = ConfigurationManager.ConnectionStrings["VirtualClass"].ConnectionString;

        SqlConnection con = new SqlConnection(constr);
        String SQLQuery = "SELECT Username FROM Admin";
        SqlCommand com = new SqlCommand(SQLQuery, con);
        SqlDataReader Dr;

        con.Open();

        Dr = com.ExecuteReader();
        while (Dr.Read())
        {
            if ((Username.ToLower() == Dr["Username"].ToString().ToLower()))
            {
                boolReturnValue = true;
            }
        }
        return boolReturnValue;
    }

}