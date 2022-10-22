<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AssignmentViewSubject.aspx.cs" Inherits="Assignments_AssignmentViewSubject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>View Subject Wise Assignment Report : Virtual Class</title>
    <style type="text/css">
        #container {
            width: 900px auto;
            height: 100px auto;
            padding: 0px;
            background: #ffffff;
            margin: 0 auto;
            margin-top: 10px;
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
            margin-top: 12px;
        }

        .auto-style4 {
            color: #00CC00;
        }

        .auto-style5 {
            margin-bottom: 20px;
        }
        .auto-style6 {
            margin-left: 159px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="auto-style2">
        <fieldset>
            <span class="auto-style4">Enter Subject Name To Get Report.
            </span>
            <br />
            <asp:TextBox ID="subject" runat="server" required="true" placeholder="Subject Name" CssClass="auto-style5"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:ImageButton ID="submit" runat="server" AlternateText="SUBMIT" Height="55px" ImageUrl="~/Images/submit.png" Width="200px" CssClass="auto-style3" OnClick="submit_Click" />
        </fieldset>
    </div>
    <div id="container">
        <h1>Subject Wise Assigments Status</h1>

        <asp:SqlDataSource ID="AssignmentDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VirtualClass %>" SelectCommand="SELECT * FROM [Assignments] WHERE ([Subject] = @Subject)">
            <SelectParameters>
                <asp:SessionParameter Name="Subject" SessionField="Subject" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <div style="margin-bottom: 20px; margin-left: 10px;">
            <asp:GridView ID="AssignementSubWise" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="AssignmentDataSource1" CssClass="auto-style6">
                <Columns>
                    <asp:BoundField DataField="RollNo" HeaderText="RollNo" SortExpression="RollNo" />
                    <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="AssignDate" HeaderText="AssignDate" SortExpression="AssignDate" />
                    <asp:BoundField DataField="LastDate" HeaderText="LastDate" SortExpression="LastDate" />
                    <asp:BoundField DataField="SubmissionDate" HeaderText="SubmissionDate" SortExpression="SubmissionDate" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>

