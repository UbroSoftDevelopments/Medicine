using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Medicine.DataManager;

namespace Medicine
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool b = LoginManager.ProtectPage(Session, Response);
            if (!b)
                return;
            string type = LoginManager.checkUserType(LoginManager.CurrentUser(Session));
            if (type.Equals("clerk"))
                Response.Redirect("countersale.aspx");
        }
    }
}