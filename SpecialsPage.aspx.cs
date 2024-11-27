using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodWebsite
{
    public partial class SpecialsPage : Page
    {
        private string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            int num = new Random().Next(1, 4);
            try
            {
                SqlConnection connection = new SqlConnection(this.strcon);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();
                SqlCommand sqlCommand = new SqlCommand("SELECT * FROM SpecialItems WHERE ItemId=@ItemId", connection);
                sqlCommand.Parameters.AddWithValue("@ItemId", (object)num);
                SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
                if (sqlDataReader.Read())
                {
                    this.SpecialNo.Text += sqlDataReader["ItemId"].ToString();
                    this.SpecialName.Text += sqlDataReader["ItemName"].ToString();
                    this.SpecialPrice.Text += sqlDataReader["Price"].ToString();
                    this.SpecialDescription.Text += sqlDataReader["Description"].ToString();
                    this.SpecialImage.ImageUrl = sqlDataReader["ImageLink"].ToString();
                }
                sqlDataReader.Close();
            }
            catch (Exception ex)
            {
                this.Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}
