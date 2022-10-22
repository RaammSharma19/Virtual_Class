<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddDocument.aspx.cs" Inherits="DocumentLibrary_AddDocument" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Add Document : Virtual Office</title>
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
        .auto-style8 {
            text-align: center;
            width: 310px;
            color: #00FF00;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div id="container">
        <h1>ADD DOCUMENT</h1>
        <ul>
            <li class="blink_me">* is mandatory field.</li>
            <li class="auto-style8">Fill the details to add a file.</li>
            <li class="auto-style8">
                <asp:TextBox ID="Class" runat="server" CssClass="round" placeholder="Enter Standard" required="true" pattern="(^FYIT|^SYIT|^TYIT|^FYCS|^SYCS|^TYCS)$" title="i.e. Field Should Contain Only FYIT,SYIT,TYIT or FYCS,SYCS,TYCS. " MaxLength="4"></asp:TextBox>
                <span class="auto-style6">*</span></li>
            <li class="auto-style7">
                <asp:TextBox ID="title" runat="server" CssClass="round" placeholder="Enter Document Title" required="true" pattern=".{0}|.{5,}" title="i.e. field should contain minimum 5 letters"></asp:TextBox><span class="auto-style6">*</span></li>
            <li class="auto-style7">
                <asp:TextBox ID="description" runat="server" AutoCompleteType="Cellular" CssClass="round" placeholder="Enter Description Of Document" required="true" pattern=".{0}|.{15,}" title="i.e. field should contain minimum 15 letters"></asp:TextBox>
                <span class="auto-style6">*</span></li>
            <li class="auto-style7">
                <asp:TextBox ID="url" runat="server" TextMode="Url" CssClass="round" required="true" placeholder="Enter URL Of Document" pattern=".{0}|.{15,}" title="i.e. field should contain minimum 15 letters"></asp:TextBox><span class="auto-style6">*</span>
            </li>
            <li class="auto-style7">
                <asp:ImageButton ID="submit" runat="server" AlternateText="SUBMIT" Height="50px" ImageUrl="~/images/submit.png" Width="185px" title="Click here to Submit." OnClick="submit_Click" />
            </li>
        </ul>
    </div>
</asp:Content>

