<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Admin_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>REGISTER A STUDENT : Virtual Class</title>

    <script src="../scripts/jquery-3.1.1.js"></script>
    <script src="../Scripts/DateLimit.js"></script>
    <script src="../Scripts/PasswordStrength.js"></script>

    <script type="text/javascript">         //Firstname validator
        $(document).ready(function () {
            jQuery('input[id$=fn]').on('keyup keydown keypress', function () {
                this.value = this.value.replace(/[^a-zA-Z]/g, function (str) { $("#err").html("Use Only ALPHABETS").show().fadeOut("slow"); return ''; });
                if ($(this).val().length > 15) {
                    sweetAlert("Oops...", "Not allowed more than 15 characters", "error");
                    $(this).val($(this).val().substring(0, 15));
                }
            });
        });
    </script>
        <script type="text/javascript">         //Middlename validator
        $(document).ready(function () {
            jQuery('[id$=mn]').on('keyup keydown keypress', function () {
                this.value = this.value.replace(/[^a-zA-Z]/g, function (str) { $("#err1").html("Use Only ALPHABETS").show().fadeOut("slow"); return ''; });
                if ($(this).val().length > 15) {
                    sweetAlert("Oops...", "Not allowed more than 15 characters", "error");
                    $(this).val($(this).val().substring(0, 15));
                }
            });
        });
    </script>
        <script type="text/javascript">         //Lastname validator
        $(document).ready(function () {
            jQuery('input[id$=ln]').on('keyup keydown keypress', function () {
                this.value = this.value.replace(/[^a-zA-Z]/g, function (str) { $("#err2").html("Use Only ALPHABETS").show().fadeOut("slow"); return ''; });
                if ($(this).val().length > 15) {
                    sweetAlert("Oops...", "Not allowed more than 15 characters", "error");
                    $(this).val($(this).val().substring(0, 15));
                }
            });
        });
    </script>

    <script type="text/javascript">         //Mobile no. Digits
        $(document).ready(function () {
            $("input[id$=cno]").on('keypress', function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    $("#errmsg").html("Enter Valid Mobile Number.").show().fadeOut("600");
                    return false;
                }
            });
        });
    </script>

    <style>
        #container {
            width: 850px;
            height: 770px auto;
            padding: 0px;
            background-color: gainsboro;
            margin: 0 auto;
            margin-top: 20px;
            margin-bottom: 20px;
            border: 1px solid #c4cddb;
            border-top-color: #d3dbde;
            border-bottom-color: #bfc9dc;
            box-shadow: 0 1px 1px #ccc;
            border-radius: 15px;
            position: relative;
        }

        .auto-style2 {
            height: 35px;
        }

        .auto-style3 {
            border-radius: 25px;
            border: 2px solid #73AD21;
        }

        .auto-style4 {
            margin-left: 190px;
        }

        .auto-style10 {
            color: #FF0000;
        }

        .auto-style11 {
            margin-left: 60px;
        }

        .auto-style12 {
            color: #33CC33;
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
        <h1>REGISTRATION</h1>
        <ul>
            <li class="blink_me">* is mandatory field.</li>
            <li class="auto-style13">Enter following details to register a student</li>
            <li><span class="auto-style12">Enter ROLL NO. :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;
                    <asp:TextBox ID="rno" runat="server" CssClass="round" placeholder="Roll No." required="true" pattern="(^FYIT|^FYCS|^SYIT|^SYCS|^TYIT|^TYCS)([0-9]{6}$)" title="It Should start with FYIT,,SYIT,TYIT or FYCS,SYCS,TYCS and should contain 10" MaxLength="10" AutoPostBack="True" OnTextChanged="rno_TextChanged" OnKeyDown="return (event.keyCode!=13);"></asp:TextBox>
                <span class="auto-style10">*</span></li>
            <li class="auto-style11">
                <span class="auto-style12">First Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                <asp:TextBox ID="fn" runat="server" CssClass="round" placeholder="First Name" required="true" pattern=".{0}|.{3,}" title="i.e. field should contain minimum 3 letters"></asp:TextBox>
                <span id="err" class="auto-style10">*</span></li>
            <li class="auto-style11">
                <span class="auto-style12">Middle Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><asp:TextBox ID="mn" runat="server" CssClass="round" placeholder="Middle Name" required="true" pattern=".{0}|.{3,}" title="i.e. field should contain minimum 3 letters"></asp:TextBox>
                <span id="err1" class="auto-style10">*</span></li>
            <li class="auto-style11">
                <span class="auto-style12">Last Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><asp:TextBox ID="ln" runat="server" CssClass="round" placeholder="Last Name" required="true" pattern=".{0}|.{3,}" title="i.e. field should contain minimum 3 letters"></asp:TextBox>
                <span id="err2" class="auto-style10">*</span></li>
            <li class="auto-style2"><span class="auto-style12">Gender :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:DropDownList ID="gender" runat="server" CssClass="auto-style3" Height="30px" Width="200px" title="Select Gender">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                <span class="auto-style10">*</span></li>
            <li><span class="auto-style12">Enter DOB :&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="dob" runat="server" CssClass="round" TextMode="Date" placeholder="Date Of Birth" required="true" min="1980-01-01" max="2016-12-12"></asp:TextBox>
                <span class="auto-style10">*</span></li>
            <li><span class="auto-style12">Enter Mobile NO. :</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="cno" runat="server" CssClass="round" placeholder="Contact No." required="true" pattern=".{0}|.{10,}" title="i.e. field should contain minimum and maximum 10 letters" MaxLength="10"></asp:TextBox>
                <span id="errmsg" class="auto-style10">*</span></li>
            <li><span class="auto-style12">Enter E-Mail :&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="email" runat="server" CssClass="round" placeholder="E-Mail" required="true" TextMode="Email"></asp:TextBox>
                <span class="auto-style10">*</span></li>
            <li><span class="auto-style12">Enter User-ID :&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="uid" runat="server" CssClass="round" placeholder="User Id" required="true" pattern=".{0}|.{6,}" title="i.e. field should contain minimum 6 letters"></asp:TextBox>
                <span class="auto-style10">*</span></li>
            <li><span class="auto-style12">Enter Password :&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="passw" runat="server" CssClass="round" placeholder="Password" required="true" TextMode="Password" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"></asp:TextBox>
                <span class="auto-style10">*</span>
                <div style="display: flex; justify-content: center;">
                    <div id="pswd_info">
                        <h4>Password must meet the following requirements:</h4>

                        <span id="letter" class="invalid">At least <strong>one letter</strong></span><br />
                        <span id="capital" class="invalid">At least <strong>one capital letter</strong></span><br />
                        <span id="number" class="invalid">At least <strong>one number/Special Charecter</strong></span><br />
                        <span id="length" class="invalid">Be at least <strong>8 characters</strong></span><br />

                    </div>
                </div>
            </li>
            <li class="auto-style4">
                <asp:ImageButton ID="register" runat="server" Height="65px" ImageUrl="~/images/register.png" Width="200px" title="click here to register" OnClick="register_Click" />
            </li>
        </ul>
    </div>

</asp:Content>
