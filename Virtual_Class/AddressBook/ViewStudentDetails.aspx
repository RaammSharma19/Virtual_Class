<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewStudentDetails.aspx.cs" Inherits="AddressBook_ViewStudentDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="/Images/title.ico" />
    <title>View Student Details : Virtual Class</title>

    <script src="../Scripts/jquery-3.1.1.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#print").click(function () {
                $('#logo').hide();
                $('#print').hide();
                window.print();
            });
        });
    </script>

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

        #DetailContainer {
            display: table;
            width: 210mm;
            height: 420mm;
            align-content: center;
            background-color: white;
            margin: 20px;
        }

        .auto-style1 {
            text-align: left;
        }

        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            text-align: right;
        }
        .auto-style4 {
            text-align: center;
            color: #0066CC;
        }
        .auto-style5 {
            margin-left: 75px;
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
        <div style="width: 100%">
            <asp:SqlDataSource ID="DetailsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:VirtualClass %>" SelectCommand="SELECT [FirstName], [MiddleName], [LastName], [Gender], [RollNo], [Dob], [MobileNo], [Email], [Username], [Class], [Regdate], [FatherName], [MotherName], [Category], [Religion], [MaritalStatus], [Address], [District], [State], [Pincode] FROM [Student] WHERE ([RollNo] = @RollNo)">
                <SelectParameters>
                    <asp:SessionParameter Name="RollNo" SessionField="RollNo" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="NameDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:VirtualClass %>" SelectCommand="SELECT [FirstName]+' '+[MiddleName]+' '+[LastName] AS FULL_NAME FROM [Student] WHERE ([RollNo] = @RollNo)">
                <SelectParameters>
                    <asp:SessionParameter Name="RollNo" SessionField="RollNo" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <div id="DetailContainer" class="auto-style1">
                <div class="auto-style3">
                <asp:ImageButton ID="print" runat="server" AlternateText="PRINT" Height="50px" ImageUrl="~/Images/print.png" Width="200px" />


                    <br />
                    <asp:Image ID="kvpc" runat="server" ImageUrl="~/Images/kvpclogo.jpg" Width="782px" />
                    <br />
                    <br />
                </div>
                
                <h1 class="auto-style4">STUDENT'S DETAILS</h1>
                <h3 class="auto-style3">
                    <asp:Label ID="date" runat="server" Text="DATE"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <br />
                </h3>


                <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataSourceID="NameDataSource" Height="50px" Width="170mm" CssClass="auto-style5">
                    <Fields>
                        <asp:BoundField DataField="FULL_NAME" HeaderText="FULL NAME :" ReadOnly="True" SortExpression="FULL_NAME" />
                    </Fields>
                </asp:DetailsView>
                <br />


                <div>

                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="5" DataKeyNames="RollNo" DataSourceID="DetailsDataSource" ForeColor="White"  BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" DataMember="DefaultView" HorizontalAlign="Center" Height="297mm" Width="170mm">
                    <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <Fields>
                        <asp:BoundField DataField="FirstName" HeaderText="First Name :" SortExpression="FirstName" />
                        <asp:BoundField DataField="MiddleName" HeaderText="Middle Name :" SortExpression="MiddleName" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name :" SortExpression="LastName" />
                        <asp:BoundField DataField="Gender" HeaderText="Gender :" SortExpression="Gender" />
                        <asp:BoundField DataField="RollNo" HeaderText="Roll No. :" ReadOnly="True" SortExpression="RollNo" />
                        <asp:BoundField DataField="Dob" HeaderText="Date Of Birth :" SortExpression="Dob" />
                        <asp:BoundField DataField="MobileNo" HeaderText="Mobile No:" SortExpression="MobileNo" />
                        <asp:BoundField DataField="Email" HeaderText="E-mail :" SortExpression="Email" />
                        <asp:BoundField DataField="Username" HeaderText="Username :" SortExpression="Username" />
                        <asp:BoundField DataField="Class" HeaderText="Standard :" SortExpression="Class" />
                        <asp:BoundField DataField="Regdate" HeaderText="Register From date :" SortExpression="Regdate" />
                        <asp:BoundField DataField="FatherName" HeaderText="Father's Name :" SortExpression="FatherName" />
                        <asp:BoundField DataField="MotherName" HeaderText="Mother's Name :" SortExpression="MotherName" />
                        <asp:BoundField DataField="Category" HeaderText="Category :" SortExpression="Category" />
                        <asp:BoundField DataField="Religion" HeaderText="Religion :" SortExpression="Religion" />
                        <asp:BoundField DataField="MaritalStatus" HeaderText="Marital Status :" SortExpression="MaritalStatus" />
                        <asp:BoundField DataField="Address" HeaderText="Address :" SortExpression="Address" />
                        <asp:BoundField DataField="District" HeaderText="District :" SortExpression="District" />
                        <asp:BoundField DataField="State" HeaderText="State :" SortExpression="State" />
                        <asp:BoundField DataField="Pincode" HeaderText="Pin Code :" SortExpression="Pincode" />
                    </Fields>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle Font-Names="Times New Roman" Font-Overline="False" Font-Size="Larger" ForeColor="#000066" HorizontalAlign="Justify" VerticalAlign="Middle" />
                </asp:DetailsView>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
