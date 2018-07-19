<%@ Page Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplicationSample.Register" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceRightView" runat="server">
    <h1 style="color: #0094ff; margin-left: 5%; text-align: left; margin-top: 10%; font-size: x-large">Sign Up</h1>
    <h1 style="color: black; margin-left: 5%; text-align: left; font-size: large; margin-top: 3%;">Create an Pratices Account</h1>
    <div class="registerview">
        <div>
            <i class="glyphicon glyphicon-user img-1" style="font-size: 20px; vertical-align: bottom; margin-bottom: 5px;"></i>
            <asp:TextBox ID="TextBoxusername" runat="server" CssClass="textboxregister" BorderStyle="NotSet" placeholder="Username"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="reqValidatorusername" ControlToValidate="TextBoxusername" ErrorMessage='<img src="/WebApp/images/img_error.png" width="25px">' />
        </div>
        <div>
            <i class="glyphicon glyphicon-envelope img-2" style="font-size: 20px; vertical-align: bottom; margin-top: 5%; margin-bottom: 5px;"></i>
            <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="textboxregister" BorderStyle="NotSet" TextMode="Email" placeholder="E-mail"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="TextBoxEmail" ErrorMessage='<img src="/WebApp/images/img_error.png" width="25px">' />
        </div>
        <div>
            <i class="glyphicon glyphicon-pencil img-3" style="font-size: 20px; vertical-align: bottom; margin-top: 5%; margin-bottom: 5px;"></i>
            <asp:TextBox ID="TextBoxPwd" runat="server" CssClass="textboxregister" BorderStyle="NotSet" TextMode="Password" placeholder="Password" MaxLength="25"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="TextBoxPwd" ErrorMessage='<img src="/WebApp/images/img_error.png" width="25px">' />
        </div>
        <div>
            <i class="glyphicon glyphicon-pencil img-4" style="font-size: 20px; vertical-align: bottom; margin-top: 5%; margin-bottom: 5px;"></i>
            <asp:TextBox ID="TextBoxConfirmPwd" runat="server" CssClass="textboxregister" BorderStyle="NotSet" TextMode="Password" placeholder="Confirm Password" MaxLength="25"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="TextBoxConfirmPwd" ErrorMessage='<img src="/WebApp/images/img_error.png" width="25px">' />
        </div>
        <div>
            <i class="glyphicon glyphicon-phone img-5" style="font-size: 20px; vertical-align: bottom; margin-top: 5%; margin-bottom: 5px;"></i>
            <asp:TextBox ID="TextBoxPhone" runat="server" CssClass="textboxregister" BorderStyle="NotSet" placeholder="Phone"  onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32);" MaxLength="10"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="TextBoxPhone" ErrorMessage='<img src="/WebApp/images/img_error.png" width="25px">' />
        </div>
        <div>
            <i class="glyphicon glyphicon-home img-6" style="font-size: 20px; vertical-align: bottom; margin-top: 5%; margin-bottom: 5px;"></i>
            <asp:TextBox ID="TextBoxAddress" runat="server" CssClass="textboxregister" BorderStyle="NotSet" placeholder="Address" TextMode="SingleLine"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ControlToValidate="TextBoxAddress" ErrorMessage='<img src="/WebApp/images/img_error.png" width="25px">' />
        </div>
        <div>
            <label style="vertical-align: bottom; margin-top: 15px; font-style: normal; font-size: 12px; user-select: none; display: block;">
                <asp:CheckBox ID="CheckBoxShowPwd" runat="server" CssClass="checkbox-align" Checked="true" />
                I agree to the Terms of Services</label>
            <asp:Button ID="btnRegister" runat="server" CssClass="btn-register" Text="Register" />
        </div>
        <div style="position: absolute; width: 100%; bottom: 15px; text-align: center; left: 0px;">
            <label>
                Already a member? 
                            <%--<asp:LinkButton ID="LinkLogin" CausesValidation="false" runat="server" Text="Sign In" CssClass="labelregisterbottomcenter"></asp:LinkButton>--%>
                <asp:HyperLink ID="HyperLink1" runat="server" Text="Sign In" CssClass="labelregisterbottomcenter" NavigateUrl="~/Login.aspx"></asp:HyperLink>
            </label>

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderDialog" runat="server">
    <div class="blocker" id="registerBlocker" runat="server">
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
