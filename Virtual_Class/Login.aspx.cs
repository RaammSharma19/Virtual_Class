using System;
using System.Web.UI;
using System.Configuration;
using System.Data.SqlClient;

public partial class login : System.Web.UI.Page
{
    /*Page Load Event*/
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["un"] != null && Session["type"].Equals("ADMIN"))
        {
            Response.Redirect("/Admin/Home.aspx");
        }
        else if (Session["un"] != null && Session["type"].Equals("STUDENT"))
        {
            Response.Redirect("/Student/Home.aspx");
        }
    }

    /*Login Button Event*/
    protected void loginbutton_Click(object sender, ImageClickEventArgs e)
    {
        string username, password, type;
        username = logun.Text;
        password = logpw.Text;
        type = userType.SelectedValue;

        if (type == "ADMIN")
        {
            if (CheckloginAdmin(username, password))
            {
                Session["un"] = username.ToUpper();
                Session["pw"] = password;
                Session["type"] = type;

                Response.Redirect("/Admin/Home.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Oops..','Please enter Username And Password Coorectly','error');", true);
            }
        }

        if (type == "STUDENT")
        {
            if (CheckloginStudent(username, password))
            {
                Session["un"] = username.ToUpper();
                Session["pw"] = password;
                Session["RollNo"] = username.ToUpper();
                Session["type"] = type;

                Response.Redirect("/Student/Home.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Oops..','Please enter the Username And Password Coorectly','error');", true);
            }
        }
    }

    /* Login for Admin*/
    private bool CheckloginAdmin(string UserName, string Password)
    {
        bool boolReturnValue = false;
        string constr = ConfigurationManager.ConnectionStrings["VirtualClass"].ConnectionString;

        SqlConnection con = new SqlConnection(constr);
        String SQLQuery = "SELECT Username, Password FROM Admin";
        SqlCommand com = new SqlCommand(SQLQuery, con);
        SqlDataReader Dr;

        con.Open();

        Dr = com.ExecuteReader();
        while (Dr.Read())
        {
            if ((UserName.ToUpper() == Dr["Username"].ToString().ToUpper()) & (Password == Dr["Password"].ToString()))
            {
                boolReturnValue = true;
            }
        }
        con.Close();
        return boolReturnValue;
    }

    /* Login for Student*/
    private bool CheckloginStudent(string UserName, string Password)
    {
        bool boolReturnValue = false;
        string constr = ConfigurationManager.ConnectionStrings["VirtualClass"].ConnectionString;

        SqlConnection con = new SqlConnection(constr);
        String SQLQuery = "SELECT Username, Password FROM Student";
        SqlCommand com = new SqlCommand(SQLQuery, con);
        SqlDataReader Dr;

        con.Open();

        Dr = com.ExecuteReader();
        while (Dr.Read())
        {
            if ((UserName.ToUpper() == Dr["Username"].ToString().ToUpper()) & (Password == Dr["Password"].ToString()))
            {
                boolReturnValue = true;
            }
        }
        con.Close();
        return boolReturnValue;
    }

}