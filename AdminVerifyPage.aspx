<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="AdminVerifyPage.aspx.cs" Inherits="FoodWebsite.AdminVerifyPage" %>
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
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="login-body">
        <div class="container">
            <h2 class="text-center mb-4">Enter Verification Code Sent to Admin Mail</h2>
            <hr class="jumbotron-hr-form">
            <div class="form-group">
                <label for="code">Code:</label>
                <asp:TextBox ID="VerCode" runat="server" CssClass="form-control" TextMode="Password" MaxLength="6"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="VerCode" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <div class="text-center">
                    <asp:Button ID="VerifyBtn" runat="server" Text="Verify" CssClass="login-btn" OnClick="loginbtn_Click" />
                    <asp:Label ID="errorMsg" runat="server" Text="" ForeColor="red"></asp:Label>
                </div>
            </div>
        </div>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
            <ProgressTemplate>
                <div class="text-center">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/donut.gif" Width="60" Height="60"/>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
</asp:Content>
