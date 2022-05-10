using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Medicine.DataManager;

namespace Medicine
{
    public partial class medicinecompany : System.Web.UI.Page
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
                if (name.Equals(""))
                    throw new Exception("Please Enter Medicine Name Carefully!!");
                string comment = txtcomment.Text;
                DataManager.DataSet1TableAdapters.medicinecompanyTableAdapter da = new DataManager.DataSet1TableAdapters.medicinecompanyTableAdapter();
                da.InsertQuery(name, comment);
                Validation.setSuccess(lblmessage, "Successfully Entered !!");
                GridView1.DataBind();

            }
            catch (Exception)
            {
                Validation.setError(lblmessage, "This Company Is Already Entered ");
            }
        }
        protected void buttonreset_Click(object sender, EventArgs e)
        {
            Validation.totalResetTextBoxes(txtcomment, txtcompanyname);
            Validation.totalResetLabels(lblmessage);
            Validation.makeLabelInVisible(lblmessage);
        }
    }
}