using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodWebsite
{
    public partial class OnlineOrder : Page
    {
        private string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected DropDownList DropDownList1;
        protected Label ItemsInCart;
        protected Button ShowCart;
        protected ListView ListView1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack)
                return;
            this.fillListView();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.fillListView();
        }

        private void fillListView()
        {
            string selectedValue = this.DropDownList1.SelectedValue;
            SqlConnection connection = new SqlConnection(this.strcon);
            connection.Open();
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(new SqlCommand("SELECT * FROM " + selectedValue, connection));
            DataTable dataTable1 = new DataTable();
            DataTable dataTable2 = dataTable1;
            sqlDataAdapter.Fill(dataTable2);
            this.ListView1.DataSource = (object)dataTable1;
            this.ListView1.DataBind();
            connection.Close();
        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (!(e.CommandName == "addtocart"))
                return;
            DropDownList control1 = (DropDownList)e.Item.FindControl("DropDownListSmall");
            DropDownList control2 = (DropDownList)e.Item.FindControl("DropDownListLarge");
            if (control1.SelectedValue != "0" || control2.SelectedValue != "0")
                this.Response.Redirect("MyCartPage.aspx?itemid=" + e.CommandArgument.ToString() + "&itemcategory=" + this.DropDownList1.SelectedValue + "&smallqty=" + control1.SelectedValue + "&largeqty=" + control2.SelectedValue);
            else
                this.Response.Write("<script>alert('Must select a non-zero quantity to add in cart!');</script>");
        }
    }
}
