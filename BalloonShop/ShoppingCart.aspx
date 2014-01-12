﻿<%@ Page Title="TicketsOne: Количка" Language="C#" MasterPageFile="~/BalloonShop.master"
  AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="ShoppingCart" %>

<%@ Register src="UserControls/ProductRecommendations.ascx" tagname="ProductRecommendations" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <p>
    <asp:Label ID="titleLabel" runat="server" Text="Вашата количка за пазаруване" CssClass="CatalogTitle" />
  </p>
  <p>
    <asp:Label ID="statusLabel" runat="server" />
  </p>
  <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID"
    Width="100%" BorderWidth="0px" OnRowDeleting="grid_RowDeleting">
    <Columns>
      <asp:BoundField DataField="Name" HeaderText="Име на продукт" ReadOnly="True" SortExpression="Name">
        <ControlStyle Width="100%" />
      </asp:BoundField>
      <asp:BoundField DataField="Price" DataFormatString="{0:c}" HeaderText="Цена" ReadOnly="True"
        SortExpression="Price" />
      <asp:BoundField DataField="Attributes" HeaderText="Допълнително" ReadOnly="True" />
      <asp:TemplateField HeaderText="Количество">
        <ItemTemplate>
          <asp:TextBox ID="editQuantity" runat="server" CssClass="GridEditingRow" Width="24px"
            MaxLength="2" Text='<%#Eval("Quantity")%>' />
        </ItemTemplate>
      </asp:TemplateField>
      <asp:BoundField DataField="Subtotal" DataFormatString="{0:c}" HeaderText="Цена"
        ReadOnly="True" SortExpression="Subtotal" />
      <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Премахни"></asp:ButtonField>
    </Columns>
  </asp:GridView>
  <p align="right">
    <span>Обща цена: </span>
    <asp:Label ID="totalAmountLabel" runat="server" Text="" />
  </p>
  <p align="right">
    <asp:Button ID="updateButton" runat="server" Text="Обнови количеството" 
      onclick="updateButton_Click" />
    <asp:Button ID="checkoutButton" runat="server" 
      Text="Продължете към плащането" onclick="checkoutButton_Click" />  
  </p>
  <uc1:ProductRecommendations ID="recommendations" runat="server" />
</asp:Content>