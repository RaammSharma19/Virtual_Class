using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Attendance_ViewAttendance : System.Web.UI.Page
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

    protected void submit_Click(object sender, ImageClickEventArgs e)
    {
        Session["RollNo"] = rno.Text;
        string url = "/Attendance/AttendanceReportByRollNo.aspx";
        string s = "window.open('" + url + "', 'attendance_window', 'width=900,height=600,left=200,top=50,resizable=0');";
        ClientScript.RegisterClientScriptBlock(this.GetType(), "script", s, true);
    }
}