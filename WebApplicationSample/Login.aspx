<%@ Page Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplicationSample.Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceRightView" runat="server">
    <h1 style="color: #0094ff; margin-left: 10%; text-align: center; margin-top: 15%; font-size: xx-large">Best Pratices</h1>
    <h1 style="color: black; margin-left: 10%; text-align: left; font-size: large; margin-top: 10%;">Sign into your account</h1>
    <div>
        <i class="glyphicon glyphicon-user" style="font-size: 25px; vertical-align: bottom; margin-left: 10%; margin-top: 8%"></i>
        <asp:TextBox ID="TextBoxusername" runat="server" CssClass="textbox" BorderStyle="NotSet" placeholder="Username"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="reqValidatorusername" ControlToValidate="TextBoxusername" ErrorMessage='<img src="/WebApp/images/img_error.png" width="25px">' />
    </div>
    <div>
        <i class="glyphicon glyphicon-lock" style="font-size: 25px; vertical-align: bottom; margin-left: 10%; margin-top: 5%"></i>
        <asp:TextBox ID="TextBoxPassword" runat="server" MaxLength="25" CssClass="textbox" BorderStyle="NotSet" TextMode="Password" placeholder="Password" ClientIDMode="Static"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="requriedvalidatorpwd" ControlToValidate="TextBoxPassword" ErrorMessage='<img src="/WebApp/images/img_error.png" width="25px">' />
    </div>
    <div style="vertical-align: bottom; margin-left: 10%; margin-top: 5%; display: block">
        <label style="vertical-align: top; font-style: normal; font-size: 12px; user-select: none">
            <asp:CheckBox ID="CheckBoxShowPwd" runat="server" Checked="false" AutoPostBack="false" CssClass="checkbox-align" ClientIDMode="Static" />
            Show Password</label>
    </div>
    <asp:Button ID="btnLogin" runat="server" CssClass="btn" Text="Login" OnClick="btnLogin_Click" />
    <label style="text-align: center; position: absolute; bottom: 10%; left: 35%;">Don't have an account</label>
    <%--<asp:LinkButton ID="LinkCreateAccount" CausesValidation="false" runat="server" Text="Create new Account" CssClass="labelbottomcenter" OnClick="LinkCreateAccount_Click"></asp:LinkButton>--%>
    <asp:HyperLink ID="HyperLink1" runat="server" Text="Create new Account" CssClass="labelbottomcenter" NavigateUrl="~/Register.aspx"></asp:HyperLink>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderDialog" runat="server">
    <div class="blocker" id="loginBlocker" runat="server">
        <div class="dialog">
            <button type="button" class="close" style="margin: 10px;">&times;</button>
            <h4 style="text-align: left; padding: 10px; border-bottom: 1px solid #ccc;">Alert</h4>
            <p style="text-align: left; padding: 10px;"><%= GetMessage() %></p>
            <div style="background-color: rgba(232, 232, 232, 0.79); width: 100%; display: block; text-align: right;">
                <asp:Button ID="btnOk" CausesValidation="false" runat="server" CssClass="btn-ok" Text="OK" />
            </div>
        </div>
    </div>
</asp:Content>

