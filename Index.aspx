<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="FoodWebsite.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="custom-css/custom-css.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="custom-js/custom-js.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <div id="div1" class="jumbotron">
        <div class="main-text">
            <h3 id="jumbotron-text-l" class="jumbotron-text">Eat Safe, Stay Safe!</h3>
            <p id="jumbotron-text-s" class="jumbotron-text">We COOK it! We SEASON it! We SERVE it! You LOVE it!</p>
            <hr class="jumbotron-hr">
            <asp:Button CssClass="jumbotron-text-b" ID="orderOnline" runat="server" Text="Order Online" PostBackUrl="OnlineOrder.aspx" />
        </div>
    </div>
    <div id="home-tiles" class="row">
        <div class="col-md-4 col-sm-6 col-xs-12">
            <asp:HyperLink ID="menuTile" runat="server"><div id="menu-tile"><span>Menu</span></div></asp:HyperLink>
        </div>
        <div class="col-md-4 col-sm-6 col-xs-12">
            <asp:HyperLink ID="specialsTile" runat="server"><div id="specials-tile"><span>Specials</span></div></asp:HyperLink>
        </div>
        <div class="col-md-4 col-sm-12 col-xs-12">
            <asp:HyperLink ID="mapTile" runat="server">
                <div id="map-tile">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3773.325139585127!2d72.83524164388463!3d18.961242817404134!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7ce393532db6f%3A0x892d4d2a7b13e56a!2sXR6M%2BPFG%2C%20Babulla%20Tank%20Cross%20Ln%2C%20Noor%20Baug%2C%20Umerkhadi%2C%20Mumbai%2C%20Maharashtra%20400009!5e0!3m2!1sen!2sin!4v1702655713546!5m2!1sen!2sin" width="100%" height="250" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    <span>Map</span>
                    </div>
            </asp:HyperLink>
        </div>
    </div>
</asp:Content>
