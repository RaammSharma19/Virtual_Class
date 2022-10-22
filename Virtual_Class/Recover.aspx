<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Recover.aspx.cs" Inherits="recover" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Recover Password : Virtual Class</title>
    <link rel="icon" href="/Images/title.ico" />


    <script src="../Scripts/jquery-3.1.1.js"></script>
    <script src="Scripts/sweetalert.min.js"></script>

    <script type="text/javascript">
        $(function () {
            $("#abt").click(function (e) {
                swal({
                    title: "ABOUT US",
                    text: "<span style='color: #2B9FC4'> ©Virtual Class is a utility tool designed for a department of a college for managing student details by head of the department. <br> And it also provides many features for students. <span>",
                    html: true
                });
            });
        });
    </script>

    <script type="text/javascript">
        $(function () {
            $("#contact").click(function (e) {
                swal({
                    title: "CONTACT",
                    text: "<span style='color: #2B9FC4'> ©Virtual Class <br> Designed by : Ram Sharma <br> Mobile No. : 8898879938 <br> E-mail : ramsharma0194@gmail.com<span>",
                    html: true
                });
            });
        });
    </script>


    <style>
        #container {
            width: 450px;
            padding: 0px;
            background: gainsboro;
            margin: 0 auto;
            margin-top: 10px;
            border: 1px solid #c4cddb;
            border-top-color: #d3dbde;
            border-bottom-color: #bfc9dc;
            box-shadow: 0 1px 1px #ccc;
            border-radius: 15px;
            position: relative;
        }

        #about {
            width: 1200px;
            padding: 0px;
            background-color: gainsboro;
            margin: auto;
            margin-top: 30px;
            margin-bottom: 30px;
            border: 1px solid #c4cddb;
            border-top-color: #d3dbde;
            border-bottom-color: #bfc9dc;
            box-shadow: 0 1px 1px #ccc;
            border-radius: 15px;
            position: relative;
            text-align: center;
        }

        .auto-style1 {
            margin-left: 125px;
        }

        .auto-style6 {
            text-align: left;
            width: 1300px;
        }

        .auto-style7 {
            color: #33CC33;
        }

        .auto-style8 {
            border-radius: 25px;
            border: 2px solid #73AD21;
            margin-left: 55px;
        }

        .auto-style9 {
            color: #FF0000;
        }
        .auto-style10 {
            text-align: center;
        }
        .auto-style11 {
            color: #99CC00;
        }
    </style>
    <link href="Style/Style.css" rel="stylesheet" />
    <link href="Style/sweetalert.css" rel="stylesheet" />
</head>
<body>

    <div class="auto-style6">

        <asp:Image ID="logo" runat="server" ImageUrl="~/images/logo.png" Height="170px" Width="640px" />

    </div>

    <div class="topnav" id="myTopnav">
        <a href="login.aspx">Login</a>
        <a id="contact" href="#" style="float: right">Contact</a>
        <a id="abt" href="#" style="float: right">About Us</a>
    </div>

    <div id="container">
        <h1>PASSWORD RECOVERY </h1>
        <form id="form1" runat="server">
            <ul>
                <li class="blink_me">* is mandatory field.</li>
                <li class="auto-style7">Enter Following details to recover your password.</li>
                <li>
                    <asp:TextBox CssClass="auto-style8" ID="un" runat="server" placeholder="USERNAME" required="true" Width="200px" pattern=".{0}|.{3,}" title="i.e. field should contain minimum 3 letters"></asp:TextBox>
                    <span class="auto-style9">*</span></li>
                <li>DOB -
                    <asp:TextBox CssClass="round" ID="dob" runat="server" placeholder="DATE OF BIRTH" TextMode="Date" required="true"></asp:TextBox>
                    <span class="auto-style9">*</span></li>
                <li class="auto-style10"><span class="auto-style11">YOUR NEW PASSWORD&nbsp; </span><asp:Label ID="Label1" runat="server" Text="Will Appear Here" CssClass="auto-style12" style="color: #00CCFF; font-size: xx-large"></asp:Label>
                </li>
                <li class="auto-style1">
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="86px" ImageUrl="~/images/recover.png" Width="165px" title="Click here to recover the password." OnClick="ImageButton1_Click" />
                </li>
            </ul>
        </form>
    </div>

    <div id="about">
        <p>
            <span class="li">Designed,Devoloped and Maintained by..</span><br />
            <u><span class="lb">Ram Sharma</span></u>
        </p>
    </div>

</body>
</html>
