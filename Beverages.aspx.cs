// Decompiled with JetBrains decompiler
// Type: HalalFoodCorner.Beverages
// Assembly: DemoFoodCorner, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: B4B34EB1-6A47-4FBA-877B-D5538F5509A9
// Assembly location: C:\projects\resutaurantwebsite\bin\DemoFoodCorner.dll

using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodWebsite
{
    public partial class Beverages : Page
    {
        private string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e) => this.BindGridView();

        private void BindGridView()
        {
            try
            {
                SqlConnection connection = new SqlConnection(this.strcon);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(new SqlCommand("SELECT * FROM BeveragesItems", connection));
                DataSet dataSet1 = new DataSet();
                DataSet dataSet2 = dataSet1;
                sqlDataAdapter.Fill(dataSet2);
                connection.Close();
                if (dataSet1.Tables.Count <= 0 || dataSet1.Tables[0].Rows.Count <= 0)
                    return;
                this.Repeater1.DataSource = (object)dataSet1.Tables[0];
                this.Repeater1.DataBind();
            }
            catch (Exception ex)
            {
                this.Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}
