using System;
using System.Drawing;
using System.Threading;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodWebsite
{
    public  partial class AdminVerifyPage : Page
    {
        private static int count = 3;
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void loginbtn_Click(object sender, EventArgs e)
        {
            string str = this.Session["code"].ToString().Trim();
            if (this.VerCode.Text.ToString().Trim().Equals(str))
            {
                Thread.Sleep(3000);
                try
                {
                    this.Session["role"] = (object)"admin";
                    this.Session["adminid"] = this.Session["a_id"];
                    this.Session["a_id"] = (object)null;
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
                --AdminVerifyPage.count;
                this.errorMsg.Text = "Invalid Verificating Code! Chances left: " + AdminVerifyPage.count.ToString();
                Thread.Sleep(3000);
                this.VerCode.Text = "";
                this.VerCode.BorderColor = Color.Red;
                if (AdminVerifyPage.count != 0)
                    return;
                this.Response.Redirect("~/AdminLoginPage.aspx");
                this.Session["code"] = (object)null;
            }
        }
    }
}
