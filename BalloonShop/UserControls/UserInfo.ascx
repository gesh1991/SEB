<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserInfo.ascx.cs" Inherits="UserControls_UserInfo" %>
<table cellspacing="0" border="0" width="200px">
    <asp:LoginView ID="LoginView1" runat="server">
        <AnonymousTemplate>
            <tr>
                <td class="UserInfoHead">
                    Добре дошли!
                </td>
            </tr>
            <tr>
                <td class="UserInfoContent">
                    Не сте влезли в профила си.
                    <br />
                    <asp:LoginStatus ID="LoginStatus1" runat="server" LoginText="Влезте тук " />
                    или се
                    <asp:HyperLink runat="server" ID="registerLink" NavigateUrl="~/Register.aspx" Text=" Регистрирайте тук"
                        ToolTip="Регистрирайте се." />
                </td>
            </tr>
        </AnonymousTemplate>
        <RoleGroups>
            <asp:RoleGroup Roles="Administrators">
                <ContentTemplate>
                    <tr>
                        <td class="UserInfoHead">
                            <asp:LoginName ID="LoginName2" runat="server" FormatString="Здравейте, <b>{0}</b>!" />
                        </td>
                    </tr>
                    <tr>
                        <td class="UserInfoContent">
                            <asp:LoginStatus ID="LoginStatus2" runat="server" />
                            <br />
                            <asp:HyperLink ID="HyperLink4" NavigateUrl="~/" runat="server" Text="TicketsOne" />
                            <br />
                            <asp:HyperLink ID="HyperLink1" NavigateUrl="~/AdminDepartments.aspx" runat="server"
                                Text="Каталог за администратори" />
                            <br />
                            <asp:HyperLink ID="HyperLink2" NavigateUrl="~/AdminShoppingCart.aspx" runat="server"
                                Text="Кошница за администратори" />
                            <br />
                            <asp:HyperLink ID="HyperLink3" NavigateUrl="~/AdminOrders.aspx" runat="server" Text="Поръчки на администратори" />
                        </td>
                    </tr>
                </ContentTemplate>
            </asp:RoleGroup>
            <asp:RoleGroup Roles="Customers">
                <ContentTemplate>
                    <tr>
                        <td class="UserInfoHead">
                            <asp:LoginName ID="LoginName2" runat="server" FormatString="Здравейте, <b>{0}</b>!" />
                        </td>
                    </tr>
                    <tr>
                        <td class="UserInfoContent">
                            <asp:LoginStatus ID="LoginStatus1" runat="server" />
                            <br />
                            <asp:HyperLink runat="server" ID="detailsLink" NavigateUrl="~/CustomerDetails.aspx"
                                Text="Промяна на личните данни" ToolTip="Променете личните си данни" />
                        </td>
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>
</table>
