<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="signupPage.aspx.cs" Inherits="FoodWebsite.signupPage" %>
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
    <div class="signup-body">
        <div class="container">
            <h2 class="text-center mb-4">Sign Up</h2>
            <hr class="jumbotron-hr-form">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="form-group col-lg-4 col-md-6 col-sm-12">
                            <label for="firstname">Firstname:</label>
                            <asp:TextBox ID="FirstName" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required!" Display="Dynamic" ForeColor="#FF3300" ControlToValidate="FirstName"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-lg-4 col-md-6 col-sm-12">
                            <label for="lastname">Lastname:</label>
                            <asp:TextBox ID="LastName" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required!" Display="Dynamic" ForeColor="#FF3300" ControlToValidate="LastName"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-lg-4 col-md-12 col-sm-12">
                            <label for="email">Email:</label>
                            <asp:TextBox ID="userEmailid" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required!" Display="Dynamic" ForeColor="#FF3300" ControlToValidate="userEmailid"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Emailid!" Display="Dynamic" ForeColor="#FF3300" ControlToValidate="userEmailid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group col-lg-4 col-md-6 col-sm-12">
                            <label for="password">Password:</label>
                            <asp:TextBox ID="userPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required!" Display="Dynamic" ForeColor="#FF3300" ControlToValidate="userPassword"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Password length must be 8 to 16 characters!" Display="Dynamic" ForeColor="#FF3300" ControlToValidate="userPassword" ValidationExpression="^.{8,16}$"></asp:RegularExpressionValidator>
                        </div>               
                        <div class="form-group col-lg-4 col-md-6 col-sm-12">
                            <label for="confirmpassword">Confirm Password</label>
                            <asp:TextBox ID="userConfirmPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required!" Display="Dynamic" ForeColor="#FF3300" ControlToValidate="userConfirmPassword"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords do not match!" ControlToCompare="userPassword" ControlToValidate="userConfirmPassword" Display="Dynamic" ForeColor="#ff3300"></asp:CompareValidator>
                        </div>
                        <div class="form-group col-lg-4 col-md-6 col-sm-12">
                            <label for="contact">Contact:</label>
                            <asp:TextBox ID="UserContact" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required!" Display="Dynamic" ForeColor="#FF3300" ControlToValidate="UserContact"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid Phone no!" ControlToValidate="UserContact" ValidationExpression="^\d{10}$" ForeColor="#ff3300"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-lg-4 col-md-6 col-sm-12">
                            <label for="pincode">Postal Code:</label>
                            <asp:TextBox ID="UserPincode" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required!" Display="Dynamic" ForeColor="#FF3300" ControlToValidate="UserPincode"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Invalid Postal Code!" ControlToValidate="UserPincode" ValidationExpression="^\d{6}$" ForeColor="#ff3300"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group col-lg-4 col-md-3 col-sm-12">
                            <label for="gender">Gender: </label>
                            <asp:RadioButtonList ID="genderRadioButtonList" runat="server" CssClass="form-control radio-spacing" RepeatDirection="Horizontal" ForeColor="White">
                                <asp:ListItem Text="Male&nbsp;&nbsp;&nbsp;&nbsp;" Value="Male" />
                                <asp:ListItem Text="Female" Value="Female" />
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Required!" ForeColor="#FF3300" ControlToValidate="genderRadioButtonList"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-lg-4 col-md-3 col-sm-12">
                            <label for="gender">City: </label>
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                <asp:ListItem Text="New Delhi" Value="New Delhi" />
                                <asp:ListItem Text="Mumbai" Value="Mumbai" />
                                <asp:ListItem Text="Kolkata" Value="Kolkata" />
                                <asp:ListItem Text="Chennai" Value="Chennai" />
                                <asp:ListItem Text="Hyderabad" Value="Hyderabad" />
                            </asp:DropDownList>                
                        </div>
                    </div>
                    <div class="form-group">
                        <div><label for="address">Address:</label></div>
                        <asp:TextBox ID="UserAddress" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Required!" Display="Dynamic" ForeColor="#FF3300" ControlToValidate="UserAddress"></asp:RequiredFieldValidator>
                    </div>
                    <div class="text-center">
                        <asp:Button ID="SignupButton" runat="server" Text="SignUp" CssClass="login-btn" OnClick="Button1_Click"></asp:Button>
                    </div><br />
                    <div class="text-center">
                        <asp:Label ID="Label1" runat="server" Text="Already have an account? "></asp:Label>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="loginPage.aspx">Login here</asp:HyperLink>
                    </div>
                    <div class="text-center">
                        <asp:Label ID="ErrorMsg" runat="server"></asp:Label>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="SignupButton" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                <ProgressTemplate>
                    <div class="text-center">
                        <asp:Image ID="Image1" runat="server" ImageUrl="images/donut.gif" Height="60" Width="60"/>
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </div>
</asp:Content>
