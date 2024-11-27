using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodWebsite
{
    public partial class WebForm3 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            this.Response.Redirect("Breakfast.aspx");
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            this.Response.Redirect("Lunch.aspx");
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            this.Response.Redirect("Snacks.aspx");
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            this.Response.Redirect("Dinner.aspx");
        }

        protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
        {
            this.Response.Redirect("Veg.aspx");
        }

        protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
        {
            this.Response.Redirect("NonVeg.aspx");
        }

        protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
        {
            this.Response.Redirect("Dessert.aspx");
        }

        protected void ImageButton8_Click(object sender, ImageClickEventArgs e)
        {
            this.Response.Redirect("Beverages.aspx");
        }
    }
}
