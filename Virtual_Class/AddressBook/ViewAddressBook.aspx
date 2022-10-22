<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewAddressBook.aspx.cs" Inherits="ViewAddressBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>View Address Book : Virtual Office</title>
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

        .auto-style5 {
            color: #00FF00;
        }

        .auto-style6 {
            color: #FF0000;
        }

        .auto-style7 {
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div id="container">
        <h1>ADDRESS BOOK</h1>
        <ul>
            <li class="blink_me">* is mandatory field.</li>
            <li><span class="auto-style5">Enter Roll No. To VIEW Details</span></li>
            <li class="auto-style7">
                <asp:TextBox ID="rno" runat="server" CssClass="round" placeholder="Enter Roll NO." required="true" pattern="(^FYIT|^SYIT|^TYIT|^FYCS|^SYCS|^TYCS)([0-9]{6}$)" title="It Should start with FYIT,SYIT,TYIT or FYCS,SYCS,TYCS and should contain 10" MaxLength="10"></asp:TextBox><span id="errmsg" class="auto-style6">*</span></li>
            <li class="auto-style7">
                <asp:ImageButton ID="submit" runat="server" AlternateText="SUBMIT" Height="50px" ImageUrl="~/images/submit.png" Width="185px" title="Click here to Submit."  OnClick="submit_Click"/>
            </li>
            <li class="auto-style7">--OR--</li>
            <li class="auto-style7">
                <a href="/AddressBook/ViewStudent.aspx" class="button">VIEW ALL</a></li>
        </ul>
    </div>

</asp:Content>
