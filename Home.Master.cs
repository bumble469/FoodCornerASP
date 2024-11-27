using System;
using System.Threading;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace FoodWebsite
{
  public partial class Home : MasterPage
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      try
      {
        if (this.Session["role"] != null && this.Session["role"].ToString() == "admin")
        {
          this.HomeHyperlink.Visible = true;
          this.AboutusHyperlink.Visible = true;
          this.AdminAccessLink.Visible = true;
          this.AdminAccessLink.Text = this.Session["adminid"]?.ToString() + "'s Access";
          this.LogoutLink.Visible = true;
          this.SignupHyperlink.Visible = false;
          this.ProfileLink.Visible = false;
          this.AdminLink.Visible = false;
          this.LoginLink.Visible = false;
          this.MyCartLink.Visible = false;
        }
        else if (this.Session["role"] != null && this.Session["role"].ToString() == "user")
        {
          this.SignupHyperlink.Visible = false;
          this.LogoutLink.Visible = true;
          this.ProfileLink.Visible = true;
          this.LoginLink.Visible = false;
          this.ProfileLink.Text = this.Session["firstname"]?.ToString() + "'s Profile";
          this.HomeHyperlink.Visible = true;
          this.AboutusHyperlink.Visible = true;
          this.AdminLink.Visible = false;
          this.AdminAccessLink.Visible = false;
          this.MyCartLink.Visible = true;
        }
        else
        {
          this.HomeHyperlink.Visible = true;
          this.AboutusHyperlink.Visible = true;
          this.AdminLink.Visible = true;
          this.LoginLink.Visible = true;
          this.SignupHyperlink.Visible = true;
          this.LogoutLink.Visible = false;
          this.ProfileLink.Visible = false;
          this.AdminAccessLink.Visible = false;
          this.MyCartLink.Visible = false;
        }
      }
      catch (Exception ex)
      {
        this.Response.Write("<script>alert('" + ex.Message + "');</script>");
      }
    }

    protected void LogoutLink_Click(object sender, EventArgs e)
    {
      Thread.Sleep(3000);
      this.Session["userid"] = (object) null;
      this.Session["role"] = (object) null;
      this.Session["firstname"] = (object) null;
      this.Session["buyitems"] = (object) null;
      this.Session["Buyitems"] = (object) null;
      this.LoginLink.Visible = true;
      this.SignupHyperlink.Visible = true;
      this.LogoutLink.Visible = false;
      this.ProfileLink.Visible = false;
      this.Response.Redirect("~/Index.aspx");
    }
  }
}