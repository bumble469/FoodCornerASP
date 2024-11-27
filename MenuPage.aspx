<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="MenuPage.aspx.cs" Inherits="FoodWebsite.WebForm3" %>
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
    <div class="menu-categories-body">
        <div class="container">
            <h2 id="menu-categories" class="text-center">Menu Categories</h2>
            <div class="row">
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                    <div class="category-tile">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/categories/Br.jpg" Height="200px" Width="200px" CssClass="category-tile" OnClick="ImageButton1_Click"></asp:ImageButton>
                        <span>Breakfast</span>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                    <div class="category-tile">
                        <asp:ImageButton CssClass="category-tile" ID="ImageButton2" runat="server" ImageUrl="~/images/categories/L.jpg" Height="200px" Width="200px" OnClick="ImageButton2_Click"></asp:ImageButton>
                        <span>Lunch</span>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                    <div class="category-tile">
                        <asp:ImageButton CssClass="category-tile" ID="ImageButton3" runat="server" ImageUrl="~/images/categories/Sn.jpg" Height="200px" Width="200px" OnClick="ImageButton3_Click"></asp:ImageButton>
                        <span>Snacks</span>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                    <div class="category-tile">
                        <asp:ImageButton CssClass="category-tile" ID="ImageButton4" runat="server" ImageUrl="~/images/categories/Di.jpg" Height="200px" Width="200px" OnClick="ImageButton4_Click"></asp:ImageButton>
                        <span>Dinner</span>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                    <div class="category-tile">
                        <asp:ImageButton CssClass="category-tile" ID="ImageButton5" runat="server" ImageUrl="~/images/categories/Vg.jpg" Height="200px" Width="200px" OnClick="ImageButton5_Click"></asp:ImageButton>
                        <span>Veg</span>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                    <div class="category-tile">
                        <asp:ImageButton CssClass="category-tile" ID="ImageButton6" runat="server" ImageUrl="~/images/categories/Nvg.jpg" Height="200px" Width="200px" OnClick="ImageButton6_Click"></asp:ImageButton>
                        <span>Non-Veg</span>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                    <div class="category-tile">
                        <asp:ImageButton CssClass="category-tile" ID="ImageButton7" runat="server" ImageUrl="~/images/categories/De.jpg" Height="200px" Width="200px" OnClick="ImageButton7_Click"></asp:ImageButton>
                        <span>Dessert</span>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                    <div class="category-tile">
                        <asp:ImageButton CssClass="category-tile" ID="ImageButton8" runat="server" ImageUrl="~/images/categories/Be.jpg" Height="200px" Width="200px" OnClick="ImageButton8_Click"></asp:ImageButton>
                        <span>Beverages</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
