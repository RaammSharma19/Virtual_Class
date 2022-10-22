<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Admin_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>HOME-ADMIN : Virtual Class</title>
    <style type="text/css">
        #container {
            width: 1300px;
            height: 580px;
            padding: 0px;
            margin-top: 20px;
            margin: 20px auto;
            background: #e8ecf3;
            border: 1px solid #c4cddb;
            border-top-color: #d3dbde;
            border-bottom-color: #bfc9dc;
            box-shadow: 0 1px 1px #ccc;
            border-radius: 15px;
            position: relative;
        }

        .auto-style5 {
            width: 100%;
        }

        .auto-style6 {
            margin-top: 10px;
            width: 560px;
        }

        .auto-style7 {
            font-size: 34pt;
            color: #33CC33;
        }

        .auto-style8 {
            font-size: x-large;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div id="container">
        <h1>HOME : Virtual Office</h1>
        <table class="auto-style5">
            <tr>
                <td class="auto-style6" style="vertical-align: top">
                    <asp:label id="hellotxt" runat="server" text="Hello " cssclass="auto-style7"></asp:label>
                    <br />
                    <br />
                    <br />
                    <br />
                    <span class="auto-style8">Welcome to Virtual Class.</span></td>
                <td>
                    <asp:image id="Image1" runat="server" imageurl="~/Images/ComputerLab.jpg" height="520px" imagealign="Right" width="740px" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

