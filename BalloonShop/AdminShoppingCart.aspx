﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true"
    CodeFile="AdminShoppingCart.aspx.cs" Inherits="AdminShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="titlePlaceHolder" runat="Server">
    <span class="AdminTitle">TicketsOne Администратор
        <br />
        Количка за пазаруване </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="adminPlaceHolder" runat="Server">
    <p>
        <asp:Label ID="countLabel" runat="server">Здравейте!
        </asp:Label></p>
    <p>
        <span>Колко дни?</span>
        <asp:DropDownList ID="daysList" runat="server">
            <asp:ListItem Value="0">Всички колички</asp:ListItem>
            <asp:ListItem Value="1">Една</asp:ListItem>
            <asp:ListItem Value="10" Selected="True">Десет</asp:ListItem>
            <asp:ListItem Value="20">Двайсет</asp:ListItem>
            <asp:ListItem Value="30">Трийсет</asp:ListItem>
            <asp:ListItem Value="90">Деветдесет</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        <asp:Button ID="countButton" runat="server" Text="Преброй старите колички" OnClick="countButton_Click" />
        <asp:Button ID="deleteButton" runat="server" Text="Изтрий старите колички" OnClick="deleteButton_Click" />
    </p>
</asp:Content>
