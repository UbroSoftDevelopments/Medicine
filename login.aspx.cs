using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Medicine.DataManager;

namespace Medicine
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool b = LoginManager.IsUserLoggedIn(Session);
            if (b)
                Response.Redirect("home.aspx");
        }
        protected void bttnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                bool b = LoginManager.DoLogin(txtUserName.Text, txtPassword.Text, Session, Response);
                if (!b)
                    throw new Exception("Invalid username or password");
            }
            catch (Exception ex)
            {
                Validation.setError(lblMessages, ex);
            }
        }
    }
}