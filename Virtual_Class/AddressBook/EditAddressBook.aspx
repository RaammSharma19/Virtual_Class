<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="EditAddressBook.aspx.cs" Inherits="AddressBook_EditAddressBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <title>Edit Details : Virtual Office</title>

    <script src="../scripts/jquery-3.1.1.js"></script>
    <script src="../Scripts/DateLimit.js"></script>

    <script type="text/javascript">         //Firstname validator
        $(document).ready(function () {
            jQuery('input[id$=fn]').on('keyup keydown keypress', function () {
                this.value = this.value.replace(/[^a-zA-Z]/g, function (str) { $("#err4").html("Use Only ALPHABETS").show().fadeOut("slow"); return ''; });
                if ($(this).val().length > 15) {
                    sweetAlert("Oops...", "Not allowed more than 15 characters", "error");
                    $(this).val($(this).val().substring(0, 15));
                }
            });
        });
    </script>

    <script type="text/javascript">         //Middlename validator
        $(document).ready(function () {
            jQuery('input[id$=mn]').on('keyup keydown keypress', function () {
                this.value = this.value.replace(/[^a-zA-Z]/g, function (str) { $("#err5").html("Use Only ALPHABETS").show().fadeOut("slow"); return ''; });
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
                this.value = this.value.replace(/[^a-zA-Z]/g, function (str) { $("#err6").html("Use Only ALPHABETS").show().fadeOut("slow"); return ''; });
                if ($(this).val().length > 15) {
                    sweetAlert("Oops...", "Not allowed more than 15 characters", "error");
                    $(this).val($(this).val().substring(0, 15));
                }
            });
        });
    </script>

    <script type="text/javascript">         //Fathername validator
        $(document).ready(function () {
            jQuery('input[id$=fatname]').on('keyup keydown keypress', function () {
                this.value = this.value.replace(/[^a-zA-Z]/g, function (str) { $("#err1").html("Use Only ALPHABETS").show().fadeOut("slow"); return ''; });
                if ($(this).val().length > 15) {
                    sweetAlert("Oops...", "Not allowed more than 15 characters", "error");
                    $(this).val($(this).val().substring(0, 15));
                }
            });
        });
    </script>

    <script type="text/javascript">         //Mothername validator
        $(document).ready(function () {
            jQuery('input[id$=motname]').on('keyup keydown keypress', function () {
                this.value = this.value.replace(/[^a-zA-Z]/g, function (str) { $("#err2").html("Use Only ALPHABETS").show().fadeOut("slow"); return ''; });
                if ($(this).val().length > 15) {
                    sweetAlert("Oops...", "Not allowed more than 15 characters", "error");
                    $(this).val($(this).val().substring(0, 15));
                }
            });
        });
    </script>

    <script type="text/javascript">         //district validator
        $(document).ready(function () {
            jQuery('input[id$=district]').on('keyup keydown keypress', function () {
                this.value = this.value.replace(/[^a-zA-Z]/g, function (str) { $("#err3").html("Use Only ALPHABETS").show().fadeOut("slow"); return ''; });
                if ($(this).val().length > 15) {
                    sweetAlert("Oops...", "Not allowed more than 15 characters", "error");
                    $(this).val($(this).val().substring(0, 15));
                }
            });
        });
    </script>

    <script type="text/javascript">         //Mobile no. Digits
        $(document).ready(function () {
            $("input[id$=mno]").on('keypress', function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    $("#errmsg").html("Use Only NUMBERS").show().fadeOut("600");
                    return false;
                }
            });
        });
    </script>

    <script type="text/javascript">         //Mobile no. Digits
        $(document).ready(function () {
            $("input[id$=pin]").on('keypress', function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    $("#errmsg1").html("Use Only NUMBERS").show().fadeOut("600");
                    return false;
                }
            });
        });
    </script>

    <script type="text/javascript">         //Address Validator
        $(document).ready(function () {
            $("textarea[id$=address]").on('focusout', function (e) {

                if ($(this).val().length < 20) {
                    $("#adderr").html("Minimum Length = 20").show().fadeOut("600");
                    $(this).focus();
                    return false;
                }
            });
        });
    </script>
    <style>
        #container {
            width: 850px;
            height: 1200px auto;
            padding: 0px;
            background-color: gainsboro;
            margin: 0 auto;
            margin-top: 10px;
            margin-bottom: 20px;
            border: 1px solid #c4cddb;
            border-top-color: #d3dbde;
            border-bottom-color: #bfc9dc;
            box-shadow: 0 1px 1px #ccc;
            border-radius: 15px;
            position: relative;
        }

        .auto-style9 {
            text-align: center;
        }

        .auto-style10 {
            color: #CC0000;
        }

        .auto-style11 {
            color: #33CC33;
        }

        .auto-style12 {
            border-radius: 25px;
            border: 2px solid #73AD21;
        }

        .auto-style14 {
            color: #FF0000;
        }

        .auto-style15 {
            margin-left: 60px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div id="container">
        <h1>EDIT DETAILS</h1>
        <ul>
            <li class="blink_me">* is mandatory field.</li>
            <li>
                <h3><span class="auto-style11">Personal Details :</span> </h3>
            </li>
            <li><span class="auto-style11">Roll NO. :</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="rno" runat="server" CssClass="round" placeholder="Roll NO." required="true" pattern="(^FYIT|^SYIT|^TYIT|^FYCS|^SYCS|^TYCS)([0-9]{6}$)" title="It Should start with FYIT,SYIT,TYIT or FYCS,SYCS,TYCS and should contain 10" MaxLength="10" AutoPostBack="True" OnTextChanged="rno_TextChanged" OnKeyDown="return (event.keyCode!=13);"></asp:TextBox><span class="auto-style14">*</span>&nbsp;
                <asp:Label runat="server" ID="RollErr" class="auto-style14"></asp:Label></li>
            <li class="auto-style15">
                <span class="auto-style11">First Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>&nbsp;<asp:TextBox ID="fn" runat="server" CssClass="round" placeholder="First Name" required="true" pattern=".{0}|.{3,}" title="i.e. field should contain minimum 3 letters"></asp:TextBox>
                <span id="err4" class="auto-style14">*</span></li>
            <li class="auto-style15">
                <span class="auto-style11">Middle Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                <asp:TextBox ID="mn" runat="server" CssClass="round" placeholder="Middle Name" required="true" pattern=".{0}|.{3,}" title="i.e. field should contain minimum 3 letters"></asp:TextBox>
                <span id="err5" class="auto-style14">*</span></li>
            <li class="auto-style15">
                <span class="auto-style11">Last Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                <asp:TextBox ID="ln" runat="server" CssClass="round" placeholder="Last Name" required="true" pattern=".{0}|.{3,}" title="i.e. field should contain minimum 3 letters"></asp:TextBox>
                <span id="err6" class="auto-style10">*</span></li>
            <li><span class="auto-style11">Gender :</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="gender" runat="server" CssClass="round" title="Select Gender" required="true">
                        <asp:ListItem Value="MALE">Male</asp:ListItem>
                        <asp:ListItem Value="FEMALE">Female</asp:ListItem>
                    </asp:DropDownList><span class="auto-style14">*</span>
            </li>
            <li><span class="auto-style11">Date Of Birth :</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="dob" runat="server" CssClass="round" placeholder="Date Of Birth" required="true" title="Select Date Of Birth" TextMode="Date" min="1980-01-01" max="2016-12-12"></asp:TextBox><span class="auto-style14">*</span>
            </li>
            <li class="auto-style11">Class :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="Class" runat="server" CssClass="round" Placeholder="Standard" required="true" pattern="(^FYIT|^SYIT|^TYIT|^FYCS|^SYCS|^TYCS)$" title="i.e. Field Should Contain Only FYIT,SYIT,TYIT or FYCS,SYCS,TYCS. " MaxLength="4"></asp:TextBox>
            </li>
            <li><span class="auto-style11">Father&#39;s Name :</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="fatname" runat="server" CssClass="round" placeholder="Fathers Name" required="true" pattern=".{0}|.{3,}" title="i.e. field should contain minimum 3 letters"></asp:TextBox><span class="auto-style14">*</span>
                <span id="err1" class="auto-style10"></span>
            </li>
            <li><span class="auto-style11">Mother&#39;s Name :</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="motname" runat="server" CssClass="round" placeholder="Mothers Name" required="true" pattern=".{0}|.{3,}" title="i.e. field should contain minimum 3 letters"></asp:TextBox><span class="auto-style14">*</span>
                <span id="err2" class="auto-style10"></span>
            </li>
            <li><span class="auto-style11">Category :</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="cat" runat="server" CssClass="round" title="Select category" required="true">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Open</asp:ListItem>
                        <asp:ListItem>OBC</asp:ListItem>
                        <asp:ListItem>SC</asp:ListItem>
                        <asp:ListItem>ST</asp:ListItem>
                        <asp:ListItem>NT</asp:ListItem>
                        <asp:ListItem>VJ</asp:ListItem>
                    </asp:DropDownList><span class="auto-style14">*</span>&nbsp;</li>
            <li><span class="auto-style11">Religion :</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="rel" runat="server" CssClass="round" title="Select Religion" required="true">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Hindu</asp:ListItem>
                        <asp:ListItem>Sikh</asp:ListItem>
                        <asp:ListItem>Islam</asp:ListItem>
                        <asp:ListItem>Christian</asp:ListItem>
                        <asp:ListItem>Jain</asp:ListItem>
                    </asp:DropDownList><span class="auto-style14">*</span>
            </li>
            <li><span class="auto-style11">Marital Status :</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="marstat" runat="server" CssClass="round" title="Select MARITAL STATUS" required="true">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Unmarried</asp:ListItem>
                        <asp:ListItem>Married</asp:ListItem>
                    </asp:DropDownList><span class="auto-style14">*</span>
            </li>
            <li>
                <h3 class="auto-style11">ADDRESS DETAILS : </h3>
            </li>
            <li><span class="auto-style11">Address :</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="address" runat="server" CssClass="auto-style12" placeholder="Address" required="true" TextMode="MultiLine" Height="80px" Width="300px"></asp:TextBox><span class="auto-style14">*</span>
                <span id="adderr" class="auto-style14"></span>
            </li>
            <li><span class="auto-style11">District :</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="district" runat="server" CssClass="round" placeholder="District" required="true" pattern=".{0}|.{3,}" title="i.e. field should contain minimum 3 letters"></asp:TextBox><span class="auto-style14">* </span>
                <span id="err3" class="auto-style14"></span>
                &nbsp;<span class="auto-style11">State :</span>
                <asp:DropDownList ID="State" runat="server" CssClass="round" title="Select State" required="true">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Andaman and Nicobar Islands</asp:ListItem>
                    <asp:ListItem>Andhra Pradesh</asp:ListItem>
                    <asp:ListItem>Arunachal Pradesh</asp:ListItem>
                    <asp:ListItem>Assam</asp:ListItem>
                    <asp:ListItem>Bihar</asp:ListItem>
                    <asp:ListItem>Chandigarh</asp:ListItem>
                    <asp:ListItem>Chattisgarh</asp:ListItem>
                    <asp:ListItem>Dadra and Nagar Haveli</asp:ListItem>
                    <asp:ListItem>Daman and Diu</asp:ListItem>
                    <asp:ListItem>Delhi</asp:ListItem>
                    <asp:ListItem>Goa</asp:ListItem>
                    <asp:ListItem>Gujarat</asp:ListItem>
                    <asp:ListItem>Haryana</asp:ListItem>
                    <asp:ListItem>Himachal Pradesh</asp:ListItem>
                    <asp:ListItem>Jammu and Kashmir</asp:ListItem>
                    <asp:ListItem>Jharkhand</asp:ListItem>
                    <asp:ListItem>Karnataka</asp:ListItem>
                    <asp:ListItem>Kerala</asp:ListItem>
                    <asp:ListItem>Lakshadweep</asp:ListItem>
                    <asp:ListItem>Madhya Pradesh</asp:ListItem>
                    <asp:ListItem>Maharashtra</asp:ListItem>
                    <asp:ListItem>Manipur</asp:ListItem>
                    <asp:ListItem>Meghalaya</asp:ListItem>
                    <asp:ListItem>Mizoram</asp:ListItem>
                    <asp:ListItem>Nagaland</asp:ListItem>
                    <asp:ListItem>Orissa</asp:ListItem>
                    <asp:ListItem>Pondicherry</asp:ListItem>
                    <asp:ListItem>Punjab</asp:ListItem>
                    <asp:ListItem>Rajasthan</asp:ListItem>
                    <asp:ListItem>Sikkim</asp:ListItem>
                    <asp:ListItem>Tamil Nadu</asp:ListItem>
                    <asp:ListItem>Tripura</asp:ListItem>
                    <asp:ListItem>Uttarakhand</asp:ListItem>
                    <asp:ListItem>Uttaranchal</asp:ListItem>
                    <asp:ListItem>Uttar Pradesh</asp:ListItem>
                    <asp:ListItem>West Bengal</asp:ListItem>
                </asp:DropDownList><span class="auto-style14">*</span>
            </li>
            <li><span class="auto-style11">Pincode :</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="pin" runat="server" CssClass="round" placeholder="Pincode" required="true" pattern=".{0}|.{6,}" title="i.e. field should contain minimum 6 letters" MaxLength="6"></asp:TextBox><span class="auto-style14">*</span>
                <span id="errmsg1" class="auto-style10"></span>
            </li>
            <li>
                <h3 class="auto-style11">CONTACT DETAILS : </h3>
            </li>
            <li><span class="auto-style11">Mobile No :</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <asp:TextBox ID="mno" runat="server" CssClass="round" placeholder="Mobile NO." required="true" pattern=".{0}|.{10,}" title="i.e. field should contain minimum and maximum 10 letters" MaxLength="10"></asp:TextBox><span class="auto-style14">*</span>
                <span id="errmsg" class="auto-style10"></span>
            </li>

            <li><span class="auto-style11">E-Mail :</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <asp:TextBox ID="email" runat="server" CssClass="round" placeholder="E-Mail" required="true"></asp:TextBox>
            </li>
            <li class="auto-style9">
                <asp:ImageButton ID="submit" runat="server" AlternateText="SUBMIT" Height="50px" ImageUrl="~/images/submit.png" Width="200px" title="Click here to submit" OnClick="submit_Click" />
            </li>

        </ul>
    </div>
</asp:Content>
