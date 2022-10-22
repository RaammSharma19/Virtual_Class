using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class recover : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "swal({ title: 'Warning..!', text: 'This Page Recovers Password Only For Students.', imageUrl: 'Images/student.png'});", true);
        }
    }


    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        DateTime db = Convert.ToDateTime(dob.Text);
        if (checkDetails(un.Text,db.ToString()))
        {
            string pw = CreatePassword(8);
            string constr = ConfigurationManager.ConnectionStrings["VirtualClass"].ConnectionString;

            SqlConnection con = new SqlConnection(constr);
            con.Open();
            string SQLQuery = "UPDATE Student SET Password='" + pw + "' WHERE Username='" + un.Text + "';";
            SqlCommand com = new SqlCommand(SQLQuery, con);
            int res = com.ExecuteNonQuery();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Congrats..!','Password Changed Successfully.','success');", true);
            Label1.Text = pw;
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Oops..!','Please Provide Correct Details.','error');", true);
        }
    }


    /*Check Details*/
    private bool checkDetails(string UserName, string DOB)
    {
        bool boolReturnValue = false;
        string constr = ConfigurationManager.ConnectionStrings["VirtualClass"].ConnectionString;

        SqlConnection con = new SqlConnection(constr);
        String SQLQuery = "SELECT Username, Dob FROM Student";
        SqlCommand com = new SqlCommand(SQLQuery, con);
        SqlDataReader Dr;

        con.Open();

        Dr = com.ExecuteReader();
        while (Dr.Read())
        {
            if ((UserName.ToUpper() == Dr["Username"].ToString().ToUpper()) & (DOB == Dr["Dob"].ToString()))
            {
                boolReturnValue = true;
            }
        }
        con.Close();
        return boolReturnValue;
    }

    /*Generate Password */
    public string CreatePassword(int length)
    {
        const string valid = "abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        StringBuilder res = new StringBuilder();
        Random rnd = new Random();
        while (0 < length--)
        {
            res.Append(valid[rnd.Next(valid.Length)]);
        }
        return res.ToString();
    }
}