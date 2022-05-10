using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Medicine.DataManager;

namespace Medicine
{
    public partial class storename : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool b = LoginManager.ProtectPage(Session, Response);
            if (!b)
                return;
        }
        protected void buttonsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string name = txtcompanyname.Text;
                string comment = txtcomment.Text;
                string address = txtaddress.Text;
                string mobileno = txtmobileno.Text;
                string state = txtstate.Text;
                string country = txtcountry.Text;
                DataManager.DataSet1TableAdapters.medicalstoresTableAdapter da = new DataManager.DataSet1TableAdapters.medicalstoresTableAdapter();
                da.InsertQuery(name, comment, address, mobileno, state, country);
                Validation.makeLabelVisible(lblmessage);
                Validation.setSuccess(lblmessage, "Successfully Entered!!");
                GridView1.DataBind();
            }
            catch
            {
                Validation.setError(lblmessage, "Something Went Wrong");
            }
        }
        protected void buttonreset_Click(object sender, EventArgs e)
        {
            Validation.totalResetTextBoxes(txtcomment, txtcompanyname, txtaddress, txtmobileno, txtstate, txtcountry);
            Validation.totalResetLabels(lblmessage);
            Validation.makeLabelInVisible(lblmessage);
        }
    }
}