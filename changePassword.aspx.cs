using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Medicine.DataManager;

namespace Medicine
{
    public partial class changePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool b = LoginManager.ProtectPage(Session, Response);
            if (!b)
                return;
            lblUser.Text = "" + LoginManager.CurrentUser(Session);
        }

        protected void changePass(object sender, EventArgs e)
        {

            if (txtCrrPassword.Text.Equals(""))
            {
                lblErrors.Text = "Enter Password";
                return;
            }
            if (txtNewPassword.Text.Equals(""))
            {
                lblErrors.Text = "Enter New password";
                return;
            }
            if (txtRetypePassword.Text.Equals(""))
            {
                lblErrors.Text = "Re-type New password";
                return;
            }

            string user = lblUser.Text;
            string pass = txtCrrPassword.Text;
            string newPass = txtNewPassword.Text;
            string rePass = txtRetypePassword.Text;

            if (!newPass.Equals(rePass))
            {
                lblErrors.Text = "Passwords Do Not Match";
                txtNewPassword.Text = "";
                txtRetypePassword.Text = "";
                return;
            }

            DataManager.DataSet1TableAdapters.siteusersTableAdapter suta = new DataManager.DataSet1TableAdapters.siteusersTableAdapter();
            suta.Updatepassword(user, newPass);
            Response.Redirect("home.aspx");
        }
    }
}