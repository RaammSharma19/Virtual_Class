<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewAssignment.aspx.cs" Inherits="Assignments_ViewAssignment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VIEW ASSIGNMENTS : Virtual Office</title>
    <link rel="icon" href="/Images/title.ico" />

    <style>
        #container {
            width: 900px;
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

        #detailcontainer {
            display: table;
            width: 210mm;
            height: auto;
            align-content: center;
            background-color: white;
            margin: 20px;
        }

        .auto-style1 {
            text-align: center;
        }

        .auto-style4 {
            left: 0px;
            top: 0px;
        }

        h1 {
            margin: 0;
            padding: 10px 0;
            font-size: 24px;
            text-align: center;
            background: #eff4f7;
            border-bottom: 1px solid #dde0e7;
            box-shadow: 0 -1px 0 #fff inset;
            border-radius: 5px 5px 0 0;
            text-shadow: 1px 1px 0 #fff;
        }

        .auto-style5 {
            margin-left: 70px;
            margin-bottom: 20px;
            margin-right: 20px;
        }

        .auto-style6 {
            text-align: center;
            margin-left: 49px;
        }

        .auto-style7 {
            margin-left: 61px;
            margin-bottom: 20px;
            margin-right: 20px;
        }
    </style>
</head>
<body>

    <div class="auto-style1">
        <asp:Image ID="Image1" runat="server" Height="170px" ImageUrl="~/images/logo.png" Width="640px" />
    </div>

    <div id="line" class="auto-style4">
    </div>

    <div id="container">
        <h1>VIEW ASSIGNMENTS DETAILS</h1>
        <form id="form1" runat="server">

            <div id="detailcontainer" class="auto-style6">

                <asp:SqlDataSource ID="AssignmentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:VirtualClass %>" SelectCommand="SELECT * FROM [Assignments] WHERE ([RollNo] = @RollNo)">
                    <SelectParameters>
                        <asp:SessionParameter Name="RollNo" SessionField="RollNo" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <div class="auto-style1">
                    <br />
                </div>
                <asp:SqlDataSource ID="NameDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:VirtualClass %>" SelectCommand="SELECT [FirstName]+' '+[MiddleName]+' '+[LastName] AS FULL_NAME, [RollNo], [Class] FROM [Student] WHERE ([RollNo] = @RollNo)">
                    <SelectParameters>
                        <asp:SessionParameter Name="RollNo" SessionField="RollNo" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <div class="auto-style1">
                    <br />
                </div>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="NameDataSource" Height="50px" Width="170mm" CssClass="auto-style5" DataKeyNames="RollNo" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                    <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <Fields>
                        <asp:BoundField DataField="FULL_NAME" HeaderText="FULL NAME :" ReadOnly="True" SortExpression="FULL_NAME" />
                        <asp:BoundField DataField="RollNo" HeaderText="Roll No. :" ReadOnly="True" SortExpression="RollNo" />
                        <asp:BoundField DataField="Class" HeaderText="Standard :" SortExpression="Class" />
                    </Fields>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                </asp:DetailsView>
                <div class="auto-style1">
                    <br />
                </div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AssignmentDataSource" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" CssClass="auto-style7">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                        <asp:BoundField DataField="AssignDate" HeaderText="AssignDate" SortExpression="AssignDate" />
                        <asp:BoundField DataField="LastDate" HeaderText="LastDate" SortExpression="LastDate" />
                        <asp:BoundField DataField="SubmissionDate" HeaderText="SubmissionDate" SortExpression="SubmissionDate" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>

            </div>

        </form>
    </div>
</body>
</html>
