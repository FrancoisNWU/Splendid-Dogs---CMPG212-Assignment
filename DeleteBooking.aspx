<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteBooking.aspx.cs" Inherits="Verster_40723380_Assignment2.DeleteBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color: #FFDDFF">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 742px;
            text-align: center;
        }
        .auto-style2 {
            width: 100%;
            height: 237px;
        }
        .auto-style4 {
            width: 89px;
            height: 181px;
        }
        .auto-style5 {
            height: 181px;
        }
        .auto-style6 {
            width: 291px;
            height: 40px;
            text-align: right;
        }
        .auto-style7 {
            height: 40px;
            width: 195px;
        }
        .auto-style8 {
            width: 100%;
            height: 45px;
        }
        .auto-style9 {
            height: 40px;
            width: 274px;
        }
        .auto-style10 {
            width: 274px;
        }
        .auto-style11 {
            width: 225px;
            text-align: right;
        }
        .auto-style12 {
            width: 100%;
            height: 75px;
        }
        .auto-style13 {
            width: 196px;
            text-align: right;
            height: 172px;
        }
        .auto-style14 {
            height: 172px;
            width: 364px;
        }
        .auto-style15 {
            width: 100%;
            height: 141px;
        }
        .auto-style16 {
            width: 306px;
            text-align: right;
            height: 52px;
        }
        .auto-style17 {
            width: 274px;
            height: 52px;
        }
        .auto-style18 {
            height: 52px;
        }
        .auto-style19 {
            margin-left: 0px;
        }
        .auto-style20 {
            width: 100%;
            height: 74px;
        }
        .auto-style21 {
            width: 225px;
            text-align: left;
        }
        .auto-style22 {
            text-align: center;
            width: 168px;
        }
    </style>
</head>
<body style="width: 742px; height: 345px; margin-right: 2px; margin-bottom: 2px">
    <form id="form1" runat="server">
        <div class="auto-style1" style="font-size: 43px; color: #FF0000; font-weight: bold;">
            Delete Booking<br />
            <br />
        </div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style4"></td>
                <td class="auto-style5">
                    <asp:GridView ID="GridView" runat="server" CssClass="auto-style19" Height="210px" Width="507px">
                        <HeaderStyle BorderStyle="Solid" Font-Names="Arial Black" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <table class="auto-style12">
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="lblSelectID" runat="server" Text="Select ID of booking:" Font-Bold="True"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:DropDownList ID="DropListID" runat="server" AutoPostBack="True" Height="16px" OnSelectedIndexChanged="DropListID_SelectedIndexChanged" Width="170px">
                        <asp:ListItem Selected="True" Value="-1">IDs</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style7"></td>
            </tr>
            </table>
        <table class="auto-style15">
            <tr>
                <td class="auto-style13"></td>
                <td class="auto-style14">
                    <asp:ListBox ID="lstDisplay" runat="server" Height="159px" Width="311px" ></asp:ListBox>
                </td>
                <td class="auto-style22">
                    <asp:Image ID="Image1" runat="server" Height="118px" ImageUrl="~/delete.png" Width="109px" />
                </td>
            </tr>
        </table>
        <table class="auto-style8">
            <tr>
                <td class="auto-style16"></td>
                <td class="auto-style17">
                    <asp:Button ID="btnConfirm" runat="server" CssClass="auto-style19" OnClick="btnConfirm_Click" Text="Confirm" Width="91px" Font-Bold="True" Font-Names="Arial Unicode MS" ForeColor="Red" />
                </td>
                <td class="auto-style18"></td>
            </tr>
        </table>
        <table class="auto-style20">
            <tr>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style10">
                    <asp:Label ID="lblMessage" runat="server" Font-Bold="True"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style21">
                    <asp:HyperLink ID="hyperLinkBack" runat="server" NavigateUrl="~/Default.aspx" Font-Bold="True" Font-Size="15pt" Font-Underline="False" BackColor="#E0E0E0" BorderColor="#E0E0E0" BorderStyle="Outset">Main Menu</asp:HyperLink>
                </td>
                <td class="auto-style10">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
