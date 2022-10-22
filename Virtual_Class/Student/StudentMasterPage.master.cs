using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_StudentMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        userText.Text = "Logged In As " + Session["un"].ToString();

    }

    protected void logout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("/login.aspx");
    }

    protected void viewDetails_Click(object sender, EventArgs e)
    {
        string url = "/AddressBook/ViewStudentDetails.aspx";
        string s = "window.open('" + url + "', 'Student_window', 'width=900,height=600,left=200,top=50,resizable=0');";
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "script", s, true);
    }

    protected void viewDocument_Click(object sender, EventArgs e)
    {
        Session["Class"] = Session["un"].ToString().Substring(0, 4);
        string url = "/DocumentLibrary/ViewDocuments.aspx";
        string s = "window.open('" + url + "', 'document_window', 'width=900,height=600,left=200,top=50,resizable=0');";
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "script", s, true);
    }

    protected void viewAttendance_Click(object sender, EventArgs e)
    {
        Session["Class"] = Session["un"].ToString().Substring(0, 4);
        string url = "/Attendance/AttendanceReportByRollNo.aspx";
        string s = "window.open('" + url + "', 'Attendance_window', 'width=900,height=600,left=200,top=50,resizable=0');";
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "script", s, true);
    }

    protected void viewAssignment_Click(object sender, EventArgs e)
    {
        string url = "/Assignments/ViewAssignment.aspx";
        string s = "window.open('" + url + "', 'Assignments_window', 'width=900,height=600,left=200,top=50,resizable=0');";
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "script", s, true);
    }
}
