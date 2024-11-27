<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="SpecialsPage.aspx.cs" Inherits="FoodWebsite.SpecialsPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="custom-css/custom-css.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="custom-js/custom-js.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <div class="container-fluid specials-body">
        <div class="row justify-content-center">
            <div class="col-lg-6 text-center">
                <h2 id="specials-category-title" class="text-center">Today's Special</h2>
            </div>
        </div>
        <div class="row">
            <div class="card1 col-lg-6 col-md-6 col-sm-12">
                <asp:Image ID="Image2" runat="server" ImageUrl="images/paperclip.png" Height="40" Width="40" CssClass="paperclip1"/>
                <div class="card-content">
                    <h3>What makes this part special!!?</h3>
                    <asp:Label ID="Label5" runat="server" Text="Discover the essence of culinary excellence woven into every dish in our Special Menu. Each offering is a masterpiece crafted with precision and passion, promising a culinary journey unlike any other. Dive into a world of flavor where innovation meets tradition, offering a symphony of taste sensations to tantalize your palate. From exotic creations to timeless classics reimagined, every dish is a celebration of gastronomic artistry. Sourced from the finest ingredients and prepared with meticulous care, our Special Menu is a testament to our commitment to excellence. Indulge in seasonal delights and discover the freshest flavors brought to life in each carefully curated dish. Immerse yourself in an unforgettable dining experience where every moment is infused with warmth and hospitality."></asp:Label>
                </div>
            </div>
            <div class="card-container col-lg-6 col-md-6 col-sm-12">
                <div class="card2">
                    <asp:Image ID="Image3" runat="server" ImageUrl="images/paperclip.png" Height="40" Width="40" CssClass="paperclip2"/>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="card-content">
                                <h3>Special</h3>
                                <asp:Label ID="SpecialNo" runat="server" Text="Special No: "></asp:Label><br />
                                <asp:Label ID="SpecialName" runat="server" Text="Special Name: "></asp:Label><br />
                                <asp:Label ID="SpecialPrice" runat="server" Text="Price: &#8377;"></asp:Label><br />
                                <asp:Label ID="SpecialDescription" runat="server" Text="Description: "></asp:Label>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <asp:Image ID="SpecialImage" runat="server" Height="400" Width="250"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
