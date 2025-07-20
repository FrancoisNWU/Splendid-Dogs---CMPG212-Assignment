<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditBooking.aspx.cs" Inherits="Verster_40723380_Assignment2.EditBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color: #99CCFF">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            width: 416px;
        }
        .auto-style2 {
            width: 108%;
            height: 179px;
        }
        .auto-style3 {
            height: 57px;
        }
        .auto-style4 {
            text-align: right;
            width: 258px;
        }
        .auto-style7 {
            width: 207px;
        }
        .auto-style9 {
            width: 107%;
            height: 107px;
        }
        .auto-style10 {
            width: 329px;
            height: 57px;
            text-align: right;
        }
        .auto-style11 {
            width: 100%;
            height: 65px;
        }
        .auto-style12 {
            width: 127px;
        }
        .auto-style13 {
            width: 254px;
            height: 57px;
            text-align: right;
        }
        .auto-style14 {
            height: 57px;
            width: 159px;
        }
        .auto-style15 {
            width: 254px;
            height: 59px;
            text-align: right;
        }
        .auto-style16 {
            height: 59px;
            width: 159px;
        }
        .auto-style17 {
            width: 329px;
            height: 57px;
            text-align: left;
        }
        .auto-style18 {
            height: 57px;
            width: 383px;
        }
        .auto-style19 {
            text-align: center;
            width: 729px;
        }
        .auto-style20 {
            width: 880px;
            height: 583px;
        }
    </style>
</head>
<body style="width: 704px; height: 48px">
    <form id="form1" runat="server" class="auto-style20" style="border-color: #FFFF00; border-style: dotted;">
        <div class="auto-style19" style="font-size: 49px; width: 878px; height: 52px; margin-right: 2px; margin-bottom: 3px; color: #CC3300; font-weight: bold;">
            Edit Booking</div>
    <table class="auto-style9">
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style7">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lblID" runat="server" Text="Select ID to Update:" Font-Bold="True" Font-Italic="False"></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:DropDownList ID="DropListID" runat="server" AutoPostBack="True" Height="21px" OnSelectedIndexChanged="DropListIDs_SelectedIndexChanged" Width="164px">
                    <asp:ListItem>ID</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="lblError_Display" runat="server" Font-Bold="True" Font-Size="13pt" ForeColor="#9900FF"></asp:Label>
            </td>
        </tr>
        </table>
        <table class="auto-style2">
        <tr>
            <td class="auto-style12"></td>
            <td class="auto-style18">
                <asp:ListBox ID="lstDisplay" runat="server" Height="157px" Width="383px"></asp:ListBox>
            </td>
            <td class="auto-style1">
                <asp:Image ID="Image1" runat="server" Height="136px" ImageUrl="~/Edit.jpg" Width="146px" />
            </td>
        </tr>
    </table>
        <table class="auto-style11">
        <tr>
            <td class="auto-style15">
                <asp:Label ID="lblSelect" runat="server" Text="Select Column:" Font-Bold="True"></asp:Label>
            </td>
            <td class="auto-style16">
                <asp:DropDownList ID="dropListColumn" runat="server" AutoPostBack="True" Height="18px" OnSelectedIndexChanged="dropListColumn_SelectedIndexChanged" Width="127px" Enabled="False">
                    <asp:ListItem>Column</asp:ListItem>
                    <asp:ListItem>Name</asp:ListItem>
                    <asp:ListItem>Breed</asp:ListItem>
                    <asp:ListItem>Gender</asp:ListItem>
                    <asp:ListItem>Treatment</asp:ListItem>
                    <asp:ListItem>Date</asp:ListItem>
                    <asp:ListItem>Telephone</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:Label ID="lblColumn" runat="server" Text="Unselected Column:" Font-Bold="True"></asp:Label>
            </td>
            <td class="auto-style14">
                <asp:DropDownList ID="dropListTreatment" runat="server" Height="24px"  Visible="False" Width="124px">
                </asp:DropDownList>
                <asp:TextBox ID="txtInput" runat="server" Visible="False"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
        <table class="auto-style11">
        <tr>
            <td class="auto-style10">
                <asp:Button ID="btnUpdate" runat="server" Enabled="False" OnClick="btnUpdate_Click" Text="Update" />
            </td>
            <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblError" runat="server" Font-Bold="True" Font-Size="13pt" ForeColor="#9900CC"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="hyperLinkBack" runat="server" NavigateUrl="~/Default.aspx" Font-Bold="True" Font-Size="15pt" Font-Underline="False" BackColor="#E0E0E0" BorderColor="#E0E0E0" BorderStyle="Outset">Main Menu</asp:HyperLink>
            </td>
            <td class="auto-style3">&nbsp;</td>
        </tr>
    </table>
    </form>
    </body>
</html>
