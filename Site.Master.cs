using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Medicine.DataManager;

namespace Medicine
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool b = LoginManager.IsUserLoggedIn(Session);
            if (!b)
            {
                adminMenu.Visible = false;
                demo.Visible = false;
                userMenu.Visible = false;
                demoUser.Visible = false;
                index.Visible = true;
                option.Visible = false;
                welcome.Visible = true;
            }
            else
            {
                if (LoginManager.IsAdminLoggedIn(Session) && !LoginManager.IsClerkLoggedIn(Session))
                {
                    adminMenu.Visible = true;
                    demo.Visible = true;
                    userMenu.Visible = false;
                    demoUser.Visible = false;
                    index.Visible = false;
                    option.Visible = true;
                    welcome.Visible = false;

                }
                else
                {
                    adminMenu.Visible = false;
                    demo.Visible = false;
                    userMenu.Visible = true;
                    demoUser.Visible = true;
                    index.Visible = false;
                    ckUser.Text = "Logged In UserName:-" + LoginManager.CurrentUser(Session);
                    option.Visible = true;
                    welcome.Visible = false;
                }
            }


        }

        public void changeBg(string src)
        {

        }

        protected void logOutClick(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
    }
}