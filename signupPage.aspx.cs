using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Threading;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodWebsite
{
    public partial class signupPage : Page
    {
        private string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected System.Web.UI.ScriptManager ScriptManager1;
        protected UpdatePanel UpdatePanel1;
        protected TextBox FirstName;
        protected RequiredFieldValidator RequiredFieldValidator1;
        protected TextBox LastName;
        protected RequiredFieldValidator RequiredFieldValidator2;
        protected TextBox userEmailid;
        protected RequiredFieldValidator RequiredFieldValidator3;
        protected RegularExpressionValidator RegularExpressionValidator1;
        protected TextBox userPassword;
        protected RequiredFieldValidator RequiredFieldValidator4;
        protected RegularExpressionValidator RegularExpressionValidator2;
        protected TextBox userConfirmPassword;
        protected RequiredFieldValidator RequiredFieldValidator5;
        protected CompareValidator CompareValidator1;
        protected TextBox UserContact;
        protected RequiredFieldValidator RequiredFieldValidator6;
        protected RegularExpressionValidator RegularExpressionValidator3;
        protected TextBox UserPincode;
        protected RequiredFieldValidator RequiredFieldValidator7;
        protected RegularExpressionValidator RegularExpressionValidator4;
        protected RadioButtonList genderRadioButtonList;
        protected RequiredFieldValidator RequiredFieldValidator9;
        protected DropDownList DropDownList1;
        protected TextBox UserAddress;
        protected RequiredFieldValidator RequiredFieldValidator8;
        protected Button SignupButton;
        protected Label Label1;
        protected HyperLink HyperLink1;
        protected Label ErrorMsg;
        protected UpdateProgress UpdateProgress1;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection connection = new SqlConnection(this.strcon);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();
                SqlCommand sqlCommand1 = new SqlCommand("SELECT COUNT(*) FROM users WHERE email=@email", connection);
                sqlCommand1.Parameters.AddWithValue("@email", (object)this.userEmailid.Text.Trim());
                int int32_1 = Convert.ToInt32(sqlCommand1.ExecuteScalar());
                SqlCommand sqlCommand2 = new SqlCommand("SELECT COUNT(*) FROM users WHERE password=@password", connection);
                sqlCommand2.Parameters.AddWithValue("@password", (object)this.userPassword.Text.Trim());
                int int32_2 = Convert.ToInt32(sqlCommand2.ExecuteScalar());
                SqlCommand sqlCommand3 = new SqlCommand("SELECT COUNT(*) FROM users WHERE contact=@contact", connection);
                sqlCommand3.Parameters.AddWithValue("@contact", (object)this.UserContact.Text.Trim());
                int int32_3 = Convert.ToInt32(sqlCommand3.ExecuteScalar());
                if (int32_1 == 0 && int32_2 == 0 && int32_3 == 0)
                {
                    SqlCommand sqlCommand4 = new SqlCommand("INSERT INTO users(firstname,lastname,email,password,contact,postalcode,gender,city,address)VALUES(@firstname,@lastname,@email,@password,@contact,@postalcode,@gender,@city,@address)", connection);
                    sqlCommand4.Parameters.AddWithValue("@firstname", (object)this.FirstName.Text.Trim());
                    sqlCommand4.Parameters.AddWithValue("@lastname", (object)this.LastName.Text.Trim());
                    sqlCommand4.Parameters.AddWithValue("@email", (object)this.userEmailid.Text.Trim());
                    sqlCommand4.Parameters.AddWithValue("@password", (object)this.userPassword.Text.Trim());
                    sqlCommand4.Parameters.AddWithValue("@contact", (object)this.UserContact.Text.Trim());
                    sqlCommand4.Parameters.AddWithValue("@postalcode", (object)this.UserPincode.Text.Trim());
                    sqlCommand4.Parameters.AddWithValue("@gender", (object)this.genderRadioButtonList.SelectedValue);
                    sqlCommand4.Parameters.AddWithValue("@city", (object)this.DropDownList1.SelectedItem.Value);
                    sqlCommand4.Parameters.AddWithValue("@address", (object)this.UserAddress.Text.Trim());
                    if (sqlCommand4.ExecuteNonQuery() > 0)
                    {
                        this.ErrorMsg.ForeColor = Color.Green;
                        this.ErrorMsg.Text = "SignUp Successfull!";
                    }
                    else
                    {
                        this.ErrorMsg.ForeColor = Color.Red;
                        this.ErrorMsg.Text = "SignUp Failed!";
                    }
                }
                else
                {
                    this.ErrorMsg.ForeColor = Color.Red;
                    this.ErrorMsg.Text = "Email or Password or Contact already exists!";
                }
                connection.Close();
                Thread.Sleep(3000);
                this.FirstName.Text = "";
                this.LastName.Text = "";
                this.userEmailid.Text = "";
                this.UserContact.Text = "";
                this.UserAddress.Text = "";
                this.UserPincode.Text = "";
                this.DropDownList1.SelectedIndex = -1;
                this.genderRadioButtonList.ClearSelection();
            }
            catch (Exception ex)
            {
                this.Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}
