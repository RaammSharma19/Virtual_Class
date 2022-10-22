<%@ Page Title="" Language="C#" MasterPageFile="/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AssignTask.aspx.cs" Inherits="Assignments_AssignTask" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Assign Task : Virtual Class</title>

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

        .auto-style7 {
            color: #FF0000;
        }
        .auto-style8 {
            text-align: center;
        }
        .auto-style9 {
            animation: blinker 1s linear infinite;
            color: #FF0000;
            text-align: center;
        }
        .auto-style10 {
            text-align: center;
            color: #33CC33;
        }
        .auto-style11 {
            color: #33CC33;
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">

    <div id="container">
        <h1>ASSIGN TASK</h1>
            <ul>
                <li class="auto-style9">* is mandatory field.</li>
                <li class="auto-style10">
                    Fill the form to assign task.
                    </li>
                <li class="auto-style8">

                    <asp:TextBox ID="rollno" runat="server" CssClass="round" placeholder="Enter Roll No." required="true" pattern="(^FYIT|^SYIT|^TYIT)([0-9]{6}$)" title="It Should start with FYIT,SYIT,TYIT and should contain 10" MaxLength="10"></asp:TextBox>

                    <span class="auto-style7">*</span></li>
                <li class="auto-style8">

                    <asp:TextBox ID="subject" runat="server" CssClass="round" placeholder="Subject of assignment" required="true" pattern=".{0}|.{5,}" title="i.e. field should contain minimum 5 letters"></asp:TextBox>

                    <span class="auto-style7">*</span></li>
                <li class="auto-style8">

                    <asp:TextBox ID="description" runat="server" CssClass="round" placeholder="Description" required="true" pattern=".{0}|.{20,}" title="i.e. field should contain minimum 20 letters"></asp:TextBox>

                    <span class="auto-style7">*</span></li>
                <li class="auto-style8">

                    <span class="auto-style11">Last Date Of Submission -</span><asp:TextBox ID="subDate" runat="server" CssClass="round" TextMode="Date" placeholder="Submission Date" required="true" title="Enter Submission Date"  min="2017-01-0" max="2099-12-12"></asp:TextBox>

                    <span class="auto-style7">*</span></li>

                        <li class="auto-style8">
                            <asp:ImageButton ID="submit" runat="server" AlternateText="SUBMIT" title="Click Here To Submit" Height="50px" ImageUrl="~/Images/submit.png" Width="210px" OnClick="submit_Click" />
                        </li>
                    </ul>
    </div>

</asp:Content>