using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Medicine.DataManager;

namespace Medicine
{
    public partial class firmselectionforpayments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool b = LoginManager.ProtectAdminPage(Session, Response);
            if (!b)
                return;

        }

        protected void btselect_Click(object sender, EventArgs e)
        {
            try
            {
                int index = DropDownList1.SelectedIndex;
                if (index <= 0)
                    throw new Exception("Please Select Valid Company name");
                int sno = Convert.ToInt32(DropDownList1.SelectedValue);
                Response.Redirect("payments.aspx?sno=" + sno);
            }
            catch (Exception ex)
            {
                lblmessage.Text = ex.Message;
            }

        }
        protected void btselect_Click1(object sender, EventArgs e)
        {

        }
    }
}