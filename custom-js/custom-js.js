$(document).ready(function () {
    $('body').click(function (e) {
        if (!$(e.target).closest('.navbar-nav, .navbar-toggler').length) {
            $('.navbar-collapse').collapse('hide');
        }
    });
});
document.addEventListener('DOMContentLoaded', function () {
    var navLinks = document.querySelectorAll(".nav-links");
    function updateActiveLink() {
        var currentUrl = window.location.pathname;
        if (currentUrl == "/Index.aspx") {
            document.getElementById("indexlink").classList.add("active");
        }
        if (currentUrl == "/Aboutus.aspx") {
            document.getElementById("aboutuslink").classList.add("active");
        }
        if (currentUrl == "/contact.aspx") {
            document.getElementById("contactlink").classList.add("active");
        }
        if (currentUrl == "/signupPage.aspx") {
            document.getElementById("signuplink").classList.add("active");
        }
        if (currentUrl == "/loginPage.aspx") {
            document.getElementById("loginlink").classList.add("active");
        }
        if (currentUrl == "/ProfilePage.aspx") {
            document.getElementById("profilelink").classList.add("active");
        }
        if (currentUrl == "/CartPage.aspx") {
            document.getElementById("cartlink").classList.add("active");
        }
        if (currentUrl == "/AdminLoginPage.aspx") {
            document.getElementById("adminlink").classList.add("active");
        }
        if (currentUrl == "/AdminAccessPage.aspx") {
            document.getElementById("adminaccesslink").classList.add("active");
        }
        if (currentUrl == "/MyCartPage.aspx") {
            document.getElementById("mycartlink").classList.add("active");
        }
    }
    updateActiveLink();
    window.addEventListener('popstate', updateActiveLink);

});


