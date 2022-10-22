<%@ Page Title="" Language="C#" MasterPageFile="~/Student/StudentMasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Student_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>HOME-STUDENTS : Virtual Class</title>
    <style>
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
        <h1>STUDENT PORTAL : Virtual Office</h1>
        <table class="auto-style5">
            <tr>
                <td class="auto-style6" style="vertical-align: top">
                    <asp:Label ID="hellotxt" runat="server" Text="Hello " CssClass="auto-style7"></asp:Label>
                    <br />
                    <br />
                    <br />
                    <br />
                    <span class="auto-style8">Welcome to Virtual Class.</span></td>
                <td>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/ComputerLab.jpg" Height="520px" ImageAlign="Right" Width="740px" /></td>
            </tr>
        </table>
    </div>
</asp:Content>

