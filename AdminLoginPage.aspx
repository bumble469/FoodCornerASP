<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="AdminLoginPage.aspx.cs" Inherits="FoodWebsite.AdminPageaspx" %>
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
    <div class="login-body">
    <div class="container">               
        <h2 class="text-center mb-4">Admin Login</h2>
        <hr class="jumbotron-hr-form">
        <div class="form-group">
            <label for="username">Username:</label>
            <asp:TextBox ID="userEmailid" runat="server" CssClass="form-control"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="errormsg" runat="server" ErrorMessage="Required!" ForeColor="#FF3300" ControlToValidate="userEmailid" Display="Dynamic"></asp:RequiredFieldValidator>    
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <asp:TextBox ID="userPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required!" ForeColor="#FF3300" ControlToValidate="userPassword" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Password length must be 8 to 16 characters!" Display="Dynamic" ForeColor="#FF3300" ControlToValidate="userPassword" ValidationExpression="^.{8,16}$"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <div class="text-center">
                <asp:Button ID="loginbtn" runat="server" Text="Login" CssClass="login-btn" OnClick="loginbtn_Click" />
                <asp:Label ID="errorMsg" runat="server" Text="" ForeColor="red"></asp:Label>
            </div>
        </div>
    </div>
</div>
</asp:Content>
