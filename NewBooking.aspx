<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewBooking.aspx.cs" Inherits="Verster_40723380_Assignment2.NewBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color: #CCFFCC">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            width: 604px;
        }
        .auto-style2 {
            width: 100%;
            height: 216px;
        }
        .auto-style3 {
            height: 47px;
        }
        .auto-style4 {
            height: 47px;
            width: 211px;
            text-align: right;
        }
        .auto-style5 {
            width: 211px;
            text-align: right;
        }
        .auto-style6 {
            height: 43px;
            width: 211px;
            text-align: right;
        }
        .auto-style7 {
            height: 43px;
        }
        .auto-style8 {
            height: 840px;
            width: 699px;
        }
        .auto-style9 {
            width: 100%;
            height: 48px;
        }
        .auto-style10 {
            width: 358px;
            text-align: right;
        }
        .auto-style11 {
            text-align: right;
            width: 564px;
        }
        .auto-style13 {
            width: 100%;
            height: 235px;
        }
        .auto-style15 {
            text-align: center;
            width: 212px;
            height: 33px;
        }
        .auto-style16 {
            width: 100%;
            height: 70px;
        }
        .auto-style17 {
            width: 15px;
        }
        .auto-style18 {
            height: 43px;
            text-align: left;
            width: 184px;
        }
        .auto-style19 {
            height: 47px;
            width: 184px;
        }
        .auto-style21 {
            width: 122px;
        }
        .auto-style22 {
            width: 149px;
            height: 33px;
        }
        .auto-style23 {
            width: 312px;
        }
        .auto-style24 {
            width: 149px;
            height: 28px;
        }
        .auto-style25 {
            text-align: center;
            width: 212px;
            height: 28px;
        }
        .auto-style26 {
            height: 28px;
        }
        .auto-style27 {
            width: 184px;
        }
        .auto-style28 {
            width: 211px;
            text-align: right;
            height: 41px;
        }
        .auto-style29 {
            width: 184px;
            height: 41px;
        }
        .auto-style30 {
            height: 41px;
        }
        .auto-style31 {
            height: 33px;
        }
    </style>
</head>
<body style="width: 717px; height: 40px; margin-right: 3px; margin-bottom: 3px;">
    <form id="form1" runat="server" class="auto-style8">
        <div class="auto-style1" style="font-size: 39px; color: #FF0000; font-weight: bold;">
            New Booking</div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="lblName" runat="server" Text="Name:" Font-Bold="True"></asp:Label>
                </td>
                <td class="auto-style19">
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter Name of dog" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="lblBreed" runat="server" Text="Breed:" Font-Bold="True"></asp:Label>
                </td>
                <td class="auto-style18"><asp:TextBox ID="txtBreed" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter Breed of dog" ControlToValidate="txtBreed"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="lblGender" runat="server" Text="Gender:" Font-Bold="True"></asp:Label>
                </td>
                <td class="auto-style27">
                    <asp:RadioButton ID="rbMale" runat="server" GroupName="Gender" OnCheckedChanged="rbMale_CheckedChanged" Text="Male" Font-Bold="True" ForeColor="Blue" />
&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RadioButton ID="rbFemale" runat="server" GroupName="Gender" OnCheckedChanged="rbFemale_CheckedChanged" Text="Female" Font-Bold="True" ForeColor="#993399" />
                </td>
                <td>
                    <asp:Label ID="lblError_Gender" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style28">
                    <asp:Label ID="lblTreatment" runat="server" Text="Treatment:" Font-Bold="True"></asp:Label>
                </td>
                <td class="auto-style29">
                    &nbsp;<asp:DropDownList ID="dropListTreatment" runat="server" Height="16px"  Width="136px" AutoPostBack="True">
                        <asp:ListItem Selected="True" Value="-1">Treatments</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style30">
                    <asp:Label ID="lblError_treatment" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="lblTel" runat="server" Text="Tel. number:" Font-Bold="True"></asp:Label>
                </td>
                <td class="auto-style27">
                    &nbsp;<asp:TextBox ID="txtTel" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtTel" ErrorMessage="Enter valid South-African Telephone number" ValidationExpression="(0\d{9})"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
        <table class="auto-style9">
            <tr>
                <td class="auto-style10">
                    <asp:Label ID="lblDate" runat="server" Text="Select date of appointment:" Font-Bold="True" Font-Size="15pt"></asp:Label>
                </td>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style23">&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style13">
            <tr>
                <td class="auto-style21"></td>
                <td class="auto-style11">
                    <asp:Calendar ID="Calendar" runat="server" Width="316px" BackColor="#99FF66"></asp:Calendar>
                </td>
            </tr>
        </table>
        <table class="auto-style16">
            <tr>
                <td class="auto-style22"></td>
                <td class="auto-style15">
                    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit Booking" Font-Bold="True" />
                </td>
                <td class="auto-style31">
                    <asp:Label ID="lblError" runat="server" Font-Bold="True" Font-Size="14pt" Font-Underline="True" ForeColor="#FF2B2B"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style24">
                    <asp:HyperLink ID="hyperLinkBack" runat="server" NavigateUrl="~/Default.aspx" Font-Bold="True" Font-Size="15pt" Font-Underline="False" BackColor="#DFDFDF" BorderColor="#DFDFDF" BorderStyle="Outset">Main Menu</asp:HyperLink>
                </td>
                <td class="auto-style25">
                </td>
                <td class="auto-style26">
                </td>
            </tr>
        </table>
        <br />
    </form>
</body>
</html>
