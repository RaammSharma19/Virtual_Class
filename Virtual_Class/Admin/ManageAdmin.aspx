<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ManageAdmin.aspx.cs" Inherits="Admin_ManageAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Manage Admin : Virtual Class</title>

    <style>
        #container {
            width: auto;
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
        #AdminContainer {
            margin: 20px;
            width: auto;
            overflow: scroll;
            box-shadow:  6px 6px 6px #20bee9;
        }
        .auto-style3 {
            margin-left: 93px;
        }
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div id="container">
        <h1>MANAGE ADMIN</h1>
        <div id="AdminContainer">
            <asp:SqlDataSource ID="AdminSqlDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:VirtualClass %>" DeleteCommand="DELETE FROM [Admin] WHERE [Id] = @original_Id AND [Username] = @original_Username AND [Password] = @original_Password AND (([CreatedBy] = @original_CreatedBy) OR ([CreatedBy] IS NULL AND @original_CreatedBy IS NULL)) AND (([ChangePW] = @original_ChangePW) OR ([ChangePW] IS NULL AND @original_ChangePW IS NULL))" InsertCommand="INSERT INTO [Admin] ([Username], [Password], [CreatedBy], [ChangePW]) VALUES (@Username, @Password, @CreatedBy, @ChangePW)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Admin]" UpdateCommand="UPDATE [Admin] SET [Username] = @Username, [Password] = @Password, [CreatedBy] = @CreatedBy, [ChangePW] = @ChangePW WHERE [Id] = @original_Id AND [Username] = @original_Username AND [Password] = @original_Password AND (([CreatedBy] = @original_CreatedBy) OR ([CreatedBy] IS NULL AND @original_CreatedBy IS NULL)) AND (([ChangePW] = @original_ChangePW) OR ([ChangePW] IS NULL AND @original_ChangePW IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_Username" Type="String" />
                    <asp:Parameter Name="original_Password" Type="String" />
                    <asp:Parameter Name="original_CreatedBy" Type="String" />
                    <asp:Parameter DbType="Date" Name="original_ChangePW" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Username" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="CreatedBy" Type="String" />
                    <asp:Parameter DbType="Date" Name="ChangePW" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Username" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="CreatedBy" Type="String" />
                    <asp:Parameter DbType="Date" Name="ChangePW" />
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_Username" Type="String" />
                    <asp:Parameter Name="original_Password" Type="String" />
                    <asp:Parameter Name="original_CreatedBy" Type="String" />
                    <asp:Parameter DbType="Date" Name="original_ChangePW" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <div class="logo">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style3" DataKeyNames="Id" DataSourceID="AdminSqlDataSource" Width="80%">
                    <Columns>
                        <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                        <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                        <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy" />
                        <asp:BoundField DataField="ChangePW" HeaderText="ChangePW" SortExpression="ChangePW" />
                        <asp:CommandField ShowEditButton="True" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are You Sure.?? You Want to Delete This Record.')"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
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

    </div>
</asp:Content>

