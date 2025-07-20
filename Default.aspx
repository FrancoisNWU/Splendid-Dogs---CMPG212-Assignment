<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Verster_40723380_Assignment2.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            width: 1274px;
            height: 500px;
            font-size: 33pt;
            text-decoration: blink;
            background-size: cover;
            background-image: url('BackGroundMain.jpg');
            background-repeat: no-repeat;
        }
        .auto-style14 {
            width: 893px;
            height: 305px;
            margin-bottom: 1px;
        }
        .auto-style15 {
            text-align: left;
            width: 1604px;
            height: 851px;
        }
        .auto-style16 {
            width: 97%;
            height: 438px;
        }
        .auto-style17 {
            width: 251px;
        }
        .auto-style18 {
            width: 215px;
        }
    </style>

</head>
<body style="width: 1273px; height: 65px; margin-right: 2px; margin-bottom: 3px;">

    <form id="form1" runat="server" class="auto-style14" style="border: medium solid #009933;">
        <div class="auto-style15">
        <div class="auto-style1" style="border-color: #00FFFF; border-style: ridge; font-style: normal; font-variant: normal; text-transform: none; color: #CC3300; font-weight: bolder;">
            Splendid Dogs
            <asp:Image ID="Image1" runat="server" Height="41px" ImageUrl="~/Paw.png" Width="54px" />
            <br />
            <table class="auto-style16">
                <tr>
                    <td class="auto-style17">
                    <asp:Button ID="btnNew" runat="server" Text="New Booking" Width="166px"  OnClick="btnNew_Click" Height="51px" onmouseover="this.style.backgroundColor = '#CCFFCC'" onmouseout="this.style.backgroundColor = ''" Font-Bold="True" Font-Size="15pt"/>
                    </td>
                    <td class="auto-style18">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style17">
                    <asp:Button ID="btnSearch" runat="server" Text="Search Booking" OnClick="btnSearch_Click" Width="168px" Height="56px" onmouseover="this.style.backgroundColor = '#FFFFCC'" onmouseout="this.style.backgroundColor = ''" Font-Bold="True" Font-Size="15pt" />
                    </td>
                    <td class="auto-style18">&nbsp;</td>
                    <td>
                    <asp:Label ID="lblLatest" runat="server" Text="Latest Change To Bookings:" Font-Bold="True" Font-Italic="True" Font-Size="20pt" ForeColor="Black"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style17">
                    <asp:DropDownList ID="dropListChange" runat="server" Height="113px" Width="191px" AutoPostBack="True" OnSelectedIndexChanged="dropListChange_SelectedIndexChanged" onmouseover="this.style.backgroundColor = '#99CCFF'" onmouseout="this.style.backgroundColor = ''" Font-Bold="True" Font-Size="15pt">
                        <asp:ListItem>Change Booking</asp:ListItem>
                        <asp:ListItem>Edit Booking </asp:ListItem>
                        <asp:ListItem>Delete Booking</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                    <td class="auto-style18">&nbsp;</td>
                    <td>
                    <asp:ListBox ID="lstDisplay" runat="server" Width="466px" Height="107px"></asp:ListBox>
                    </td>
                </tr>
            </table>
            </div>
    &nbsp;&nbsp;
        </div>
        <script>
            function mouseOver() {
                document.getElementById("ImgPaw1").style.visibility = "visible";
            }

            function mouseOut() {
                document.getElementById("demo").style.color = "black";
            }
        </script>
    </form>
</body>
</html>
