<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewDocuments.aspx.cs" Inherits="DocumentLibrary_ViewDocuments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Documents: Virtual Class</title>
    <link rel="icon" href="/Images/title.ico" />
    <link href="../Style/Style.css" rel="stylesheet" />


    <style>
        body {
            background-color: aliceblue;
        }

        #top {
            background-color: #333;
            overflow: hidden;
            width: 100%;
            height: 20px;
        }

        #container {
            width: auto;
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

        .auto-style2 {
            text-align: center;
        }

        .auto-style3 {
            margin-left: 220px;
        }
    </style>
</head>
<body>

    <div class="auto-style2">
        <asp:Image ID="logo" runat="server" ImageUrl="~/images/logo.png" Height="170px" Width="640px" />
    </div>

    <div id="top">
    </div>

    <form id="form1" runat="server">

        <div>

            <asp:SqlDataSource ID="DocumentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:VirtualClass %>" SelectCommand="SELECT * FROM [DocumentLibrary] WHERE ([Class] = @Class) ORDER BY [Id]">
                <SelectParameters>
                    <asp:SessionParameter Name="Class" SessionField="Class" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>

        <div id="container">
            <h1>DOCUMENTS LIBRARY</h1>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div style="margin: 20px;">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="DocumentDataSource" CssClass="auto-style3">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                        <asp:TemplateField HeaderText="URL" SortExpression="URL">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Bind("URL") %>' Text='<%# Bind("Title") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
