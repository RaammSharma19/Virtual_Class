using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Attendance_AttendanceForm : System.Web.UI.Page
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


    /* Roll No And Month and subject Check*/
    private bool Dependency(string Rollno,string Subject, string Month)
    {
        bool boolReturnValue = false;
        string constr = ConfigurationManager.ConnectionStrings["VirtualClass"].ConnectionString;

        SqlConnection con = new SqlConnection(constr);
        String SQLQuery = "SELECT RollNo,Subject,Month FROM Attendance";
        SqlCommand com = new SqlCommand(SQLQuery, con);
        SqlDataReader Dr;

        con.Open();

        Dr = com.ExecuteReader();
        while (Dr.Read())
        {
            if ((Rollno.ToUpper() == Dr["RollNo"].ToString().ToUpper()) & (Month == Dr["Month"].ToString()) & (Subject == Dr["Subject"].ToString()))
            {
                boolReturnValue = true;
            }
        }
        return boolReturnValue;
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
        if(CheckRollNo(rno.Text))
        {
            if (Dependency(rno.Text,subject.Text,month.Text))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Oops..','Record Already Exist. Can Not Be Duplicated.','error');", true);
            }
            else
            {
                double per;
                double td = double.Parse(tdays.Text);
                double pd = double.Parse(pdays.Text);
                per = (pd / td) * 100;

                string constr = ConfigurationManager.ConnectionStrings["VirtualClass"].ConnectionString;

                SqlConnection con = new SqlConnection(constr);
                con.Open();
                string SQLQuery = "Insert into Attendance Values('" + rno.Text.ToUpper() + "','"+cls.Text.ToUpper()+ "','" + subject.Text.ToUpper() + "','" + month.Text.ToString().ToUpper() + "','" + tdays.Text + "','" + pdays.Text + "','" + per + "'); ";
                SqlCommand com = new SqlCommand(SQLQuery, con);
                int res = com.ExecuteNonQuery();
                if (res != 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Congratulations..!','Attendance Details Updated Successfully','success');", true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Oops..','Something Went Wrong. Unable To Update Details','error');", true);
                }
                con.Close();
            }

        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Oops..','No Such A Student With Roll Number You Entered ','error');", true);
        }
    }

    protected void rno_TextChanged(object sender, EventArgs e)
    {
        if (rno.Text.Length == 10)
        {
            cls.Text = rno.Text.Substring(0, 4);
            cls.ReadOnly = true;
        }
    }
}