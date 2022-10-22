using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InternalExam_UpdateMarks : System.Web.UI.Page
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
  
      
    /* Roll No And Subject Check*/
    private bool Dependency(string Rollno, string Subject)
    {
        bool boolReturnValue = false;
        string constr = ConfigurationManager.ConnectionStrings["VirtualClass"].ConnectionString;

        SqlConnection con = new SqlConnection(constr);
        String SQLQuery = "SELECT RollNo,Subject FROM InternalExamRecord";
        SqlCommand com = new SqlCommand(SQLQuery, con);
        SqlDataReader Dr;

        con.Open();

        Dr = com.ExecuteReader();
        while (Dr.Read())
        {
            if ((Rollno.ToUpper() == Dr["RollNo"].ToString().ToUpper()) & (Subject == Dr["Subject"].ToString()))
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
        if (CheckRollNo(rno.Text))
        {
            if (Dependency(rno.Text, subject.Text))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Oops..','Record Already Exist. Can Not Be Duplicated.','error');", true);
            }
            else
            {
                double per;
                double tm = double.Parse(tmarks.Text);
                double mo = double.Parse(marksob.Text);
                per = (mo / tm) * 100;

                string result;
                if(per >=40)
                {
                    result = "PASSED";
                }
                else
                {
                    result = "FAILED";
                }

                string constr = ConfigurationManager.ConnectionStrings["VirtualClass"].ConnectionString;

                SqlConnection con = new SqlConnection(constr);
                con.Open();
                string SQLQuery = "Insert into InternalExamRecord Values('" + rno.Text.ToUpper() + "','" + cls.Text.ToUpper() + "','" + subject.Text.ToUpper() + "','" + tmarks.Text + "','" + marksob.Text + "','" + per + "','"+result+"'); ";
                SqlCommand com = new SqlCommand(SQLQuery, con);
                int res = com.ExecuteNonQuery();
                if (res != 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Congratulations..!','Marks Details Updated Successfully','success');", true);
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