using System;
using System.Drawing;
using System.Threading;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodWebsite
{
    public partial class UserVerifyPage : Page
    {
        private static int count = 3;

        protected void Page_Load(object sender, EventArgs e) => this.VerCode.Focus();

        protected void loginbtn_Click(object sender, EventArgs e)
        {
            string str = this.Session["code"].ToString().Trim();
            if (this.VerCode.Text.ToString().Trim().Equals(str))
            {
                Thread.Sleep(3000);
                try
                {
                    this.Session["role"] = (object)"user";
                    this.Session["userid"] = this.Session["u_id"];
                    this.Session["u_id"] = (object)null;
                    this.Session["firstname"] = this.Session["fname"];
                    this.Session["fname"] = (object)null;
                    Thread.Sleep(2000);
                    this.Response.Redirect("~/Index.aspx");
                }
                catch (Exception ex)
                {
                    this.Response.Write(ex.Message);
                }
            }
            else
            {
                --UserVerifyPage.count;
                this.errorMsg.Text = "Invalid Verificating Code! Chances left: " + UserVerifyPage.count.ToString();
                Thread.Sleep(3000);
                this.VerCode.Text = "";
                this.VerCode.BorderColor = Color.Red;
                if (UserVerifyPage.count != 0)
                    return;
                this.Response.Redirect("~/AdminLoginPage.aspx");
                this.Session["code"] = (object)null;
            }
        }
    }
}
