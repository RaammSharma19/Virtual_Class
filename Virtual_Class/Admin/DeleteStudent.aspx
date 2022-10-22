<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="DeleteStudent.aspx.cs" Inherits="Admin_DeleteStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Delete A student : Virtual Office</title>

    <style>
        #container {
            width: 400px;
            margin: 20px auto;
            padding: 0px;
            background: #e8ecf3;
            border: 1px solid #c4cddb;
            border-top-color: #d3dbde;
            border-bottom-color: #bfc9dc;
            box-shadow: 0 1px 1px #ccc;
            border-radius: 15px;
            position: relative;
        }

        .auto-style1 {
            text-align: right;
        }

        .auto-style5 {
            color: #00FF00;
        }

        .auto-style6 {
            color: #FF0000;
        }

        .auto-style7 {
            text-align: center;
        }

        .auto-style8 {
            margin-left: 39px;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">

    <div id="container">
        <h1>DELETE STUDENT</h1>
            <ul>
                <li class="blink_me">* is mandatory field.</li>
                <li><span class="auto-style5">Enter Roll No. to Delete Student's Records.</span></li>
                <li class="auto-style7">
                    <asp:TextBox ID="rno" runat="server" CssClass="round" placeholder="Enter Roll NO." required="true" pattern="(^FYIT|^FYCS|^SYIT|^SYCS|^TYIT|^TYCS)([0-9]{6}$)" title="It Should start with FYIT,,SYIT,TYIT or FYCS,SYCS,TYCS and should contain 10" MaxLength="10"></asp:TextBox><span class="auto-style6">*</span></li>
                <li>
                    <asp:ImageButton ID="submit" runat="server" AlternateText="SUBMIT" Height="50px" ImageUrl="~/images/submit.png" Width="185px" title="Click here to Submit." CssClass="auto-style8" OnClick="submit_Click" OnClientClick="return confirm('This Will Delete All Details Of Student Such As Address Book details,Attendances records etc. ARE YOU SURE? YOU WANT TO CONTINUE.?')" />
                </li>
            </ul>
    </div>

</asp:Content>

