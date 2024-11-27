using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodWebsite
{
    public partial class MyCartPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack)
                return;
            DataTable dataTable1 = new DataTable();
            dataTable1.Columns.Add("Sr");
            dataTable1.Columns.Add("ItemId");
            dataTable1.Columns.Add("ItemName");
            dataTable1.Columns.Add("Category");
            dataTable1.Columns.Add("SmallQty");
            dataTable1.Columns.Add("LargeQty");
            dataTable1.Columns.Add("PriceSmall");
            dataTable1.Columns.Add("PriceLarge");
            dataTable1.Columns.Add("ImageLink");
            dataTable1.Columns.Add("Total");
            if (this.Request.QueryString["ItemId"] != null)
            {
                if (this.Session["Buyitems"] == null)
                {
                    string str = this.Request.QueryString["itemcategory"].ToString();
                    int int32_1 = Convert.ToInt32(this.Request.QueryString["itemid"]);
                    DataRow row = dataTable1.NewRow();
                    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
                    SqlCommand selectCommand = new SqlCommand("SELECT * FROM " + str + " WHERE ItemId = @itemid", connection);
                    selectCommand.Parameters.AddWithValue("@itemid", (object)int32_1);
                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(selectCommand);
                    DataSet dataSet1 = new DataSet();
                    DataSet dataSet2 = dataSet1;
                    sqlDataAdapter.Fill(dataSet2);
                    row["Sr"] = (object)1;
                    row["ItemId"] = (object)dataSet1.Tables[0].Rows[0]["ItemId"].ToString();
                    row["ItemName"] = (object)dataSet1.Tables[0].Rows[0]["ItemName"].ToString();
                    row["Category"] = (object)str;
                    row["SmallQty"] = (object)this.Request.QueryString["smallqty"].ToString();
                    row["LargeQty"] = (object)this.Request.QueryString["largeqty"].ToString();
                    row["PriceSmall"] = (object)dataSet1.Tables[0].Rows[0]["PriceSmall"].ToString();
                    row["PriceLarge"] = (object)dataSet1.Tables[0].Rows[0]["PriceLarge"].ToString();
                    row["ImageLink"] = (object)dataSet1.Tables[0].Rows[0]["ImageLink"].ToString();
                    int int32_2 = Convert.ToInt32(this.Request.QueryString["smallqty"]);
                    int int32_3 = Convert.ToInt32(this.Request.QueryString["largeqty"]);
                    int int32_4 = Convert.ToInt32(dataSet1.Tables[0].Rows[0]["PriceSmall"].ToString());
                    int int32_5 = Convert.ToInt32(dataSet1.Tables[0].Rows[0]["PriceLarge"].ToString());
                    int num1 = int32_4;
                    int num2 = int32_2 * num1 + int32_3 * int32_5;
                    row["Total"] = (object)num2;
                    dataTable1.Rows.Add(row);
                    this.GridView1.DataSource = (object)dataTable1;
                    this.GridView1.DataBind();
                    this.Session["buyitems"] = (object)dataTable1;
                    this.GridView1.FooterRow.Cells[7].Text = "Total Amount";
                    this.GridView1.FooterRow.Cells[8].Text = "&#8377;" + this.grandtotal().ToString() + "/-";
                    Label totalCost = this.totalCost;
                    totalCost.Text = totalCost.Text + "&#8377;" + (this.grandtotal() + 105).ToString() + "/-";
                }
                else
                {
                    string str = this.Request.QueryString["itemcategory"].ToString();
                    int int32_6 = Convert.ToInt32(this.Request.QueryString["itemid"]);
                    DataTable dataTable2 = (DataTable)this.Session["buyitems"];
                    int count = dataTable2.Rows.Count;
                    DataRow row = dataTable2.NewRow();
                    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
                    SqlCommand selectCommand = new SqlCommand("SELECT * FROM " + str + " WHERE ItemId = @itemid", connection);
                    selectCommand.Parameters.AddWithValue("@itemid", (object)int32_6);
                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(selectCommand);
                    DataSet dataSet3 = new DataSet();
                    DataSet dataSet4 = dataSet3;
                    sqlDataAdapter.Fill(dataSet4);
                    row["Sr"] = (object)(count + 1);
                    row["Sr"] = (object)1;
                    row["ItemId"] = (object)dataSet3.Tables[0].Rows[0]["ItemId"].ToString();
                    row["ItemName"] = (object)dataSet3.Tables[0].Rows[0]["ItemName"].ToString();
                    row["Category"] = (object)str;
                    row["SmallQty"] = (object)this.Request.QueryString["smallqty"].ToString();
                    row["LargeQty"] = (object)this.Request.QueryString["largeqty"].ToString();
                    row["PriceSmall"] = (object)dataSet3.Tables[0].Rows[0]["PriceSmall"].ToString();
                    row["PriceLarge"] = (object)dataSet3.Tables[0].Rows[0]["PriceLarge"].ToString();
                    row["ImageLink"] = (object)dataSet3.Tables[0].Rows[0]["ImageLink"].ToString();
                    int int32_7 = Convert.ToInt32(this.Request.QueryString["smallqty"]);
                    int int32_8 = Convert.ToInt32(this.Request.QueryString["largeqty"]);
                    int int32_9 = Convert.ToInt32(dataSet3.Tables[0].Rows[0]["PriceSmall"].ToString());
                    int int32_10 = Convert.ToInt32(dataSet3.Tables[0].Rows[0]["PriceLarge"].ToString());
                    int num3 = int32_9;
                    int num4 = int32_7 * num3 + int32_8 * int32_10;
                    row["Total"] = (object)num4;
                    dataTable2.Rows.Add(row);
                    this.GridView1.DataSource = (object)dataTable2;
                    this.GridView1.DataBind();
                    this.Session["buyitems"] = (object)dataTable2;
                    this.GridView1.FooterRow.Cells[7].Text = "Total Amount";
                    this.GridView1.FooterRow.Cells[8].Text = "&#8377;" + this.grandtotal().ToString() + "/-";
                    Label totalCost = this.totalCost;
                    totalCost.Text = totalCost.Text + "&#8377;" + (this.grandtotal() + 105).ToString() + "/-";
                }
            }
            else
            {
                this.GridView1.DataSource = (object)(DataTable)this.Session["buyitems"];
                this.GridView1.DataBind();
                if (this.GridView1.Rows.Count <= 0)
                    return;
                this.GridView1.FooterRow.Cells[6].Text = "Total Amount";
                this.GridView1.FooterRow.Cells[8].Text = "&#8377;" + this.grandtotal().ToString() + "/-";
                Label totalCost = this.totalCost;
                totalCost.Text = totalCost.Text + "&#8377;" + (this.grandtotal() + 105).ToString() + "/-";
            }
        }

        public int grandtotal()
        {
            DataTable dataTable1 = new DataTable();
            DataTable dataTable2 = (DataTable)this.Session["buyitems"];
            int count = dataTable2.Rows.Count;
            int index = 0;
            int num = 0;
            for (; index < count; ++index)
                num += Convert.ToInt32(dataTable2.Rows[index]["Total"].ToString());
            return num;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dataTable1 = new DataTable();
            DataTable dataTable2 = (DataTable)this.Session["buyitems"];
            for (int index = 0; index <= dataTable2.Rows.Count - 1; ++index)
            {
                int int32_1 = Convert.ToInt32(dataTable2.Rows[index]["Sr"].ToString());
                string text = this.GridView1.Rows[e.RowIndex].Cells[0].Text;
                int32_1.ToString();
                int int32_2 = Convert.ToInt32(text);
                if (int32_1 == int32_2)
                {
                    dataTable2.Rows[index].Delete();
                    dataTable2.AcceptChanges();
                    break;
                }
            }
            for (int index = 1; index <= dataTable2.Rows.Count - 1; ++index)
            {
                dataTable2.Rows[index - 1]["Sr"] = (object)index;
                dataTable2.AcceptChanges();
            }
            this.Session["buyitems"] = (object)dataTable2;
            this.Response.Redirect("MyCartPage.aspx");
        }
    }
}
