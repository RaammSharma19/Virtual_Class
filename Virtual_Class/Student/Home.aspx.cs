using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       /* ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "swal({ title: '!!..Greetings..!!', text: 'Wish You Many Manny Happy Returns Of The Day.', imageUrl: 'Images/student.png'});", true);
       */
        if (Session["un"] == null)
        {
            Response.Redirect("/login.aspx");
        }
        if (!IsPostBack)
        {
            hellotxt.Text = hellotxt.Text + Session["un"] + ",";
        }
      /*  string dob = CheckBirthDate();
        DateTime db = Convert.ToDateTime(dob);

        if(db.ToShortDateString() == DateTime.Today.ToShortDateString())
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "swal({ title: '!!..Greetings..!!', text: 'Wish You Many Manny Happy Returns Of The Day.', imageUrl: 'Images/birthday.gif'});", true);
        }*/
    }

    /*Check for birth day*/
    private string CheckBirthDate()
    {
        string dob;
        string constr = ConfigurationManager.ConnectionStrings["VirtualClass"].ConnectionString;

        SqlConnection con = new SqlConnection(constr);
        String SQLQuery = "SELECT Dob FROM Student Where RollNo = '"+Session["un"]+"';'";
        SqlCommand com = new SqlCommand(SQLQuery, con);
        SqlDataReader Dr;

        con.Open();

        Dr = com.ExecuteReader();
        dob = Dr["Dob"].ToString();
        con.Close();
        return dob;
    }
}