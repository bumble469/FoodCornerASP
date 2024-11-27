using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodWebsite
{
    public partial class WebForm1 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (this.Session["role"] != null && this.Session["role"].ToString() == "user")
                {
                    this.orderOnline.Enabled = true;
                    this.orderOnline.ToolTip = "Get your food at home!";
                }
                else
                {
                    this.orderOnline.Enabled = false;
                    this.orderOnline.ToolTip = "Login to gain access!";
                }
            }
            catch (Exception ex)
            {
                this.Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            this.menuTile.NavigateUrl = "MenuPage.aspx";
            this.specialsTile.NavigateUrl = "SpecialsPage.aspx";
        }
    }
}
