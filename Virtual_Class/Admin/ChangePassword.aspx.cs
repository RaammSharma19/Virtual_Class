using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ChangePassword : System.Web.UI.Page
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

    
    /* ChangePassword Button*/
    protected void changepw_Click(object sender, ImageClickEventArgs e)
    {
        string oldPassword = opw.Text;
        string newPassword = passw.Text;
        string Uname = Session["un"].ToString();

        if(changePassword(Uname,oldPassword,newPassword))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Congratulations..!','Password Changed Successfully','success');", true);
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "sweetAlert('Oops..','Please enter details Correctly','error');", true);
        }
    }


    /* ChangePassword Code*/
    protected bool changePassword(string Uname,string OldPassword, string NewPassword)
    {
        string constr = ConfigurationManager.ConnectionStrings["VirtualClass"].ConnectionString;

        SqlConnection con = new SqlConnection(constr);
        String SQLQuery = "SELECT Username, Password FROM Admin";
        SqlCommand com = new SqlCommand(SQLQuery, con);
        SqlDataReader Dr;

        con.Open();

        Dr = com.ExecuteReader();

        while (Dr.Read())
        {
            if ((Uname == Dr["Username"].ToString()) & (OldPassword == Dr["Password"].ToString()))
            {
                Dr.Close();
                String update = "UPDATE Admin SET Password='"+NewPassword+"' WHERE Username='"+Uname+"';";
                SqlCommand upd = new SqlCommand(update, con);
                upd.ExecuteNonQuery();
                return true;
            }
        }
        return false;
    }
}