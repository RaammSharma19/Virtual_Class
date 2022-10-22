using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["un"] == null)
        {
            Response.Redirect("/login.aspx");
        }

        if(!Session["type"].Equals("ADMIN"))
        {
            Response.Redirect("/login.aspx");
        }
    }

    protected void register_Click(object sender, ImageClickEventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["VirtualClass"].ConnectionString;

        SqlConnection con = new SqlConnection(constr);
        con.Open();
        string SQLQuery = "Insert into Student(FirstName,MiddleName,LastName,Gender,RollNo,Dob,MobileNo,Email,Username,Password) Values('" + fn.Text.ToUpper()+ "','" +mn.Text.ToUpper()+ "','" +ln.Text.ToUpper()+"','" +gender.Text+ "','" + rno.Text + "','" + dob.Text + "','" + cno.Text + "','" + email.Text + "','" + uid.Text + "','" +passw.Text+"'); ";
        SqlCommand com = new SqlCommand(SQLQuery, con);
        int res = com.ExecuteNonQuery();
        if(res != 0)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Congratulations..!','Student Registered Successfully','success');", true);
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Oops..','Something Went Wrong. Unable To Register Student','error');", true);
        }
        con.Close();
    }

    protected void rno_TextChanged(object sender, EventArgs e)
    {
        string rn = rno.Text;

        if(CheckRollNo(rn))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Oops..','Student With Same Roll No. Already Exist','error');", true);
            rno.Text = "";
            uid.Text = "";
        }
        else
        {
            uid.Text = rno.Text;
            uid.ReadOnly = true;
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
        return boolReturnValue;
    }
}