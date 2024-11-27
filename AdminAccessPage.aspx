<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="AdminAccessPage.aspx.cs" Inherits="FoodWebsite.AdminAccessPage" %>
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
    <div class="adminaccess-body">
        <div class="container-fluid">
            <div class="row justify-content-center AdminOpts">
                <div class="col-lg-6 text-center">
                    <asp:Button ID="UsersBtn" runat="server" Text="Users" CssClass="login-btn" OnClick="UsersBtn_Click" AutoPostBack="false"/>
                </div>
                <div class="col-lg-6 text-center">
                    <asp:Button ID="ItemsBtn" runat="server" Text="MenuItems" CssClass="login-btn" OnClick="ItemsBtn_Click" AutoPostBack="false"/>
                </div><br />
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <div class="text-center mt-2 mt-md-0">
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" BackColor="#6b2020" ForeColor="#ffffff" Font-Size="14px" Width="200px" CssClass="form-control" Font-Bold="true" Font-Names="trebuchet">
                                <asp:ListItem Selected="True">Breakfast</asp:ListItem>
                                <asp:ListItem>Lunch</asp:ListItem>
                                <asp:ListItem>Snack</asp:ListItem>
                                <asp:ListItem>Dinner</asp:ListItem>
                                <asp:ListItem>Veg</asp:ListItem>
                                <asp:ListItem>NonVeg</asp:ListItem>
                                <asp:ListItem>Dessert</asp:ListItem>
                                <asp:ListItem>Beverages</asp:ListItem>
                            </asp:DropDownList>
                        </div>  
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ItemsBtn" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <div class="row justify-content-center">       
                <div class="col-lg-12">
                    <div class="table-responsive">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="userid" AllowPaging="True" CssClass="GV" AllowSorting="True" BorderStyle="Ridge" ShowFooter="true" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">
                                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                    <RowStyle BackColor="#444444" ForeColor="White" />
                                    <PagerStyle BackColor="#333333" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#666666" />
                                    <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/editDetailsIcon.png" CommandName="Edit" ToolTip="edit" Width="20" Height="20"/>
                                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/deleteDetailsIcon.png" CommandName="Delete" ToolTip="delete" Width="20" Height="20"/>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:ImageButton ID="ImageButton3" runat="server"  ImageUrl="~/images/updateDetailsIcon.png" CommandName="Update" ToolTip="save changes" Width="20" Height="20" />
                                                <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/images/cancelDetailsIcon.png" CommandName="Cancel" ToolTip="cancel" Width="20" Height="20"/>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ID">
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Eval("userid") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Firstname">
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Eval("firstname") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="editFirstname" runat="server" Text='<%#Eval("firstname") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Lastname">
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Eval("lastname") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="editLastname" runat="server" Text='<%#Eval("lastname") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="EmailID">
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="editEmail" runat="server" Text='<%#Eval("email") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Password">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" Text='<%# Eval("password") %>' TextMode="Password" Enabled="false"></asp:TextBox>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="editPassword" runat="server" Text='<%#Eval("password") %>' TextMode="Password" Enabled="false"></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Contact">
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Eval("contact") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="editContact" runat="server" Text='<%#Eval("contact") %>'></asp:TextBox>
                                            </EditItemTemplate> 
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Postal Code">
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Eval("postalcode") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="editPostalcode" runat="server" Text='<%#Eval("postalcode") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Gender">
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Eval("gender") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="editGender" runat="server" Text='<%#Eval("gender") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="City">
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Eval("city") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="editCity" runat="server" Text='<%#Eval("city") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Address">
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Eval("address") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="editAddress" runat="server" Text='<%#Eval("address") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="UsersBtn" EventName="Click"/>
                            </Triggers>
                        </asp:UpdatePanel>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>  
                                <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" DataKeyNames="ItemId" AllowPaging="True" CssClass="GV" AllowSorting="True" BorderStyle="Ridge" ShowFooter="true" OnRowCommand="GridView2_RowCommand" OnRowUpdating="GridView2_RowUpdating" OnRowDeleting="GridView2_RowDeleting">
                                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                    <RowStyle BackColor="#444444" ForeColor="White" />
                                    <PagerStyle BackColor="#333333" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#666666" />
                                    <FooterStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/editDetailsIcon.png" CommandName="Edit" ToolTip="edit" Width="20" Height="20"/>
                                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/deleteDetailsIcon.png" CommandName="Delete" ToolTip="delete" Width="20" Height="20"/>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:ImageButton ID="ImageButton3" runat="server"  ImageUrl="~/images/updateDetailsIcon.png" CommandName="Update" ToolTip="save changes" Width="20" Height="20" />
                                                <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/images/cancelDetailsIcon.png" CommandName="Cancel" ToolTip="cancel" Width="20" Height="20"/>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/images/addDetailsIcon.png" CommandName="AddNew" ToolTip="add item" Width="20" Height="20"/>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Item Id">
                                            <ItemTemplate>
                                                <asp:Label ID="itemid" runat="server" Text='<%# Eval("ItemId") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Item Name">
                                            <ItemTemplate>
                                                <asp:Label ID="itemname" runat="server" Text='<%# Eval("ItemName") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="editItemName" runat="server" Text='<%# Eval("ItemName") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="footerItemName" runat="server"></asp:TextBox>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Price Small">
                                            <ItemTemplate>
                                                <asp:Label ID="pricesmall" runat="server" Text='<%# Eval("PriceSmall") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="editPriceSmall" runat="server" Text='<%# Eval("PriceSmall") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="footerPriceSmall" runat="server"></asp:TextBox>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Price Large">
                                            <ItemTemplate>
                                                <asp:Label ID="pricelarge" runat="server" Text='<%# Eval("PriceLarge") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="editPriceLarge" runat="server" Text='<%# Eval("PriceLarge") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="footerPriceLarge" runat="server"></asp:TextBox>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Description">
                                            <ItemTemplate>
                                                <asp:Label ID="desc" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="editDesc" runat="server" Text='<%# Eval("Description") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="footerDesc" runat="server"></asp:TextBox>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Image Link">
                                            <ItemTemplate>
                                                <asp:Label ID="imagelink" runat="server" Text='<%# Eval("ImageLink") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="editImageLink" runat="server" Text='<%# Eval("ImageLink") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <asp:TextBox ID="footerImageLink" runat="server"></asp:TextBox>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="DropDownList1" EventName="SelectedIndexChanged"/>
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [users]"></asp:SqlDataSource>             
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [BreakfastItems]"></asp:SqlDataSource>             
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [LunchItems]"></asp:SqlDataSource>             
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [SnacksItems]"></asp:SqlDataSource>             
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [DinnerItems]"></asp:SqlDataSource>             
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [VegItems]"></asp:SqlDataSource>             
                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [NonVegItems]"></asp:SqlDataSource>             
                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [DessertItems]"></asp:SqlDataSource>             
                    <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [BeveragesItems]"></asp:SqlDataSource>             
                </div>
            </div>
        </div>
    </div>
</asp:Content>
