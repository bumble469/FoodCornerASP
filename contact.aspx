<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="FoodWebsite.WebForm2" %>
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
    <div class="contact-body">
        <div class="container">
            <div>
              <h2>Contact Us</h2>
              <h5>How to get in touch?</h5>
              <hr class="jumbotron-hr-about">
            </div>       
            <div class="row">
                <div id="lsec" class="col-lg-6 row-md-6 row-sm-12">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <form>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <asp:Label ID="NameLabel" runat="server" Text="Name: "></asp:Label>
                                        <asp:TextBox ID="NameField" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required!" ControlToValidate="NameField" ForeColor="#ff3300" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <asp:Label ID="EmailLabel" runat="server" Text="Email"></asp:Label>
                                        <asp:TextBox ID="EmailField" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required!" ControlToValidate="EmailField" ForeColor="#ff3300" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email!" ForeColor="#FF3300" ControlToValidate="EmailField" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="SubjectLabel" runat="server" Text="Subject"></asp:Label>
                                    <asp:TextBox ID="SubjectField" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required!" ControlToValidate="SubjectField" ForeColor="#ff3300" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="MessageLabel" runat="server" Text="Message"></asp:Label>
                                    <asp:TextBox ID="MessageField" runat="server" CssClass="form-control" TextMode ="Multiline"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required!" ControlToValidate="MessageField" ForeColor="#ff3300" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <asp:Button ID="SendButton" runat="server" Text="Send" CssClass="btn-mail" OnClick="Button1_Click" AutoPostBack="true"></asp:Button>
                            </form>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="SendButton" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                        <ProgressTemplate>
                            <asp:Image ID="LoadingImage" runat="server" Height="40" Width="40" ImageUrl="images/sending.gif" CssClass="feedbackLoadingIcon" BackColor="White" />
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </div>
                <div id="rsec" class="col-lg-6 row-md-6 row-sm-12">
                    <div>Call</div>
                    <div class="contact-details">
                        <asp:HyperLink ID="callLink1" runat="server" NavigateUrl="tel:999-334-399">999-334-399 /</asp:HyperLink>
                        <asp:HyperLink ID="callLink2" runat="server" NavigateUrl="tel:999-334-400">999-334-400</asp:HyperLink>
                    </div>
                    <div>Email</div>
                    <div class="contact-details">
                        <asp:HyperLink ID="mailtoLink1" runat="server" NavigateUrl="mailto:foodcornerofficial@gmail.com">foodcornerofficial@gmail.com /  </asp:HyperLink>
                        <asp:HyperLink ID="mailtoLink2" runat="server" NavigateUrl="mailto:foodcornersupport@gmail.com">foodcornersupport@gmail.com</asp:HyperLink>
                    </div>
                    <div class="contact-details">
                        <div>Follow us on</div>
                        <span class="icons">
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/insta.png" ToolTip="instagram" />
                            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="images/facebook.png" ToolTip="facebook" />
                            <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="images/twitter.png" ToolTip="Twitter" />
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
