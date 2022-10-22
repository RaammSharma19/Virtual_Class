using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_DeleteStudent : System.Web.UI.Page
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
            string constr = ConfigurationManager.ConnectionStrings["VirtualClass"].ConnectionString;

            SqlConnection con = new SqlConnection(constr);
            con.Open();
            string SQLQuery = "DELETE FROM Student Where RollNo ='" + rno.Text +"';";
            string SQLQuery2 = "DELETE FROM Attendance Where RollNo ='" + rno.Text + "';";
            string SQLQuery3 = "DELETE FROM Assignments Where RollNo ='" + rno.Text + "';";
            string SQLQuery4 = "DELETE FROM InternalExamRecord Where RollNo ='" + rno.Text + "';";


            SqlCommand com = new SqlCommand(SQLQuery, con);
            SqlCommand com2 = new SqlCommand(SQLQuery2, con);
            SqlCommand com3 = new SqlCommand(SQLQuery3, con);
            SqlCommand com4 = new SqlCommand(SQLQuery4, con);

            int res = com.ExecuteNonQuery();
            int res2 = com2.ExecuteNonQuery();
            int res3 = com3.ExecuteNonQuery();
            int res4 = com4.ExecuteNonQuery();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Congratulations..!','Student's Records Deleted Successfully','success');", true);
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Oops..','No Such A Student With Roll Number You Entered ','error');", true);

        }
    }
}