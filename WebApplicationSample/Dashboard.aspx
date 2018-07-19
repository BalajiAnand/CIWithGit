<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WebApplicationSample.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2 style="color: #3BA0D8; font-style: normal;">Asp.net Listview Control Sample</h2>
            <asp:ListView ID="lvCustomers" runat="server" OnPagePropertiesChanging="OnPagePropertiesChanging">
                <LayoutTemplate>
                    <table cellpadding="20" cellspacing="0" border="0" runat="server">
                        <tr style="background-color: #808080; color: white; text-align: center">
                            <th>ID
                            </th>
                            <th>Name
                            </th>
                            <th>Email
                            </th>
                            <th>Phone
                            </th>
                            <th>Address
                            </th>
                            <th>Password
                            </th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server"></tr>
                    </table>
                    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lvCustomers" PageSize="5">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true"
                                ShowNextPageButton="false" />
                            <asp:NumericPagerField ButtonType="Link" />
                            <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="false" />
                        </Fields>
                    </asp:DataPager>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# Eval("id") %>
                        </td>
                        <td>
                            <%# Eval("name") %>
                        </td>
                        <td>
                            <%# Eval("email") %>
                        </td>
                        <td>
                            <%# Eval("phone") %>
                        </td>
                        <td>
                            <%# Eval("address") %>
                        </td>
                        <td>
                            <%# Eval("password") %>
                        </td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr style="background-color: #EFEFEF">
                        <td>
                            <%# Eval("id") %>
                        </td>
                        <td>
                            <%# Eval("name") %>
                        </td>
                        <td>
                            <%# Eval("email") %>
                        </td>
                        <td>
                            <%# Eval("phone") %>
                        </td>
                        <td>
                            <%# Eval("address") %>
                        </td>
                        <td>
                            <%# Eval("password") %>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
            </asp:ListView>
        </div>
    </form>
</body>
</html>
