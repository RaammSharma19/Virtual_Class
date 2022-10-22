<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="UpdateMarks.aspx.cs" Inherits="InternalExam_UpdateMarks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title>Update Internal Marks Details : Virtual Office</title>
        <script src="../Scripts/jquery-3.1.1.js"></script>
    <script src="../Scripts/sweetalert.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            jQuery('input[id$=marksob]').on('focusout', function () {
                var tm = $('input[id$=tmarks]').val();
                var mo = $('input[id$=marksob]').val();
                
                if (mo > tm) {
                    $(this).val('');
                    sweetAlert("Oops...", "Marks Obtained Should Be Less Than Or Equal To Total Marks", "error");
                    return false;
                }
            });
        });
    </script>

        <script type="text/javascript">
        $(document).ready(function () {
            jQuery('input[id$=tmarks]').on('focusout', function () {
                var tm = $('input[id$=tmarks]').val();

                if (tm != 25) {
                    $(this).val('');
                    sweetAlert("Oops...", "Total Marks Should be 25 only", "error");
                    return false;
                }
            });
        });
    </script>

    <script type="text/javascript">         //validate no. Digits
        $(document).ready(function () {
            $("input[id$=tmarks]").on('keypress', function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    $("#errmsg").html("Enter Numbers Only").show().fadeOut("600");
                    return false;
                }
            });
        });
    </script>
    <script type="text/javascript">         //validate no. Digits
        $(document).ready(function () {
            $("input[id$=marksob]").on('keypress', function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    $("#errmsg1").html("Enter Numbers Only").show().fadeOut("600");
                    return false;
                }
            });
        });
    </script>


    <style>
        #container {
            width: 670px;
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

        .auto-style6 {
            color: #FF0000;
        }

        .auto-style7 {
            color: #33CC33;
        }

        .auto-style8 {
            margin-left: 116px;
        }
        .auto-style9 {
            color: #009999;
        }
        .auto-style10 {
            animation: blinker 1s linear infinite;
            color: #009999;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
     <div id="container">
        <h1>UPDATE INTERNAL MARKS DETAILS</h1>
        <ul>
            <li class="blink_me">* is mandatory field.</li>
            <li class="auto-style10"> <marquee> # PLEASE TAKE CARE TO USE SIMILAR PHRASE FOR SAME SUBJECT. </marquee> </li>
            <li class="auto-style7">Fill the form to update Attendance details of student</li>
            <li>&nbsp;<span class="auto-style7">Roll No. :</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="rno" runat="server" CssClass="round" placeholder="Enter Roll NO." required="true" pattern="(^FYIT|^FYCS|^SYIT|^SYCS|^TYIT|^TYCS)([0-9]{6}$)" title="It Should start with FYIT,,SYIT,TYIT or FYCS,SYCS,TYCS and should contain 10" MaxLength="10" AutoPostBack="True" OnTextChanged="rno_TextChanged" OnKeyDown="return (event.keyCode!=13);"></asp:TextBox><span class="auto-style6">*</span></li>
            <li class="auto-style7">Standard :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="cls" runat="server" CssClass="round" placeholder="Enter Standard" required="true" pattern="(^FYIT|^SYIT|^TYIT|^FYCS|^SYCS|^TYCS)$" title="i.e. Field Should Contain Only FYIT,SYIT,TYIT or FYCS,SYCS,TYCS." MaxLength="4"></asp:TextBox>&nbsp;<span class="auto-style6">*</span></li>
            <li class="auto-style7">Subject :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="subject" runat="server" CssClass="round" required="true" placeholder="Subject"></asp:TextBox>
                <span class="auto-style6">*</span><span class="auto-style9">#</span></li>
            <li>
                <span class="auto-style7">Total Marks :&nbsp;&nbsp;&nbsp; </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="tmarks" runat="server" CssClass="round" placeholder="Total Marks" required="true" MaxLength="2" Text="25"></asp:TextBox>
                <span class="auto-style6">*</span> <span id="errmsg" class="auto-style6"></span></li>

            <li>
                <span class="auto-style7">Marks Obtained :&nbsp;&nbsp;&nbsp; </span>
                <asp:TextBox ID="marksob" runat="server" CssClass="round" placeholder="Marks Obtained" required="true" MaxLength="2"></asp:TextBox>
                <span class="auto-style6">*</span> <span id="errmsg1" class="auto-style6"></span></li>
            <li>
                <ul>
                    <li class="auto-style8">
                        <asp:ImageButton ID="submit" runat="server" AlternateText="SUBMIT" Height="50px" ImageUrl="~/images/submit.png" Width="185px" title="Click here to Submit." OnClick="submit_Click" />
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</asp:Content>

