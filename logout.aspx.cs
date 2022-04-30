using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Medicine.DataManager;

namespace Medicine
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool b = LoginManager.logout(Session, Response);
            if (!b)
                Response.Redirect("home.aspx");
        }
    }
}