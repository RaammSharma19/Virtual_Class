<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="/Images/title.ico" />
    <title>Login : Virtual Class</title>

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
            width: 500px;
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

        .auto-style4 {
            text-align: left;
            width: 1300px;
        }

        .auto-style5 {
            color: #868686;
            text-align: center;
        }

        .auto-style7 {
            color: #33CC33;
        }

        .auto-style8 {
            color: #FF0000;
            text-align: right;
        }

        .auto-style12 {
            text-align: center;
        }
        .auto-style13 {
            margin-left: 90px;
            width: 360px;
            text-align: center;
        }
    </style>
    <link href="Style/Style.css" rel="stylesheet" type="text/css" />
    <link href="Style/sweetalert.css" rel="stylesheet" />
</head>
<body>

    <div class="auto-style4">
        <asp:Image ID="logo" runat="server" ImageUrl="~/images/logo.png" Height="170px" Width="640px" />
    </div>

    <div class="topnav" id="myTopnav">
        <a id="contact" href="#" style="float: right">Contact</a>
        <a id="abt" href="#" style="float: right">About Us</a>
    </div>

    <div id="container">
        <h1>LOGIN </h1>
        <form id="form1" runat="server">
            <ul>
                <li class="auto-style8"><span class="blink_me">Login Details are Case Sensitive. </span></li>
                <li class="auto-style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="auto-style7"> Login into Virtual Class </span></li>
                <li class="auto-style5"><span class="auto-style7">User Type :</span>
                    <asp:DropDownList ID="userType" runat="server" CssClass="round" required="true">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>ADMIN</asp:ListItem>
                        <asp:ListItem>STUDENT</asp:ListItem>
                    </asp:DropDownList>
                </li>
                <li class="auto-style12">
                    <asp:TextBox CssClass="round" ID="logun" runat="server" placeholder="USERNAME" required="true" pattern=".{0}|.{6,}" title="i.e. field should contain minimum 6 letters"></asp:TextBox>
                </li>
                <li class="auto-style12">
                    <asp:TextBox CssClass="round" ID="logpw" runat="server" placeholder="PASSWORD" TextMode="Password" required="true" pattern=".{0}|.{8,}" title="i.e. field should contain minimum 8 letters"></asp:TextBox>
                </li>
                <li class="auto-style13">
                    <asp:ImageButton ID="loginbutton" runat="server" Height="46px" ImageUrl="~/images/login.png" Width="156px" title="Click here to login" AlternateText="LOGIN" OnClick="loginbutton_Click" />
                </li>
                <li class="auto-style13">
                    <a href="recover.aspx" title="Click here to recover your password.">FORGET PASSWORD.?
                    </a>
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
