<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Aboutus.aspx.cs" Inherits="FoodWebsite.Aboutus" %>
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
    <div class="aboutus-body">
    <div class="container">
        <div class="row">
            <div id="about-links" class="col-lg-12 col-md-12 col-sm-12">
                <span>
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="LinkButton1_Click" CssClass="owner" OnClick="LinkButton1_Click">OWNERS</asp:LinkButton></span>
                <span>
                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="staff" OnClientClick="LinkButton2_Click" OnClick="LinkButton2_Click">STAFF</asp:LinkButton></span>
                <span>
                    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="achievements" OnClientClick="LinkButton3_Click" OnClick="LinkButton3_Click">ACHIEVEMENTS</asp:LinkButton></span>
            </div>
            <hr class="jumbotron-hr-about">
            <div id="about-info" class="col-lg-6 col-md-6 col-sm-12">
                <div class="about-content">
                    <asp:Label ID="Label1" runat="server" Text="Owners" CssClass="aboutHeading"></asp:Label><br /><br />
                    <asp:Label ID="Label2" runat="server" Text="This is owner information" CssClass="aboutPara"></asp:Label>
                </div><br />
            </div>
            <div id="about-img-main-div" class="col-lg-6 col-md-6 col-sm-12">
                <div class="jumbotron" id="aboutimg" runat="server">
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
