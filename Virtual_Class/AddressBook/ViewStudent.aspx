<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewStudent.aspx.cs" Inherits="Admin_ViewStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>View Registered Students : Virtual Class</title>

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

        #StudentContainer {
            margin-bottom: 25px;
        }

        .auto-style2 {
            text-align: right;
            color: #FF0000;
            animation: blinker 1s linear infinite;
            color: #FF0000;
            text-align: right;
            font-size: large;
        }
        /* Style the links inside the sidenav */
        #viewNav a {
            position: relative; /* Position them relative to the browser window */
            left: -160px; /* Position them outside of the screen */
            transition: 0.3s; /* Add transition on hover */
            padding: 15px; /* 15px padding */
            width: 100px; /* Set a specific width */
            text-decoration: none; /* Remove underline */
            font-size: 20px; /* Increase font size */
            color: white; /* White text color */
            border-radius: 0 5px 5px 0; /* Rounded corners on the top right and bottom right side */
        }

            #viewNav a:hover {
                left: 0; /* On mouse-over, make the elements appear as they should */
            }

        /* The view link: 20px from the top with a green background */
        #View {
            top : 20px;
            background-color: #4CAF50;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">

    <div id="container">
        <ul>
            <li class="auto-style2">Empty Class Field Shows Student's Address Book Is Empty.
            </li>
        </ul>

        <div id="StudentContainer">

            
            <div id="viewNav">
                <a id="View" href="ViewAddressBook.aspx" title="Kindly Remember Roll No. of Student For Further Proceedings">For Full Details Click Here</a>
            </div>


            <asp:SqlDataSource ID="StudentSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:VirtualClass %>" SelectCommand="SELECT [FirstName]+' '+[MiddleName]+' '+[LastName] AS FULL_NAME, [RollNo], [MobileNo], [Class] FROM [Student]"></asp:SqlDataSource>

            <br />
            <asp:GridView ID="Students" runat="server" DataSourceID="StudentSqlDataSource" AutoGenerateColumns="False" DataKeyNames="RollNo" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="FULL_NAME" HeaderText="FULL NAME" ReadOnly="True" SortExpression="FULL_NAME" />
                    <asp:BoundField DataField="RollNo" HeaderText="Roll No." ReadOnly="True" SortExpression="RollNo" />
                    <asp:BoundField DataField="MobileNo" HeaderText="Mobile No." SortExpression="MobileNo" />
                    <asp:BoundField DataField="Class" HeaderText="Class" SortExpression="Class" />
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

