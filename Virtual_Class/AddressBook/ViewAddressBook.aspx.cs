using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewAddressBook : System.Web.UI.Page
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

    /*For checking existance of roll no*/
    private bool CheckRollNo(string RollNo)
    {
        bool boolReturnValue = false;
        string constr = ConfigurationManager.ConnectionStrings["VirtualClass"].ConnectionString;

        SqlConnection con = new SqlConnection(constr);
        String SQLQuery = "SELECT RollNo FROM Student";
        SqlCommand com = new SqlCommand(SQLQuery, con);
        SqlDataReader Dr;

        con.Open();

        Dr = com.ExecuteReader();
        while (Dr.Read())
        {
            if ((RollNo == Dr["RollNo"].ToString()))
            {
                boolReturnValue = true;
            }
        }
        con.Close();
        return boolReturnValue;
    }
    protected void submit_Click(object sender, ImageClickEventArgs e)
    {
        if (CheckRollNo(rno.Text))
        {
            Session["RollNo"] = rno.Text;
            string url = "/AddressBook/ViewStudentDetails.aspx";
            string s = "window.open('" + url + "', 'Adressbook_window', 'width=900,height=600,left=200,top=50,resizable=0');";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "script", s, true);
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Oops..','No Such A Student With Roll Number You Entered ','error');", true);
        }
    }
}