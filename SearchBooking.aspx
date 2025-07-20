<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchBooking.aspx.cs" Inherits="Verster_40723380_Assignment2.SearchBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color: #FFFFCC">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 895px;
            text-align: center;
        }
        .auto-style2 {
            width: 100%;
            height: 264px;
        }
        .auto-style4 {
            width: 252px;
            text-align: center;
        }
        .auto-style7 {
            width: 100%;
            height: 66px;
        }
        .auto-style9 {
            height: 784px;
            margin-bottom: 7px;
        }
        .auto-style10 {
            width: 295px;
            text-align: right;
        }
        .auto-style11 {
            width: 289px;
            text-align: right;
            height: 48px;
        }
        .auto-style12 {
            height: 48px;
            width: 237px;
        }
        .auto-style13 {
            width: 100%;
            height: 59px;
        }
        .auto-style19 {
            width: 237px;
        }
        .auto-style20 {
            width: 100%;
            height: 65px;
        }
        .auto-style21 {
            width: 100%;
            height: 63px;
        }
        .auto-style24 {
            width: 100%;
            height: 152px;
        }
        .auto-style25 {
            width: 226px;
            height: 47px;
        }
        .auto-style26 {
            text-align: left;
            height: 31px;
        }
        .auto-style27 {
            text-align: center;
            height: 39px;
        }
        .auto-style28 {
            height: 47px;
            width: 273px;
        }
        .auto-style29 {
            width: 298px;
            text-align: right;
        }
        .auto-style30 {
            width: 296px;
            text-align: right;
            height: 47px;
        }
        .auto-style33 {
            width: 257px;
        }
        .auto-style34 {
            margin-left: 0px;
        }
        .auto-style35 {
            width: 243px;
            height: 47px;
        }
        .auto-style36 {
            height: 48px;
            width: 233px;
        }
        .auto-style38 {
            width: 91%;
            height: 15px;
        }
        .auto-style39 {
            width: 294px;
            height: 54px;
        }
        .auto-style40 {
            height: 54px;
        }
    </style>
</head>
<body style="width: 815px; height: 763px; margin-right: 2px; margin-bottom: 5px">
    <form id="form1" runat="server" class="auto-style9">
        <div class="auto-style1" style="font-size: 43px; color: #FF0000; font-weight: bold;">
            Search Booking<table class="auto-style38">
                <tr>
                    <td class="auto-style40"></td>
                    <td class="auto-style40"></td>
                    <td class="auto-style39"></td>
                </tr>
            </table>
        </div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style4">
                    <asp:Image ID="Image1" runat="server" Height="174px" ImageUrl="~/Search.png" Width="169px" />
                </td>
                <td>
                    <asp:GridView ID="GridView" runat="server" Height="221px" Width="432px" Font-Bold="True" Font-Names="Bahnschrift Light" Font-Overline="False">
                        <HeaderStyle BorderStyle="Solid" Font-Bold="True" Font-Names="Berlin Sans FB Demi" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <table class="auto-style7">
            <tr>
                <td class="auto-style29" style="border-left-style: solid; border-left-color: #808080; border-left-width: thick; border-top-style: solid; border-top-width: thick; border-top-color: #808080;">
                    <asp:Label ID="lblFilters" runat="server" Font-Bold="True" Font-Size="15pt" Text="Filters:"></asp:Label>
                </td>
                <td style="border-right-style: solid; border-right-width: thick; border-right-color: #808080; border-top-style: solid; border-top-color: #808080; border-top-width: thick;">&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style20">
            <tr>
                <td class="auto-style11" style="border-left-style: solid; border-left-color: #808080; border-left-width: thick">&nbsp;
                    <asp:Label ID="lblID" runat="server" Text="ID:"></asp:Label>
                </td>
                <td class="auto-style36">
                    <asp:TextBox ID="txtID" runat="server" ></asp:TextBox>
                </td>
                <td class="auto-style12" style="border-right-style: solid; border-right-width: thick; border-right-color: #808080;">
                    <asp:Button ID="btnFilterIDs" runat="server" OnClick="btnFilterIDs_Click" Text="Filter IDs" CssClass="auto-style34" onmouseover="this.style.backgroundColor = 'white'"  onmouseout="this.style.backgroundColor = ''" />
                </td>
            </tr>
        </table>
        <table class="auto-style21">
            <tr>
                <td class="auto-style30" style="border-left-style: solid; border-left-color: #808080; border-left-width: thick">
                    <asp:Label ID="lblName" runat="server" Text="Name:"></asp:Label>
                </td>
                <td class="auto-style35">
                    <asp:TextBox ID="txtName" runat="server" ></asp:TextBox>
                </td>
                <td style="border-right-style: solid; border-right-width: thick; border-right-color: #808080;">
                    <asp:Button ID="bntFilterNames" runat="server" OnClick="bntFilterNames_Click" Text="Filter Names" onmouseover="this.style.backgroundColor = 'white'"  onmouseout="this.style.backgroundColor = ''" />
                </td>
            </tr>
        </table>
        <table class="auto-style13">
            <tr>
                <td class="auto-style10" style="border-left-style: solid; border-left-color: #808080; border-left-width: thick">
                    <asp:Label ID="lblGender" runat="server" Text="Gender:"></asp:Label>
                </td>
                <td class="auto-style33">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RadioButton ID="rbMale" runat="server" AutoPostBack="True" GroupName="Gender" OnCheckedChanged="rbMale_CheckedChanged" Text="Male" />
&nbsp;&nbsp;
                    <asp:RadioButton ID="rbFemale" runat="server" AutoPostBack="True" GroupName="Gender" OnCheckedChanged="rbFemale_CheckedChanged" Text="Female" />
                </td>
                <td class="auto-style19" style="border-right-style: solid; border-right-width: thick; border-right-color: #808080;">&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style24">
            <tr>
                <td class="auto-style30" style="border-left-style: solid; border-left-color: #808080; border-left-width: thick;">
                    <asp:Label ID="lblTreatments" runat="server" Text="Treatments:"></asp:Label>
                </td>
                <td class="auto-style25">
                    <asp:DropDownList ID="dropListTreatment" runat="server" AutoPostBack="True" Height="26px" OnSelectedIndexChanged="dropListTreatment_SelectedIndexChanged" Width="129px">
                    </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                <td class="auto-style28" style="border-right-style: solid; border-right-width: thick; border-right-color: #808080;">
                </td>
            </tr>
            <tr>
                <td class="auto-style27" colspan="3" style="border-right-style: solid; border-right-width: thick; border-right-color: #808080; border-bottom-width: thick; border-bottom-color: #808080; border-bottom-style: solid; border-left-style: solid; border-left-color: #808080; border-left-width: thick;">
                    <asp:Label ID="lblError" runat="server" Font-Bold="True" Font-Size="15pt" Font-Underline="True" ForeColor="#FF4848"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style26" colspan="3">
                    <asp:HyperLink ID="hyperLinkBack" runat="server" NavigateUrl="~/Default.aspx" Font-Bold="True" Font-Size="15pt" Font-Underline="False" BackColor="#E0E0E0" BorderColor="#E0E0E0" BorderStyle="Outset">Main Menu</asp:HyperLink>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
