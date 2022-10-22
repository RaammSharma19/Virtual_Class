<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InternalMarksByRollNo.aspx.cs" Inherits="InternalExam_InternalMarksByRollNo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="/Images/title.ico" />
    <title>Students Internal Marks Report : Virtual Class</title>

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
            height: 210mm;
            align-content: center;
            background-color: white;
            margin: 20px;
        }

        .auto-style1 {
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
    <div class="auto-style1">
        <asp:Image ID="logo" runat="server" ImageUrl="~/images/logo.png" Height="170px" Width="640px" />
    </div>
    <div id="top">
    </div>

    <form id="form1" runat="server">
        <div style="width: 100%">
            <asp:SqlDataSource ID="NameDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:VirtualClass %>" SelectCommand="SELECT [FirstName]+' '+[MiddleName]+' '+[LastName] AS FULL_NAME, [RollNo], [Class] FROM [Student] WHERE ([RollNo] = @RollNo)">
                <SelectParameters>
                    <asp:SessionParameter Name="RollNo" SessionField="RollNo" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="MarksSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:VirtualClass %>" SelectCommand="SELECT [Subject], [TotalMarks], [MarksObtained], [Percentage], [Result] FROM [InternalExamRecord] WHERE ([RollNo] = @RollNo)">
                <SelectParameters>
                    <asp:SessionParameter Name="RollNo" SessionField="RollNo" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <div id="DetailContainer" class="auto-style1">
                <div class="auto-style3">
                    <asp:ImageButton ID="print" runat="server" AlternateText="PRINT" Height="50px" ImageUrl="~/Images/print.png" Width="200px" />


                    <br />
                    <asp:Image ID="kvpc" runat="server" ImageUrl="~/Images/kvpclogo.jpg" Width="782px" />
                    <br />
                    <br />
                </div>

                <h1 class="auto-style4">STUDENT'S INTERNAL EXAM RECORD</h1>
                <h3 class="auto-style3">
                    <asp:Label ID="date" runat="server" Text="DATE"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <br />
                </h3>

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
                <br />
                <div style="margin-left: 150px; font-family: 'Times New Roman';">

                    <asp:ListView ID="ListView1" runat="server" DataSourceID="MarksSqlDataSource">
                        <AlternatingItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="SubjectLabel" runat="server" Text='<%# Eval("Subject") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalMarksLabel" runat="server" Text='<%# Eval("TotalMarks") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="MarksObtainedLabel" runat="server" Text='<%# Eval("MarksObtained") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="PercentageLabel" runat="server" Text='<%# Eval("Percentage") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ResultLabel" runat="server" Text='<%# Eval("Result") %>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:TextBox ID="SubjectTextBox" runat="server" Text='<%# Bind("Subject") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="TotalMarksTextBox" runat="server" Text='<%# Bind("TotalMarks") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="MarksObtainedTextBox" runat="server" Text='<%# Bind("MarksObtained") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="PercentageTextBox" runat="server" Text='<%# Bind("Percentage") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="ResultTextBox" runat="server" Text='<%# Bind("Result") %>' />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                                <td>
                                    <asp:TextBox ID="SubjectTextBox" runat="server" Text='<%# Bind("Subject") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="TotalMarksTextBox" runat="server" Text='<%# Bind("TotalMarks") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="MarksObtainedTextBox" runat="server" Text='<%# Bind("MarksObtained") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="PercentageTextBox" runat="server" Text='<%# Bind("Percentage") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="ResultTextBox" runat="server" Text='<%# Bind("Result") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="SubjectLabel" runat="server" Text='<%# Eval("Subject") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalMarksLabel" runat="server" Text='<%# Eval("TotalMarks") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="MarksObtainedLabel" runat="server" Text='<%# Eval("MarksObtained") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="PercentageLabel" runat="server" Text='<%# Eval("Percentage") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ResultLabel" runat="server" Text='<%# Eval("Result") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server" border="0">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="1" style="">
                                            <tr runat="server" style="">
                                                <th runat="server">Subject</th>
                                                <th runat="server">Total Marks</th>
                                                <th runat="server">Marks Obtained</th>
                                                <th runat="server">Percentage</th>
                                                <th runat="server">Result</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style=""></td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="SubjectLabel" runat="server" Text='<%# Eval("Subject") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="TotalMarksLabel" runat="server" Text='<%# Eval("TotalMarks") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="MarksObtainedLabel" runat="server" Text='<%# Eval("MarksObtained") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="PercentageLabel" runat="server" Text='<%# Eval("Percentage") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ResultLabel" runat="server" Text='<%# Eval("Result") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
