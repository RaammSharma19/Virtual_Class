using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddressBook_EditAddressBook : System.Web.UI.Page
{
    /*Page Load Event*/
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

    /*Roll No. Text Changed Event*/
    protected void rno_TextChanged(object sender, EventArgs e)
    {
        string rn = rno.Text;

        if(CheckRollNo(rn))
        {
            dob.TextMode = TextBoxMode.SingleLine;

            string cls = rno.Text;
            string name = cls.Substring(0,4);
            Class.Text = name;
            Class.ReadOnly = true;


            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Congrats..!!','Student Is Already Registered. You Can Proceed To Fill Address Book Details','success');", true);

            string constr = ConfigurationManager.ConnectionStrings["VirtualClass"].ConnectionString;

            SqlConnection con = new SqlConnection(constr);
            string query = "SELECT FirstName,MiddleName,LastName,Gender,Dob,MobileNo,Email FROM Student WHERE RollNo = '" + rn+"';";
            SqlCommand com = new SqlCommand(query, con);
            SqlDataReader Dr;

            con.Open();

            Dr = com.ExecuteReader();
            while (Dr.Read())
            {

                fn.Text = Dr["Firstname"].ToString();
                mn.Text = Dr["Middlename"].ToString();
                ln.Text = Dr["Lastname"].ToString();
                dob.Text = Dr["Dob"].ToString();
                mno.Text = Dr["MobileNo"].ToString();
                email.Text = Dr["Email"].ToString();
            }
            con.Close();

            fn.ReadOnly = true;
            mn.ReadOnly = true;
            ln.ReadOnly = true;
            dob.ReadOnly = true;
            mno.ReadOnly = true;
            email.ReadOnly = true;
            Class.ReadOnly = true;
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Oops..','Please Register The STUDENT.Before Proceeding To Fill Address Book Details','error');", true);
            rno.Text = "";
        }
        fatname.Text = mn.Text;
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

    /*Submit Button Clicked Event*/
    protected void submit_Click(object sender, ImageClickEventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["VirtualClass"].ConnectionString;

        SqlConnection con = new SqlConnection(constr);
        con.Open();
        string SQLQuery = "UPDATE Student SET Class='"+Class.Text.ToUpper()+"',FatherName='"+fatname.Text.ToUpper()+"',MotherName='"+motname.Text.ToUpper()+"',Category='"+cat.Text+"',Religion='"+rel.Text+"',MaritalStatus='"+marstat.Text+"',Address='"+address.Text+"',District='"+district.Text+"',State='"+State.Text+"',Pincode='"+pin.Text+"'WHERE RollNo='"+rno.Text+"';";
        SqlCommand com = new SqlCommand(SQLQuery, con);
        int res = com.ExecuteNonQuery();
        if (res != 0)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Congrats..!','Student Details Uploaded Successfully.','success');", true);
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Oops..!','Something Went Wrong.','error');", true);
        }
        con.Close();
    }
}