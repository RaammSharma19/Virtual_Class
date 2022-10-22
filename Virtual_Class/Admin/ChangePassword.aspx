<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Admin_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Change Password : Virtual Office</title>
    <script src="../Scripts/PasswordStrength.js"></script>

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

        .auto-style9 {
            width: 224px;
            margin-left: 90px;
        }

        .auto-style11 {
            color: #FF0000;
        }

        .auto-style12 {
            text-align: center;
        }

        .auto-style13 {
            text-align: center;
            color: #33CC33;
        }
    </style>
    <link href="../Style/PasswordStrength.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">

    <div id="container">
        <h1>CHANGE PASSWORD</h1>
        <ul>
            <li class="blink_me">* is mandatory field.</li>
            <li class="auto-style13">Enter Following Details To Change Your PASSWORDD</li>
            <li class="auto-style12">

                <asp:TextBox ID="opw" runat="server" CssClass="round" placeholder="Old Password" required="true" TextMode="Password" pattern=".{0}|.{8,}" title="i.e. field should contain minimum 8 letters"></asp:TextBox>

                <span class="auto-style11">*</span></li>
            <li class="auto-style12">

                <asp:TextBox ID="passw" runat="server" CssClass="round" placeholder="New Password" required="true" TextMode="Password" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$">></asp:TextBox>

                <span class="auto-style11">*</span>
                <div id="pswd_info">
                    <h4>Password must meet the following requirements:</h4>

                    <span id="letter" class="invalid">At least <strong>one letter</strong></span><br />
                    <span id="capital" class="invalid">At least <strong>one capital letter</strong></span><br />
                    <span id="number" class="invalid">At least <strong>one number/Special Charecter</strong></span><br />
                    <span id="length" class="invalid">Be at least <strong>8 characters</strong></span><br />

                </div>
            </li>
            <li class="auto-style12">

                <asp:TextBox ID="rnpw" runat="server" CssClass="round" placeholder="Re-Type New Password" required="true" TextMode="Password" pattern=".{0}|.{8,}" title="i.e. field should contain minimum 8 letters"></asp:TextBox>

                <span class="auto-style11">*</span>

                <asp:CompareValidator ID="ValidateRPW" runat="server" ControlToCompare="passw" ControlToValidate="rnpw" Display="Dynamic" ErrorMessage="New Password And New Password Should Match." Font-Strikeout="False" Font-Underline="True" ForeColor="Red"></asp:CompareValidator>

            </li>
            <li class="auto-style9">
                <asp:ImageButton ID="changepw" runat="server" AlternateText="CHANGE PASSWORD" Height="40px" ImageUrl="~/images/cp.png" Width="215px" title="Click here to Change PASSWORD" OnClick="changepw_Click" />
            </li>
        </ul>
    </div>

</asp:Content>
