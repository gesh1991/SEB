<%@ Page Language="C#" MasterPageFile="~/BalloonShop.master" Title="TicketsOne: Какво търсите?" %>

<script runat="server">
  protected void Page_Load(object sender, EventArgs e)
  {
    // set the 404 status code
    Response.StatusCode = 404;
  }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <h1>Търсите билети?</h1>
  <p>Страницата която заявихте не съществува на сървъра! Молим да ни извините за неудобството</p>
  <p>Посетете нашия <asp:HyperLink ID="HyperLink1" runat="server" Target="~/" Text="каталог" />, или се свържете с нас на support@ticketsоne.com !</p>
  <p>Екипът на <b>TicketsOne</b></p>
</asp:Content>