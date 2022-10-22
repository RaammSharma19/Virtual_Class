<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="view75less.aspx.cs" Inherits="Attendance_view75less" %>

<asp:content id="Content1" contentplaceholderid="head" runat="Server">
    <title>Students With Less Than 75% Attendance : Virtual Class</title>
    
    <style type="text/css">
        #container {
            width: 500px;
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

        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            color: #FF0000;
        }
    </style>
</asp:content>
<asp:content id="Content2" contentplaceholderid="Content" runat="Server">
        <div id="container" class="auto-style2">
                <h1>SUBJECT WISE REPORT</h1>
            
                <ul>
                    <li class="blink_me">* is mandatory field.</li>
                    <li>
                        <asp:TextBox ID="Class" runat="server" Width="250px" required="true" placeholder="Enter Class" pattern="(^FYIT|^SYIT|^TYIT|^FYCS|^SYCS|^TYCS)$" title="i.e. Field Should Contain Only FYIT,SYIT,TYIT or FYCS,SYCS,TYCS. " MaxLength="4" CssClass="round"></asp:TextBox>
                        <span class="auto-style3">*</span></li>
             <li>
            <asp:TextBox ID="Subject" runat="server" Width="250px" required="true" placeholder="Enter Subject" CssClass="round"></asp:TextBox>
                 <span class="auto-style3">*</span></li>
                    <li>
            <asp:ImageButton ID="submit" runat="server" AlternateText="SUBMIT" Height="42px" ImageUrl="~/Images/submit.png" Width="224px" OnClick="submit_Click" />
                        </li>

                </ul>
        </div>
</asp:content>

