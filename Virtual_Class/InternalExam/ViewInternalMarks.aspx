<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewInternalMarks.aspx.cs" Inherits="InternalExam_ViewInternalMarks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>VIEW Internal Exams RECORDS : Virtual Office</title>

    <style>
        #container {
            width: 450px;
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

        .auto-style6 {
            color: #FF0000;
        }

        .auto-style7 {
            text-align: center;
        }

        .auto-style8 {
            text-align: center;
            color: #00FF00;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">

     <div id="container">
        <h1>VIEW INTERNAL EXAM RECORDS</h1>
        <ul>
            <li class="blink_me">* is mandatory field.</li>
            <li class="auto-style8">Enter Roll No. To Get Reports</li>
            <li class="auto-style7">
                <asp:textbox id="rno" runat="server" cssclass="round" placeholder="Enter Roll NO." required="true" pattern="(^FYIT|^SYIT|^TYIT|^FYCS|^SYCS|^TYCS)([0-9]{6}$)" title="It Should start with FYIT,SYIT,TYIT or FYCS,SYCS,TYCS and should contain 10" MaxLength="10"></asp:textbox>
                <span class="auto-style6">*</span></li>
            <li class="auto-style7">
                <asp:imagebutton id="submit" runat="server" alternatetext="SUBMIT" height="50px" imageurl="~/images/submit.png" width="185px" title="Click here to Submit." OnClick="submit_Click" />
            </li>
        </ul>
    </div>

</asp:Content>

