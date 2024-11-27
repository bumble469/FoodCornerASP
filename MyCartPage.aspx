<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="MyCartPage.aspx.cs" Inherits="FoodWebsite.MyCartPage" %>
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
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-12 text-center">
                    <asp:Button ID="Button2" runat="server" Text="Continue Adding.." CssClass="ContShopping" Font-Names="trebuchet" PostBackUrl="~/OrderOnline.aspx"/>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 text-center">
                    <asp:Label ID="totalCost" runat="server" Text="TOTAL: " CssClass="mr-auto" Font-Bold="true" Font-Names="trebuchet" Font-Size="Larger"></asp:Label>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 text-center">
                    <asp:Button ID="Button1" runat="server" Text="Checkout" CssClass="Checkout" Font-Names="trebuchet" />
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 text-center">
                    <asp:Label runat="server" ID="InfoText" Text="Delivery charges(+100), Bag charges included(+5), Please keep change " CssClass="mr-auto" Font-Italic="true" Font-Names="trebuchet" Font-Size="Small" ForeColor="#669999"></asp:Label>
                </div>
            </div>
            <div class="row cart-view">
                <div class="col-lg-12">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">                    
                        <ContentTemplate>
                            <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting" CellSpacing="15" CellPadding="10" Font-Names="trebuchet" BorderWidth="0" GridLines="Horizontal" HorizontalAlign="Center">
                                <Columns>
                                    <asp:BoundField DataField="Sr" HeaderText="Sr.no">
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ItemId" HeaderText="Item Id">
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ItemName" HeaderText="Item Name"></asp:BoundField>
                                    <asp:BoundField HeaderText="Category" DataField="Category">
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:ImageField DataImageUrlField="ImageLink" HeaderText="Image" ItemStyle-HorizontalAlign="Center">
                                        <ControlStyle Height="200px" Width="200px"></ControlStyle>
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:ImageField>
                                    <asp:BoundField DataField="smallqty" HeaderText="Small Qty">
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="largeqty" HeaderText="Large Qty">
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PriceSmall" HeaderText="Small Price">
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PriceLarge" HeaderText="Large Price">
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" ControlStyle-ForeColor="IndianRed">
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:CommandField>
                                </Columns>
                            </asp:GridView>
                            </div>
                        </ContentTemplate>                   
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
