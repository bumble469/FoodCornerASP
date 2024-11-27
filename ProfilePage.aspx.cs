using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Threading;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace FoodWebsite
{
    public partial class ProfilePage : Page
    {
        private string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        private DataTable dt = new DataTable();
        protected HtmlGenericControl usertitle;
        protected TextBox UserPassword;
        protected RequiredFieldValidator RequiredFieldValidator1;
        protected Button editbtn;
        protected Button deletebtn;
        protected Button savebtn;
        protected Button cancelbtn;
        protected TextBox FirstNameTextBox;
        protected TextBox LastNameTextBox;
        protected TextBox UserEmailTextBox;
        protected TextBox UserContactTextBox;
        protected TextBox UserPostalcodeTextBox;
        protected TextBox UserGenderTextBox;
        protected TextBox UserCityTextBox;
        protected TextBox UserAddressTextBox;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.UserPassword.Visible = false;
            this.RequiredFieldValidator1.Visible = false;
            this.savebtn.Visible = false;
            this.cancelbtn.Visible = false;
            if (this.IsPostBack)
                return;
            this.fillDetails();
        }

        private void fillDetails()
        {
            try
            {
                int int32 = Convert.ToInt32(this.Session["userid"]);
                SqlConnection connection = new SqlConnection(this.strcon);
                connection.Open();
                SqlCommand selectCommand = new SqlCommand("SELECT * FROM users WHERE userid = @userid", connection);
                selectCommand.Parameters.AddWithValue("@userid", (object)int32);
                new SqlDataAdapter(selectCommand).Fill(this.dt);
                if (this.dt.Rows.Count > 0)
                {
                    this.FirstNameTextBox.Text = this.dt.Rows[0]["firstname"].ToString();
                    this.LastNameTextBox.Text = this.dt.Rows[0]["lastname"].ToString();
                    this.UserEmailTextBox.Text = this.dt.Rows[0]["email"].ToString();
                    this.UserContactTextBox.Text = this.dt.Rows[0]["contact"].ToString();
                    this.UserPostalcodeTextBox.Text = this.dt.Rows[0]["postalcode"].ToString();
                    this.UserGenderTextBox.Text = this.dt.Rows[0]["gender"].ToString();
                    this.UserCityTextBox.Text = this.dt.Rows[0]["city"].ToString();
                    this.UserAddressTextBox.Text = this.dt.Rows[0]["address"].ToString();
                }
                connection.Close();
            }
            catch (Exception ex)
            {
                this.Response.Write(ex.Message);
            }
            this.disableTextboxes();
        }

        protected void deletebtn_Click(object sender, EventArgs e)
        {
            this.UserPassword.Visible = true;
            this.UserPassword.ToolTip = "Once password field gets unfocused account will be deleted!";
        }

        protected void UserPassword_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string str = "";
                int int32 = Convert.ToInt32(this.Session["userid"]);
                SqlConnection connection = new SqlConnection(this.strcon);
                connection.Open();
                SqlCommand sqlCommand1 = new SqlCommand("SELECT password FROM users WHERE userid=@userid1", connection);
                sqlCommand1.Parameters.AddWithValue("@userid1", (object)int32);
                SqlDataReader sqlDataReader = sqlCommand1.ExecuteReader();
                if (sqlDataReader.HasRows)
                {
                    while (sqlDataReader.Read())
                        str = sqlDataReader["password"].ToString();
                }
                sqlDataReader.Close();
                if (str == this.UserPassword.Text.Trim())
                {
                    SqlCommand sqlCommand2 = new SqlCommand("DELETE FROM users WHERE userid=@userid2", connection);
                    sqlCommand2.Parameters.AddWithValue("@userid2", (object)int32);
                    if (sqlCommand2.ExecuteNonQuery() > 0)
                    {
                        this.Session.Clear();
                        this.Response.Redirect("Index.aspx");
                        Thread.Sleep(2000);
                        this.Response.Write("<script>alert('Account Deleted!');</script>");
                    }
                    else
                        this.Response.Write("<script>alert('Some problem occured check password!');</script>");
                }
                else
                    this.Response.Write("<script>alert('Incorrect Password!');</script>");
                connection.Close();
            }
            catch (Exception ex)
            {
                this.Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void editbtn_Click(object sender, EventArgs e)
        {
            this.enableTextboxes();
            this.savebtn.Visible = true;
            this.cancelbtn.Visible = true;
        }

        protected void cancelbtn_Click(object sender, EventArgs e) => this.fillDetails();

        protected void savebtn_Click(object sender, EventArgs e)
        {
            try
            {
                int int32 = Convert.ToInt32(this.Session["userid"]);
                SqlConnection connection = new SqlConnection(this.strcon);
                connection.Open();
                SqlCommand sqlCommand = new SqlCommand("UPDATE users SET firstname = @firstname, lastname = @lastname, email = @email,contact = @contact, postalcode = @postalcode, gender = @gender, city = @city, address = @address WHERE userid = @userid", connection);
                sqlCommand.Parameters.AddWithValue("@userid", (object)int32);
                sqlCommand.Parameters.AddWithValue("@firstname", (object)this.FirstNameTextBox.Text);
                sqlCommand.Parameters.AddWithValue("@lastname", (object)this.LastNameTextBox.Text);
                sqlCommand.Parameters.AddWithValue("@email", (object)this.UserEmailTextBox.Text);
                sqlCommand.Parameters.AddWithValue("@contact", (object)this.UserContactTextBox.Text);
                sqlCommand.Parameters.AddWithValue("@postalcode", (object)this.UserPostalcodeTextBox.Text);
                sqlCommand.Parameters.AddWithValue("@gender", (object)this.UserGenderTextBox.Text);
                sqlCommand.Parameters.AddWithValue("@city", (object)this.UserCityTextBox.Text);
                sqlCommand.Parameters.AddWithValue("@address", (object)this.UserAddressTextBox.Text);
                if (sqlCommand.ExecuteNonQuery() > 0)
                {
                    this.Response.Write("<script>alert('Data updated successfully.');</script>");
                    this.fillDetails();
                    this.Session["firstname"] = (object)this.FirstNameTextBox.Text;
                }
                else
                    this.Response.Write("<script>alert('Data update failed.');</script>");
                connection.Close();
            }
            catch (Exception ex)
            {
                this.Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        private void disableTextboxes()
        {
            this.FirstNameTextBox.Enabled = false;
            this.LastNameTextBox.Enabled = false;
            this.UserEmailTextBox.Enabled = false;
            this.UserContactTextBox.Enabled = false;
            this.UserPostalcodeTextBox.Enabled = false;
            this.UserGenderTextBox.Enabled = false;
            this.UserCityTextBox.Enabled = false;
            this.UserAddressTextBox.Enabled = false;
        }

        private void enableTextboxes()
        {
            this.FirstNameTextBox.Enabled = true;
            this.LastNameTextBox.Enabled = true;
            this.UserEmailTextBox.Enabled = true;
            this.UserContactTextBox.Enabled = true;
            this.UserPostalcodeTextBox.Enabled = true;
            this.UserGenderTextBox.Enabled = true;
            this.UserCityTextBox.Enabled = true;
            this.UserAddressTextBox.Enabled = true;
        }
    }
}
