using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace FoodWebsite
{
    public partial class Aboutus : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.LinkButton1.Style["text-decoration"] = "underline";
            this.LinkButton2.Style["text-decoration"] = "none";
            this.LinkButton3.Style["text-decoration"] = "none";
            this.aboutimg.Attributes["style"] = "background:url('../images/about-owner-min.jpg') center no-repeat;background-size:cover";
            this.Label2.Text = "Welcome to Our Food Corner, your ultimate destination for all things Our cuisine!At Our Food Corner, we are passionate about bringing together the vibrant and diverse world of Our food under one virtual roof. Whether you're a devout follower of Islamic dietary laws or simply curious about exploring the rich flavors of Our cuisine, we've got you covered.Our mission is simple: to provide a platform where Our food enthusiasts can discover, share, and celebrate the incredible diversity of Our dishes from around the globe. From mouthwatering street food delights to exquisite fine dining experiences, we strive to showcase the best that Our gastronomy has to offer.With a team dedicated to curating authentic recipes, highlighting hidden culinary gems, and exploring emerging food trends, we're committed to being your trusted guide in the world of Our dining. Whether you're looking for traditional favorites or innovative twists on classic dishes, Our Food Corner is your go-to resource for culinary inspiration and exploration.";
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            this.Label1.Text = "Owners";
            this.Label2.Text = "Welcome to Our Food Corner, your ultimate destination for all things Our cuisine!At Our Food Corner, we are passionate about bringing together the vibrant and diverse world of Our food under one virtual roof. Whether you're a devout follower of Islamic dietary laws or simply curious about exploring the rich flavors of Our cuisine, we've got you covered.Our mission is simple: to provide a platform where Our food enthusiasts can discover, share, and celebrate the incredible diversity of Our dishes from around the globe. From mouthwatering street food delights to exquisite fine dining experiences, we strive to showcase the best that Our gastronomy has to offer.With a team dedicated to curating authentic recipes, highlighting hidden culinary gems, and exploring emerging food trends, we're committed to being your trusted guide in the world of Our dining. Whether you're looking for traditional favorites or innovative twists on classic dishes, Our Food Corner is your go-to resource for culinary inspiration and exploration.";
            this.LinkButton1.Style["text-decoration"] = "underline";
            this.LinkButton2.Style["text-decoration"] = "none";
            this.LinkButton3.Style["text-decoration"] = "none";
            this.aboutimg.Attributes["style"] = "background:url('../images/about-owner-min.jpg') center no-repeat;background-size:cover";
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            this.Label1.Text = "Staff";
            this.Label2.Text = "Welcome to Our Food Corner, where our team is united by a shared passion for Our cuisine and a commitment to delivering excellence in all that we do. At Our Food Corner, our staff is the heart and soul of our operation. From our talented chefs who craft mouthwatering recipes to our dedicated writers who share stories of culinary discovery, each member of our team plays a vital role in bringing our vision to life. We are a diverse group, bound together by a deep appreciation for the cultural significance and culinary artistry of Our food. With backgrounds spanning various culinary traditions and experiences, we come together to create a vibrant and inclusive community for Our food enthusiasts worldwide. As a member of the Our Food Corner team, you'll find yourself immersed in a dynamic and supportive environment where creativity is celebrated, collaboration is encouraged, and innovation is embraced. We value each team member's unique talents and perspectives, and we are committed to fostering a culture of growth, learning, and mutual respect. Whether you're a seasoned chef, a passionate writer, a skilled photographer, or a dedicated administrator, there's a place for you at Our Food Corner. Join us as we continue to explore, discover, and celebrate the wonderful world of Our cuisine together.";
            this.LinkButton2.Style["text-decoration"] = "underline";
            this.LinkButton1.Style["text-decoration"] = "none";
            this.LinkButton3.Style["text-decoration"] = "none";
            this.aboutimg.Attributes["style"] = "background:url('../images/about-staff-min.jpg') center no-repeat;background-size:cover";
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            this.Label1.Text = "Achievements";
            this.Label2.Text = "Welcome to Our Food Corner, where our journey is marked by a series of proud achievements that reflect our dedication to excellence and innovation in the world of Our cuisine. Since our inception, Our Food Corner has been committed to becoming a leading authority in the Our food industry. We are proud to have built a thriving online community where Our food enthusiasts from around the globe come together to discover, share, and celebrate the rich flavors of Our cuisine. Our achievements speak volumes about our commitment to quality and our relentless pursuit of culinary excellence. From winning prestigious awards for our innovative recipes to partnering with renowned chefs and influencers, we have continuously pushed the boundaries of what is possible in the world of Our dining. As pioneers in the digital space, we have leveraged technology to create immersive culinary experiences that bring the sights, sounds, and flavors of Our cuisine to life. Our innovative use of social media, virtual events, and interactive content has garnered widespread acclaim and recognition, solidifying our position as industry leaders in the digital age. But perhaps our greatest achievement is the trust and loyalty of our community. We are grateful for the support of our loyal followers who have embraced Our Food Corner as their go-to destination for all things Our food.";
            this.LinkButton1.Style["text-decoration"] = "none";
            this.LinkButton2.Style["text-decoration"] = "none";
            this.LinkButton3.Style["text-decoration"] = "underline";
            this.aboutimg.Attributes["style"] = "background:url('../images/about-achievements-min.jpg') center no-repeat;background-size:cover";
        }
    }
}
