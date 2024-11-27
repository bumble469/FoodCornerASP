<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="OrderOnline.aspx.cs" Inherits="FoodWebsite.OnlineOrder" %>
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
    <div class="orderonlinebody">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-lg-3 col-md-6 col-sm-12 mt-3 mt-md-0">
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control m-auto" AutoPostBack="True" BackColor="#6b2020" ForeColor="#ffffff" Font-Size="14px" Width="200px" Font-Bold="true" Font-Names="trebuchet" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="BreakfastItems">Breakfast</asp:ListItem>
                        <asp:ListItem Value="LunchItems">Lunch</asp:ListItem>
                        <asp:ListItem Value="SnacksItems">Snack</asp:ListItem>
                        <asp:ListItem Value="DinnerItems">Dinner</asp:ListItem>
                        <asp:ListItem Value="VegItems">Veg</asp:ListItem>
                        <asp:ListItem Value="NonVegItems">NonVeg</asp:ListItem>
                        <asp:ListItem Value="DessertItems">Dessert</asp:ListItem>
                        <asp:ListItem Value="BeveragesItems">Beverages</asp:ListItem>
                    </asp:DropDownList>
                </div>  
                <div class="col-lg-3 col-md-6 col-sm-12 mt-3 mt-md-0 text-center">
                    <asp:Label ID="ItemsInCart" runat="server" Text="Items in Cart: " CssClass="mr-auto" Font-Bold="true" Font-Names="trebuchet" Font-Size="Larger"></asp:Label>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 mt-3 mt-md-0 text-center">
                    <asp:Button runat="server" ID="ShowCart" CssClass="ShowCart" Text="Show Cart" PostBackUrl="~/MyCartPage.aspx"/>
                </div>
            </div>
            <div class="row" runat="server">
                <asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand">
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
                                        <asp:Button ID="Button1" runat="server" Text="Cart-In" CssClass="login-btn" Font-Size="Larger"
                                        CommandArgument='<%# Eval("ItemId") %>' CommandName="addtocart"/>
                                        <div>
                                            &#8377;<asp:Label ID="PriceSmall" runat="server" Text='<%# Eval("PriceSmall") %>'></asp:Label><span> (small)</span>
                                            <asp:DropDownList ID="DropDownListSmall" runat="server">
                                                <asp:ListItem Value="0">0</asp:ListItem>
                                                <asp:ListItem Value="1">1</asp:ListItem>
                                                <asp:ListItem Value="2">2</asp:ListItem>
                                                <asp:ListItem Value="3">3</asp:ListItem>
                                                <asp:ListItem Value="4">4</asp:ListItem>
                                                <asp:ListItem Value="5">5</asp:ListItem>
                                                <asp:ListItem Value="6">6</asp:ListItem>
                                                <asp:ListItem Value="7">7</asp:ListItem>
                                                <asp:ListItem Value="8">8</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div>
                                            &#8377;<asp:Label ID="PriceLarge" runat="server" Text='<%# Eval("PriceLarge") %>'></asp:Label><span> (large)</span>
                                            <asp:DropDownList ID="DropDownListLarge" runat="server">
                                                <asp:ListItem Value="0">0</asp:ListItem>
                                                <asp:ListItem Value="1">1</asp:ListItem>
                                                <asp:ListItem Value="2">2</asp:ListItem>
                                                <asp:ListItem Value="3">3</asp:ListItem>
                                                <asp:ListItem Value="4">4</asp:ListItem>
                                                <asp:ListItem Value="5">5</asp:ListItem>
                                                <asp:ListItem Value="6">6</asp:ListItem>
                                            </asp:DropDownList>
                                       </div>
                
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
                </asp:ListView>             
            </div>
        </div>
    </div>
</asp:Content>
