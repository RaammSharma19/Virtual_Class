<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ManageDocuments.aspx.cs" Inherits="DocumentLibrary_ManageDocuments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Manage Documents : Virtual Class</title>

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

        #DocumentContainer {
            margin: 20px;
            width: auto;
            overflow: scroll;
            box-shadow: 6px 6px 6px #20bee9;
        }
        .auto-style2 {
            margin-left: 80px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">

    <div id="container">
        <h1>MANAGE DOCUMENTS</h1>
        <asp:SqlDataSource ID="DocumentDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VirtualClass %>" SelectCommand="SELECT [Id], [Class], [Title], [Description], [URL] FROM [DocumentLibrary]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [DocumentLibrary] WHERE [Id] = @original_Id AND (([Class] = @original_Class) OR ([Class] IS NULL AND @original_Class IS NULL)) AND (([Title] = @original_Title) OR ([Title] IS NULL AND @original_Title IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([URL] = @original_URL) OR ([URL] IS NULL AND @original_URL IS NULL))" InsertCommand="INSERT INTO [DocumentLibrary] ([Class], [Title], [Description], [URL]) VALUES (@Class, @Title, @Description, @URL)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [DocumentLibrary] SET [Class] = @Class, [Title] = @Title, [Description] = @Description, [URL] = @URL WHERE [Id] = @original_Id AND (([Class] = @original_Class) OR ([Class] IS NULL AND @original_Class IS NULL)) AND (([Title] = @original_Title) OR ([Title] IS NULL AND @original_Title IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([URL] = @original_URL) OR ([URL] IS NULL AND @original_URL IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_Class" Type="String" />
                <asp:Parameter Name="original_Title" Type="String" />
                <asp:Parameter Name="original_Description" Type="String" />
                <asp:Parameter Name="original_URL" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Class" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="URL" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Class" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="URL" Type="String" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_Class" Type="String" />
                <asp:Parameter Name="original_Title" Type="String" />
                <asp:Parameter Name="original_Description" Type="String" />
                <asp:Parameter Name="original_URL" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <div id="DocumentContainer">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="DocumentDataSource1" Width="80%" CssClass="auto-style2" DataKeyNames="Id">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Class" HeaderText="Class" SortExpression="Class" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="URL" HeaderText="URL" SortExpression="URL" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are You Sure.?? You Want to Delete This Record.')"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>

