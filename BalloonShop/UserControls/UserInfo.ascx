<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserInfo.ascx.cs" Inherits="UserControls_UserInfo" %>
<table cellspacing="0" border="0" width="200px">
    <asp:LoginView ID="LoginView1" runat="server">
        <AnonymousTemplate>
            <tr>
                <td class="UserInfoHead">
                    Welcome!
                </td>
            </tr>
            <tr>
                <td class="UserInfoContent">
                    You are not logged in.
                    <br />
                    <asp:LoginStatus ID="LoginStatus1" runat="server" />
                    or
                    <asp:HyperLink runat="server" ID="registerLink" NavigateUrl="~/Register.aspx" Text="Register"
                        ToolTip="Go to the registration page" />
                </td>
            </tr>
        </AnonymousTemplate>
        <RoleGroups>
            <asp:RoleGroup Roles="Administrators">
                <ContentTemplate>
                    <tr>
                        <td class="UserInfoHead">
                            <asp:LoginName ID="LoginName2" runat="server" FormatString="Hello, <b>{0}</b>!" />
                        </td>
                    </tr>
                    <tr>
                        <td class="UserInfoContent">
                            <asp:LoginStatus ID="LoginStatus2" runat="server" />
                            <br />
                            <asp:HyperLink ID="HyperLink4" NavigateUrl="~/" runat="server" Text="BalloonShop" />
                            <br />
                            <asp:HyperLink ID="HyperLink1" NavigateUrl="~/AdminDepartments.aspx" runat="server"
                                Text="Catalog Admin" />
                            <br />
                            <asp:HyperLink ID="HyperLink2" NavigateUrl="~/AdminShoppingCart.aspx" runat="server"
                                Text="Cart Admin" />
                            <br />
                            <asp:HyperLink ID="HyperLink3" NavigateUrl="~/AdminOrders.aspx" runat="server" Text="Orders Admin" />
                        </td>
                    </tr>
                </ContentTemplate>
            </asp:RoleGroup>
            <asp:RoleGroup Roles="Customers">
                <ContentTemplate>
                    <tr>
                        <td class="UserInfoHead">
                            <asp:LoginName ID="LoginName2" runat="server" FormatString="Hello, <b>{0}</b>!" />
                        </td>
                    </tr>
                    <tr>
                        <td class="UserInfoContent">
                            <asp:LoginStatus ID="LoginStatus1" runat="server" />
                            <br />
                            <asp:HyperLink runat="server" ID="detailsLink" NavigateUrl="~/CustomerDetails.aspx"
                                Text="Edit Details" ToolTip="Edit your personal details" />
                        </td>
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>
</table>
