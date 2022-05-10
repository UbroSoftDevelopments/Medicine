using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Medicine.DataManager;

namespace Medicine
{
    public partial class unitentry : System.Web.UI.Page
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
                if (txttype.Text.Equals(""))
                    throw new Exception("Please Enter The Type Of Product");
                string type = txttype.Text;
                DataManager.DataSet1TableAdapters.unitTableAdapter da = new DataManager.DataSet1TableAdapters.unitTableAdapter();
                DataSet1.unitDataTable dt = da.GetDataByUnitName(type);
                if (dt.Rows.Count > 0)
                    throw new Exception("This Unit Has Already Entered!!");
                da.InsertQuery(type);
                Validation.makeLabelVisible(lblmessage);
                Validation.setSuccess(lblmessage, "Successfully Entered!!");
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Validation.setError(lblmessage, ex.Message);
            }
        }
        protected void buttonreset_Click(object sender, EventArgs e)
        {
            Validation.totalResetTextBoxes(txttype);
            Validation.makeLabelInVisible(lblmessage);
        }
        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            try
            {
                if (e.Exception == null)
                {
                    Validation.setSuccess(lblmessage, "Updated");
                    return;

                }
                throw e.Exception;
            }
            catch (Exception ex)
            {
                Validation.setError(lblmessage, ex);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
        }
    }
}