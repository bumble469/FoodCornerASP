using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Net;
using System.Net.Mail;
using System.Threading;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodWebsite
{
    public partial class AdminPageaspx : Page
    {
        private string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected TextBox userEmailid;
        protected RequiredFieldValidator RequiredFieldValidator1;
        protected TextBox userPassword;
        protected RequiredFieldValidator RequiredFieldValidator2;
        protected RegularExpressionValidator RegularExpressionValidator2;
        protected Button loginbtn;
        protected Label errorMsg;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void loginbtn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection connection = new SqlConnection(this.strcon);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();
                SqlCommand sqlCommand = new SqlCommand("SELECT * FROM AdminTable WHERE adminusername = @UserName AND adminpassword = @PassWord", connection);
                sqlCommand.Parameters.AddWithValue("@UserName", (object)this.userEmailid.Text.Trim());
                sqlCommand.Parameters.AddWithValue("@PassWord", (object)this.userPassword.Text.Trim());
                SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
                if (sqlDataReader.HasRows)
                {
                    while (sqlDataReader.Read())
                    {
                        this.Response.Write("<script>alert('login success!');</script>");
                        this.errorMsg.Text = "";
                        Thread.Sleep(1000);
                        string to = sqlDataReader.GetValue(3).ToString();
                        int num = new Random().Next(100000, 999999);
                        string subject = "Verify Admin";
                        this.Session["a_id"] = (object)sqlDataReader.GetValue(0).ToString();
                        this.Session["code"] = (object)num;
                        string body = "<html><body> Your 6 digit code: " + num.ToString() + "</body></html>";
                        new SmtpClient("smtp.gmail.com", 587)
                        {
                            EnableSsl = true,
                            Credentials = new NetworkCredential("bumble469@gmail.com", "bhtnilakvjerthuq")
                        }.Send(new MailMessage("bumble469@gmail.com", to, subject, body)
                        {
                            IsBodyHtml = true
                        });
                        this.Response.Redirect("~/AdminVerifyPage.aspx");
                    }
                }
                else
                {
                    this.userEmailid.BorderColor = Color.Red;
                    this.userPassword.BorderColor = Color.Red;
                    this.errorMsg.Text = "Invalid Credentials!!";
                }
                this.userEmailid.Text = "";
                this.userPassword.Text = "";
            }
            catch (Exception ex)
            {
                this.Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}
