using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodWebsite
{
    public partial class AdminAccessPage : Page
    {
        private string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack)
                return;
            this.GridView2.Visible = false;
            this.DropDownList1.Visible = false;
        }

        protected void UsersBtn_Click(object sender, EventArgs e)
        {
            this.GridView1.Visible = true;
            this.GridView2.Visible = false;
            this.DropDownList1.Visible = false;
        }

        protected void ItemsBtn_Click(object sender, EventArgs e)
        {
            this.GridView1.Visible = false;
            this.GridView2.Visible = true;
            this.DropDownList1.Visible = true;
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = this.GridView1.Rows[e.RowIndex];
            int int32 = Convert.ToInt32(this.GridView1.DataKeys[e.RowIndex].Value);
            TextBox control1 = row.FindControl("editFirstname") as TextBox;
            TextBox control2 = row.FindControl("editLastname") as TextBox;
            TextBox control3 = row.FindControl("editEmail") as TextBox;
            TextBox control4 = row.FindControl("editContact") as TextBox;
            TextBox control5 = row.FindControl("editPostalcode") as TextBox;
            TextBox control6 = row.FindControl("editGender") as TextBox;
            TextBox control7 = row.FindControl("editCity") as TextBox;
            TextBox control8 = row.FindControl("editAddress") as TextBox;
            string cmdText = "UPDATE users SET firstname=@firstname, lastname=@lastname, email=@email, contact=@contact, postalcode=@postalcode, gender=@gender, city=@city, address=@address WHERE userid=@userid";
            try
            {
                SqlConnection connection = new SqlConnection(this.strcon);
                SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
                sqlCommand.Parameters.AddWithValue("@firstname", (object)control1.Text);
                sqlCommand.Parameters.AddWithValue("@lastname", (object)control2.Text);
                sqlCommand.Parameters.AddWithValue("@email", (object)control3.Text);
                sqlCommand.Parameters.AddWithValue("@contact", (object)control4.Text);
                sqlCommand.Parameters.AddWithValue("@postalcode", (object)control5.Text);
                sqlCommand.Parameters.AddWithValue("@gender", (object)control6.Text);
                sqlCommand.Parameters.AddWithValue("@city", (object)control7.Text);
                sqlCommand.Parameters.AddWithValue("@address", (object)control8.Text);
                sqlCommand.Parameters.AddWithValue("@userid", (object)int32);
                connection.Open();
                if (sqlCommand.ExecuteNonQuery() > 0)
                    this.Response.Write("<script>alert('Changes Made!')</script>");
                else
                    this.Response.Write("<script>alert('Issue occurred')</script>");
            }
            catch (Exception ex)
            {
                this.Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
            this.GridView1.EditIndex = -1;
            this.BindGridView();
        }

        private void BindGridView() => this.GridView1.DataBind();

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int int32 = Convert.ToInt32(this.GridView1.DataKeys[e.RowIndex].Value);
                string script = "if(!confirm('Are you sure you want to delete this record?')) return;";
                System.Web.UI.ScriptManager.RegisterStartupScript((Page)this, this.GetType(), "DeleteConfirmation", script, true);
                string cmdText = "DELETE FROM users WHERE userid=@userid";
                using (SqlConnection connection = new SqlConnection(this.strcon))
                {
                    using (SqlCommand sqlCommand = new SqlCommand(cmdText, connection))
                    {
                        sqlCommand.Parameters.AddWithValue("@userid", (object)int32);
                        connection.Open();
                        if (sqlCommand.ExecuteNonQuery() > 0)
                            this.Response.Write("<script>alert('Record Deleted!')</script>");
                        else
                            this.Response.Write("<script>alert('No record found to delete!')</script>");
                    }
                }
                this.BindGridView();
            }
            catch (Exception ex)
            {
                this.Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.DropDownList1.Visible = true;
            string str = this.DropDownList1.SelectedValue.ToString();
            if (str != null)
            {
                switch (str.Length)
                {
                    case 3:
                        if (str == "Veg")
                        {
                            this.GridView2.DataSourceID = this.SqlDataSource6.ID;
                            return;
                        }
                        break;
                    case 5:
                        switch (str[0])
                        {
                            case 'L':
                                if (str == "Lunch")
                                {
                                    this.GridView2.DataSourceID = this.SqlDataSource3.ID;
                                    return;
                                }
                                break;
                            case 'S':
                                if (str == "Snack")
                                {
                                    this.GridView2.DataSourceID = this.SqlDataSource4.ID;
                                    return;
                                }
                                break;
                        }
                        break;
                    case 6:
                        switch (str[0])
                        {
                            case 'D':
                                if (str == "Dinner")
                                {
                                    this.GridView2.DataSourceID = this.SqlDataSource5.ID;
                                    return;
                                }
                                break;
                            case 'N':
                                if (str == "NonVeg")
                                {
                                    this.GridView2.DataSourceID = this.SqlDataSource7.ID;
                                    return;
                                }
                                break;
                        }
                        break;
                    case 7:
                        if (str == "Dessert")
                        {
                            this.GridView2.DataSourceID = this.SqlDataSource8.ID;
                            return;
                        }
                        break;
                    case 9:
                        switch (str[1])
                        {
                            case 'e':
                                if (str == "Beverages")
                                {
                                    this.GridView2.DataSourceID = this.SqlDataSource9.ID;
                                    return;
                                }
                                break;
                            case 'r':
                                if (str == "Breakfast")
                                {
                                    this.GridView2.DataSourceID = this.SqlDataSource2.ID;
                                    return;
                                }
                                break;
                        }
                        break;
                }
            }
            this.GridView2.DataSourceID = (string)null;
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (!(e.CommandName == "AddNew"))
                return;
            try
            {
                string str1 = this.DropDownList1.SelectedValue.ToString();
                string str2 = "";
                if (str1 != null)
                {
                    switch (str1.Length)
                    {
                        case 3:
                            if (str1 == "Veg")
                            {
                                str2 = "VegItems";
                                goto label_23;
                            }
                            else
                                break;
                        case 5:
                            switch (str1[0])
                            {
                                case 'L':
                                    if (str1 == "Lunch")
                                    {
                                        str2 = "LunchItems";
                                        goto label_23;
                                    }
                                    else
                                        break;
                                case 'S':
                                    if (str1 == "Snack")
                                    {
                                        str2 = "SnacksItems";
                                        goto label_23;
                                    }
                                    else
                                        break;
                            }
                            break;
                        case 6:
                            switch (str1[0])
                            {
                                case 'D':
                                    if (str1 == "Dinner")
                                    {
                                        str2 = "DinnerItems";
                                        goto label_23;
                                    }
                                    else
                                        break;
                                case 'N':
                                    if (str1 == "NonVeg")
                                    {
                                        str2 = "NonVegItems";
                                        goto label_23;
                                    }
                                    else
                                        break;
                            }
                            break;
                        case 7:
                            if (str1 == "Dessert")
                            {
                                str2 = "DessertItems";
                                goto label_23;
                            }
                            else
                                break;
                        case 9:
                            switch (str1[1])
                            {
                                case 'e':
                                    if (str1 == "Beverages")
                                    {
                                        str2 = "BeveragesItems";
                                        goto label_23;
                                    }
                                    else
                                        break;
                                case 'r':
                                    if (str1 == "Breakfast")
                                    {
                                        str2 = "BreakfastItems";
                                        goto label_23;
                                    }
                                    else
                                        break;
                            }
                            break;
                    }
                }
                this.GridView2.DataSourceID = (string)null;
            label_23:
                string cmdText = "INSERT INTO " + str2 + " (ItemName, PriceSmall, PriceLarge, Description, ImageLink) VALUES (@itemname, @pricesmall, @pricelarge, @description, @imagelink)";
                using (SqlConnection connection = new SqlConnection(this.strcon))
                {
                    using (SqlCommand sqlCommand = new SqlCommand(cmdText, connection))
                    {
                        sqlCommand.Parameters.AddWithValue("@itemname", (object)((TextBox)this.GridView2.FooterRow.FindControl("footerItemName")).Text);
                        sqlCommand.Parameters.AddWithValue("@pricesmall", (object)Convert.ToInt32(((TextBox)this.GridView2.FooterRow.FindControl("footerPriceSmall")).Text));
                        sqlCommand.Parameters.AddWithValue("@pricelarge", (object)Convert.ToInt32(((TextBox)this.GridView2.FooterRow.FindControl("footerPriceLarge")).Text));
                        sqlCommand.Parameters.AddWithValue("@description", (object)((TextBox)this.GridView2.FooterRow.FindControl("footerDesc")).Text);
                        sqlCommand.Parameters.AddWithValue("@imagelink", (object)((TextBox)this.GridView2.FooterRow.FindControl("footerImageLink")).Text);
                        connection.Open();
                        if (sqlCommand.ExecuteNonQuery() > 0)
                            this.Response.Write("<script>alert('New record added successfully!')</script>");
                        else
                            this.Response.Write("<script>alert('Failed to add new record!')</script>");
                    }
                }
                this.GridView2.DataBind();
            }
            catch (Exception ex)
            {
                this.Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string str1 = this.DropDownList1.SelectedValue.ToString();
            string str2 = "";
            GridViewRow row = this.GridView2.Rows[e.RowIndex];
            int int32 = Convert.ToInt32(this.GridView2.DataKeys[e.RowIndex].Value);
            TextBox control1 = row.FindControl("editItemName") as TextBox;
            TextBox control2 = row.FindControl("editPriceSmall") as TextBox;
            TextBox control3 = row.FindControl("editPriceLarge") as TextBox;
            TextBox control4 = row.FindControl("editDesc") as TextBox;
            TextBox control5 = row.FindControl("editImageLink") as TextBox;
            if (str1 != null)
            {
                switch (str1.Length)
                {
                    case 3:
                        if (str1 == "Veg")
                        {
                            str2 = "VegItems";
                            goto label_22;
                        }
                        else
                            break;
                    case 5:
                        switch (str1[0])
                        {
                            case 'L':
                                if (str1 == "Lunch")
                                {
                                    str2 = "LunchItems";
                                    goto label_22;
                                }
                                else
                                    break;
                            case 'S':
                                if (str1 == "Snack")
                                {
                                    str2 = "SnacksItems";
                                    goto label_22;
                                }
                                else
                                    break;
                        }
                        break;
                    case 6:
                        switch (str1[0])
                        {
                            case 'D':
                                if (str1 == "Dinner")
                                {
                                    str2 = "DinnerItems";
                                    goto label_22;
                                }
                                else
                                    break;
                            case 'N':
                                if (str1 == "NonVeg")
                                {
                                    str2 = "NonVegItems";
                                    goto label_22;
                                }
                                else
                                    break;
                        }
                        break;
                    case 7:
                        if (str1 == "Dessert")
                        {
                            str2 = "DessertItems";
                            goto label_22;
                        }
                        else
                            break;
                    case 9:
                        switch (str1[1])
                        {
                            case 'e':
                                if (str1 == "Beverages")
                                {
                                    str2 = "BeveragesItems";
                                    goto label_22;
                                }
                                else
                                    break;
                            case 'r':
                                if (str1 == "Breakfast")
                                {
                                    str2 = "BreakfastItems";
                                    goto label_22;
                                }
                                else
                                    break;
                        }
                        break;
                }
            }
            this.GridView2.DataSourceID = (string)null;
        label_22:
            string cmdText = "UPDATE " + str2 + " SET ItemName=@itemname, PriceSmall=@pricesmall, PriceLarge=@pricelarge,Description=@description, ImageLink=@imagelink WHERE ItemId=@itemid";
            try
            {
                SqlConnection connection = new SqlConnection(this.strcon);
                SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
                sqlCommand.Parameters.AddWithValue("@itemid", (object)int32);
                sqlCommand.Parameters.AddWithValue("@itemname", (object)control1.Text);
                sqlCommand.Parameters.AddWithValue("@pricesmall", (object)Convert.ToInt32(control2.Text));
                sqlCommand.Parameters.AddWithValue("@pricelarge", (object)Convert.ToInt32(control3.Text));
                sqlCommand.Parameters.AddWithValue("@description", (object)control4.Text);
                sqlCommand.Parameters.AddWithValue("@imagelink", (object)control5.Text);
                connection.Open();
                if (sqlCommand.ExecuteNonQuery() > 0)
                    this.Response.Write("<script>alert('Changes Made!')</script>");
                else
                    this.Response.Write("<script>alert('Issue occurred')</script>");
            }
            catch (Exception ex)
            {
                this.Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
            this.GridView2.EditIndex = -1;
            this.GridView2.DataBind();
        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string str1 = this.DropDownList1.SelectedValue.ToString();
                string str2 = "";
                int int32 = Convert.ToInt32(this.GridView2.DataKeys[e.RowIndex].Value);
                if (str1 != null)
                {
                    switch (str1.Length)
                    {
                        case 3:
                            if (str1 == "Veg")
                            {
                                str2 = "VegItems";
                                goto label_22;
                            }
                            else
                                break;
                        case 5:
                            switch (str1[0])
                            {
                                case 'L':
                                    if (str1 == "Lunch")
                                    {
                                        str2 = "LunchItems";
                                        goto label_22;
                                    }
                                    else
                                        break;
                                case 'S':
                                    if (str1 == "Snack")
                                    {
                                        str2 = "SnacksItems";
                                        goto label_22;
                                    }
                                    else
                                        break;
                            }
                            break;
                        case 6:
                            switch (str1[0])
                            {
                                case 'D':
                                    if (str1 == "Dinner")
                                    {
                                        str2 = "DinnerItems";
                                        goto label_22;
                                    }
                                    else
                                        break;
                                case 'N':
                                    if (str1 == "NonVeg")
                                    {
                                        str2 = "NonVegItems";
                                        goto label_22;
                                    }
                                    else
                                        break;
                            }
                            break;
                        case 7:
                            if (str1 == "Dessert")
                            {
                                str2 = "DessertItems";
                                goto label_22;
                            }
                            else
                                break;
                        case 9:
                            switch (str1[1])
                            {
                                case 'e':
                                    if (str1 == "Beverages")
                                    {
                                        str2 = "BeveragesItems";
                                        goto label_22;
                                    }
                                    else
                                        break;
                                case 'r':
                                    if (str1 == "Breakfast")
                                    {
                                        str2 = "BreakfastItems";
                                        goto label_22;
                                    }
                                    else
                                        break;
                            }
                            break;
                    }
                }
                this.GridView2.DataSourceID = (string)null;
            label_22:
                string script = "if(!confirm('Are you sure you want to delete this record?')) return;";
                System.Web.UI.ScriptManager.RegisterStartupScript((Page)this, this.GetType(), "DeleteConfirmation", script, true);
                string cmdText = "DELETE FROM " + str2 + " WHERE ItemId=@itemid";
                using (SqlConnection connection = new SqlConnection(this.strcon))
                {
                    using (SqlCommand sqlCommand = new SqlCommand(cmdText, connection))
                    {
                        sqlCommand.Parameters.AddWithValue("@itemid", (object)int32);
                        connection.Open();
                        if (sqlCommand.ExecuteNonQuery() > 0)
                            this.Response.Write("<script>alert('Record Deleted!')</script>");
                        else
                            this.Response.Write("<script>alert('No record found to delete!')</script>");
                    }
                }
                this.GridView2.DataBind();
            }
            catch (Exception ex)
            {
                this.Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
    }
}
