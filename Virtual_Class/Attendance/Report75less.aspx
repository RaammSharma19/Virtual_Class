<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Report75less.aspx.cs" Inherits="Attendance_Report75less" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>List Of Students With Less Than 75% Attendance : Virtual Class</title>
    <link rel="icon" href="/Images/title.ico" />


    <script src="../Scripts/jquery-3.1.1.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#print").click(function () {
                $('#print').hide();
                window.print();
            });
        });
    </script>

    <style>
        #container {
            width: 850px;
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

        #DetailContainer {
            font-family: 'Times New Roman';
            display: table;
            width: 210mm;
            height: 420mm;
            align-content: center;
            background-color: white;
            margin: 20px;
        }

        .auto-style3 {
            text-align: right;
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

        .auto-style4 {
            margin-left: 50px;
        }
        .auto-style5 {
            text-align: center;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div id="container" class="auto-style3">
            <asp:SqlDataSource ID="LessAttDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:VirtualClass %>" SelectCommand="SELECT * FROM [Attendance] WHERE (([Class] = @Class) AND ([Subject] = @Subject) AND ([Percentage] &lt;= @Percentage))">
                <SelectParameters>
                    <asp:SessionParameter Name="Class" SessionField="Class" Type="String" />
                    <asp:SessionParameter Name="Subject" SessionField="Subject" Type="String" />
                    <asp:Parameter DefaultValue="75" Name="Percentage" Type="Double" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div class="auto-style5">
                <asp:Image ID="logo" runat="server" ImageUrl="~/Images/kvpclogo.jpg" Height="170px" Width="749px" />
            </div>
        <div class="auto-style3">
            <asp:ImageButton ID="print" runat="server" AlternateText="PRINT" Height="50px" ImageUrl="~/Images/print.png" Width="200px" />
        </div>
        <div id="DetailContainer" class="auto-style3">
            <h1>List Of Students With Less Than 75% Attendance</h1>
            <br />
            <br />
            <asp:Label ID="Date" runat="server" Text="Date : "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <div class="auto-style4">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ListView ID="LessAttList" runat="server" DataSourceID="LessAttDataSource">
                    <AlternatingItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Label ID="RollNoLabel" runat="server" Text='<%# Eval("RollNo") %>' />
                            </td>
                            <td>
                                <asp:Label ID="ClassLabel" runat="server" Text='<%# Eval("Class") %>' />
                            </td>
                            <td>
                                <asp:Label ID="SubjectLabel" runat="server" Text='<%# Eval("Subject") %>' />
                            </td>
                            <td>
                                <asp:Label ID="MonthLabel" runat="server" Text='<%# Eval("Month") %>' />
                            </td>
                            <td>
                                <asp:Label ID="TotalLectureLabel" runat="server" Text='<%# Eval("TotalLecture") %>' />
                            </td>
                            <td>
                                <asp:Label ID="LecturePresentLabel" runat="server" Text='<%# Eval("LecturePresent") %>' />
                            </td>
                            <td>
                                <asp:Label ID="PercentageLabel" runat="server" Text='<%# Eval("Percentage") %>' />
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
                                <asp:TextBox ID="RollNoTextBox" runat="server" Text='<%# Bind("RollNo") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="ClassTextBox" runat="server" Text='<%# Bind("Class") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="SubjectTextBox" runat="server" Text='<%# Bind("Subject") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="MonthTextBox" runat="server" Text='<%# Bind("Month") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="TotalLectureTextBox" runat="server" Text='<%# Bind("TotalLecture") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="LecturePresentTextBox" runat="server" Text='<%# Bind("LecturePresent") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="PercentageTextBox" runat="server" Text='<%# Bind("Percentage") %>' />
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>No data was returned. With 75% less attendance.</td>
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
                                <asp:TextBox ID="RollNoTextBox" runat="server" Text='<%# Bind("RollNo") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="ClassTextBox" runat="server" Text='<%# Bind("Class") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="SubjectTextBox" runat="server" Text='<%# Bind("Subject") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="MonthTextBox" runat="server" Text='<%# Bind("Month") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="TotalLectureTextBox" runat="server" Text='<%# Bind("TotalLecture") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="LecturePresentTextBox" runat="server" Text='<%# Bind("LecturePresent") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="PercentageTextBox" runat="server" Text='<%# Bind("Percentage") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Label ID="RollNoLabel" runat="server" Text='<%# Eval("RollNo") %>' />
                            </td>
                            <td>
                                <asp:Label ID="ClassLabel" runat="server" Text='<%# Eval("Class") %>' />
                            </td>
                            <td>
                                <asp:Label ID="SubjectLabel" runat="server" Text='<%# Eval("Subject") %>' />
                            </td>
                            <td>
                                <asp:Label ID="MonthLabel" runat="server" Text='<%# Eval("Month") %>' />
                            </td>
                            <td>
                                <asp:Label ID="TotalLectureLabel" runat="server" Text='<%# Eval("TotalLecture") %>' />
                            </td>
                            <td>
                                <asp:Label ID="LecturePresentLabel" runat="server" Text='<%# Eval("LecturePresent") %>' />
                            </td>
                            <td>
                                <asp:Label ID="PercentageLabel" runat="server" Text='<%# Eval("Percentage") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="1" style="">
                                        <tr runat="server" style="">
                                            <th runat="server">Roll No.</th>
                                            <th runat="server">Standard</th>
                                            <th runat="server">Subject</th>
                                            <th runat="server">Month</th>
                                            <th runat="server">Total Lecture</th>
                                            <th runat="server">Lecture Present</th>
                                            <th runat="server">% Of Attendance</th>
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
                                <asp:Label ID="RollNoLabel" runat="server" Text='<%# Eval("RollNo") %>' />
                            </td>
                            <td>
                                <asp:Label ID="ClassLabel" runat="server" Text='<%# Eval("Class") %>' />
                            </td>
                            <td>
                                <asp:Label ID="SubjectLabel" runat="server" Text='<%# Eval("Subject") %>' />
                            </td>
                            <td>
                                <asp:Label ID="MonthLabel" runat="server" Text='<%# Eval("Month") %>' />
                            </td>
                            <td>
                                <asp:Label ID="TotalLectureLabel" runat="server" Text='<%# Eval("TotalLecture") %>' />
                            </td>
                            <td>
                                <asp:Label ID="LecturePresentLabel" runat="server" Text='<%# Eval("LecturePresent") %>' />
                            </td>
                            <td>
                                <asp:Label ID="PercentageLabel" runat="server" Text='<%# Eval("Percentage") %>' />
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
