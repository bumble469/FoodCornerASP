<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Breakfast.aspx.cs" Inherits="FoodWebsite.MenuItemPages.Breakfast"%>
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
    <div class="container item-container">
        <div class="row">
            <div class="col-lg-3">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/left-arrow.png" Height="30" Width="30" PostBackUrl="~/MenuPage.aspx" CssClass="backbutton"/></div>
            <div class="col-lg-6 text-center">
                <h2 id="menu-categories-title" class="text-center">Breakfast Menu</h2>
            </div>              
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="row">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="menu-item-tile col-lg-6 col-md-6 col-sm-12">
                        <div class="row">
                            <div class="col-sm-5">
                                <div class="menu-item-photo">
                                    <div>
                                        <asp:Label ID="ItemId" runat="server" Text='<%# Eval("ItemId") %>'></asp:Label>
                                    </div>
                                    <asp:Image CssClass="img-responsive" ID="Image1" runat="server" ImageUrl='<%# Eval("ImageLink") %>' Height="250" Width="250" />
                                </div>
                                <div class="menu-item-price">
                                    &#8377;<asp:Label ID="PriceSmall" runat="server" Text='<%# Eval("PriceSmall") %>'></asp:Label><span> (small)</span>
                                    &#8377;<asp:Label ID="PriceLarge" runat="server" Text='<%# Eval("PriceLarge") %>'></asp:Label><span> (large)</span>
                                </div>
                            </div>
                            <div class="menu-item-desc col-lg-6 col-sm-4">
                                <h3 ID="ItemName" class="menu-item-title" runat="server"><%# Eval("ItemName") %></h3>
                                <p ID="ItemDesc" class="menu-item-details" runat="server"><%# Eval("Description") %></p>
                            </div>
                        </div>
                        <hr class="d-block d-sm-none" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </div>
</asp:Content>
