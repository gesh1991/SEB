﻿<%@ Page Title="TicketsOne: Онлайн магазин" Language="C#" MasterPageFile="~/BalloonShop.master" %>

<%@ Register src="UserControls/ProductsList.ascx" tagname="ProductsList" tagprefix="uc1" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>
    <span class="CatalogTitle">Добре дошли в TicketsOne!</span>
  </h1>
  <h2>
    <span class="CatalogDescription">Тази седмица на промоция предлагаме: </span>
  </h2>
  <uc1:ProductsList ID="ProductsList1" runat="server" />
</asp:Content>


