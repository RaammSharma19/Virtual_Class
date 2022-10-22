<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="CreateAdmin.aspx.cs" Inherits="Admin_CreateAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <title>Create Admin : Virtual Class</title>
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
    </style>
    <link href="../Style/PasswordStrength.css" rel="stylesheet" />

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">

    <div id="container">
        <h1>CREATE ADMIN</h1>
        <ul>
            <li class="auto-style9">* is mandatory field.</li>
            <li class="auto-style10">Fill the form to Create Admin.
            </li>
            <li class="auto-style8">

                <asp:TextBox ID="un" runat="server" CssClass="round" placeholder="Enter UserName" required="true" pattern=".{0}|.{6,}" title="i.e. field should contain minimum 6 letters" OnTextChanged="un_TextChanged" AutoPostBack="True"  OnKeyDown="return (event.keyCode!=13);"></asp:TextBox>

                <span class="auto-style7">*</span></li>
            <li class="auto-style8">

                <asp:TextBox ID="passw" runat="server" CssClass="round" placeholder="Enter Password" required="true" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" TextMode="Password"></asp:TextBox>

                <span class="auto-style7">*</span>
                <div id="pswd_info">
                    <h4>Password must meet the following requirements:</h4>

                    <span id="letter" class="invalid">At least <strong>one letter</strong></span><br />
                    <span id="capital" class="invalid">At least <strong>one capital letter</strong></span><br />
                    <span id="number" class="invalid">At least <strong>one number/Special Charecter</strong></span><br />
                    <span id="length" class="invalid">Be at least <strong>8 characters</strong></span><br />

                </div>
            </li>
            <li class="auto-style8">

                <asp:TextBox ID="rpw" runat="server" CssClass="round" placeholder="Re-Enter Password" required="true" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" TextMode="Password"></asp:TextBox>

                <span class="auto-style7">*<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="passw" ControlToValidate="rpw" Display="Dynamic" ErrorMessage="Password And Re-Enter Password Should Match"></asp:CompareValidator>
                </span></li>

            <li class="auto-style8">
                <asp:ImageButton ID="submit" runat="server" AlternateText="SUBMIT" Height="50px" ImageUrl="~/Images/submit.png" Width="210px" OnClick="submit_Click" />
            </li>
        </ul>
    </div>

</asp:Content>

