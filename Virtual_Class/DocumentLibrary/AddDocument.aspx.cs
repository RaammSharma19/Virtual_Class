using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DocumentLibrary_AddDocument : System.Web.UI.Page
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

    protected void submit_Click(object sender, ImageClickEventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["VirtualClass"].ConnectionString;

        SqlConnection con = new SqlConnection(constr);
        con.Open();
        string SQLQuery = "Insert into DocumentLibrary Values('" + Class.Text + "','" + title.Text + "','" + description.Text + "','" + url.Text + "'); ";
        SqlCommand com = new SqlCommand(SQLQuery, con);
        int res = com.ExecuteNonQuery();
        if (res != 0)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Congratulations..!','Document Added Successfully','success');", true);
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Oops..','Something Went Wrong. Unable To Add Document','error');", true);
        }
        con.Close();
    }
}