using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Assignments_AssignTask : System.Web.UI.Page
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
        if(CheckRollNo(rollno.Text))
        {
            string constr = ConfigurationManager.ConnectionStrings["VirtualClass"].ConnectionString;

            SqlConnection con = new SqlConnection(constr);
            con.Open();
            string SQLQuery = "Insert into Assignments(RollNo,Subject,Description,AssignDate,LastDate) Values('" + rollno.Text.ToUpper() + "','" + subject.Text.ToUpper() + "','" + description.Text.ToUpper() + "','" + DateTime.Today.ToShortDateString() + "','" + subDate.Text.ToString().ToUpper() + "'); ";
            SqlCommand com = new SqlCommand(SQLQuery, con);
            int res = com.ExecuteNonQuery();
            if (res != 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Congratulations..!','Assignment Assigned Successfully','success');", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Oops..','Something Went Wrong. Unable To Update Details','error');", true);
            }
            con.Close();
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Oops..','No Such A Student With Roll Number You Entered ','error');", true);

        }
    }
}