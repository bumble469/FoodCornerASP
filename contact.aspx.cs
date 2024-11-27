using System;
using System.Net;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodWebsite
{
    public partial class WebForm2 : Page
    {
        // Declare TextBox controls for capturing user input
        protected TextBox NameField;
        protected TextBox EmailField;
        protected TextBox SubjectField;
        protected TextBox MessageField;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Get the user inputs from the TextBox controls
            string text1 = this.NameField.Text;
            string text2 = this.EmailField.Text;
            string text3 = this.SubjectField.Text;
            string text4 = this.MessageField.Text;

            try
            {
                // Create the email body
                string body = "<html><body> Name: " + text1 + "<br> User: " + text2 + "<br> Message: " + text4 + "</body></html>";

                // Create SMTP client to send the email
                new SmtpClient("smtp.gmail.com", 587)
                {
                    EnableSsl = true,
                    Credentials = new NetworkCredential("bumble469@gmail.com", "bhtnilakvjerthuq")  // Replace with your App password
                }.Send(new MailMessage(text2, "igniuscae@gmail.com", text3, body)
                {
                    IsBodyHtml = true
                });

                // Clear the fields after sending the message
                this.NameField.Text = "";
                this.EmailField.Text = "";
                this.SubjectField.Text = "";
                this.MessageField.Text = "";

                // Use RegisterStartupScript to show an alert
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Message sent successfully!');", true);
            }
            catch (Exception ex)
            {
                // Display the error message in an alert
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error: " + ex.Message + "');", true);
            }
        }
    }
}
