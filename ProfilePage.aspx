<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="FoodWebsite.ProfilePage" %>
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
    <div class="profile-body">
        <div class="container">
            <h2 id="usertitle" class="text-center mb-4" runat="server">Profile</h2>
            <hr class="jumbotron-hr-form">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12 text-center">
                    <div class="row">
                        <asp:ImageButton runat="server" ImageUrl="images/left-arrow.png" Height="30" Width="30" ToolTip="back" PostBackUrl="Index.aspx"></asp:ImageButton>
                    </div>
                    <div class="row justify-content-center align-items-center">
                        <asp:Image runat="server" ImageUrl="images/user.png" Height="130" Width="130"></asp:Image>
                    </div>
                    <div class="row justify-content-center">
                        <asp:TextBox ID="UserPassword" runat="server" CssClass="form-control" TextMode="Password" OnTextChanged="UserPassword_TextChanged" AutoPostBack="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Confirm Password" ControlToValidate="UserPassword" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="row justify-content-around">
                        <asp:Button ID="editbtn" runat="server" Text="Edit Account" CssClass="login-btn" OnClick="editbtn_Click" />
                    </div>
                    <div class="row justify-content-around">                       
                        <asp:Button ID="deletebtn" runat="server" Text="Delete Account" CssClass="login-btn" UseSubmitBehavior="False" OnClick="deletebtn_Click" />
                    </div>
                    <div class="row justify-content-around">
                        <asp:Button ID="savebtn" runat="server" Text="Save Changes" CssClass="login-btn" OnClick="savebtn_Click" />
                        <asp:Button ID="cancelbtn" runat="server" Text="Cancel Changes" CssClass="login-btn" OnClick="cancelbtn_Click" />
                    </div>
                </div>
                 <div class="col-lg-6 col-md-6 col-sm-12">
                     <div class="row user-details">  
                        <p class="first-name col-lg-6 col-md-6 col-sm-12">Firstname:<asp:TextBox ID="FirstNameTextBox" runat="server" CssClass="form-control"/></p>
                        <p class="last-name col-lg-6 col-md-6 col-sm-12">Lastname:<asp:TextBox ID="LastNameTextBox" runat="server" CssClass="form-control"/></p>
                        <p class="user-email col-lg-6 col-md-6 col-sm-12">Email: <asp:TextBox ID="UserEmailTextBox" runat="server" CssClass="form-control"/></p>
                        <p class="user-location col-lg-6 col-md-6 col-sm-12">Contact: <asp:TextBox ID="UserContactTextBox" runat="server" CssClass="form-control"/></p>
                        <p class="user-age col-lg-6 col-md-6 col-sm-12">PostalCode: <asp:TextBox ID="UserPostalcodeTextBox" runat="server" CssClass="form-control"/></p>
                        <p class="user-interests col-lg-6 col-md-6 col-sm-12">Gender: <asp:TextBox ID="UserGenderTextBox" runat="server" CssClass="form-control"/></p>
                        <p class="user-interests col-lg-6 col-md-6 col-sm-12">City: <asp:TextBox ID="UserCityTextBox" runat="server" CssClass="form-control"/></p>
                        <p class="user-interests col-lg-6 col-md-6 col-sm-12">Address: <asp:TextBox ID="UserAddressTextBox" runat="server" CssClass="form-control" Textmode="multiline"/></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
