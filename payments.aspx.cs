using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Medicine.DataManager;

namespace Medicine
{
    public partial class payments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                bool b = LoginManager.ProtectAdminPage(Session, Response);
                if (!b)
                    return;
                int firmno = Convert.ToInt32(Request.QueryString["sno"]);
                MedicalStoresData md = new MedicalStoresData(firmno);

                if (!md.Valid)
                    throw new Exception("");
                txtname.Text = md.FirmName;
                txtaddress.Text = md.Address + ",";
                txtmobileno.Text = md.MobileNo;
                txtstate.Text = md.State;
                txtcountry.Text = "(" + md.Country + ")";
            }
            catch
            {
                Response.Redirect("firmselectionforpayments.aspx");
            }

        }
        protected void btsave_Click(object sender, EventArgs e)
        {
            try
            {
                int firmno = Convert.ToInt32(Request.QueryString["sno"]);
                if (txtcustomerbillno.Text.Equals(""))
                    throw new Exception("Please Enter Customer Bill No");
                string customerbillno = txtcustomerbillno.Text;
                if (txtdate.Text.Equals(""))
                    throw new Exception("Please Enter Date");
                DateTime date = Convert.ToDateTime(txtdate.Text);
                if (txtamount.Text.Equals(""))
                    throw new Exception("Please Enter Amount Carefully");
                if (txtamount.Text.Equals("0"))
                    throw new Exception("Please Enter Valid Amount");
                double amount = Convert.ToDouble(txtamount.Text);
                string comment = txtcomment.Text;

                DataManager.DataSet1TableAdapters.firmamountTableAdapter da = new DataManager.DataSet1TableAdapters.firmamountTableAdapter();
                da.InsertQuery(firmno, customerbillno, Convert.ToDecimal((float)amount), date, comment);
                Validation.makeLabelVisible(lblmessage);
                Validation.setSuccess(lblmessage, "Successfully Addedd");
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Validation.setError(lblmessage, ex);
            }
        }
        protected void btreset_Click(object sender, EventArgs e)
        {
            Validation.totalResetTextBoxes(txtamount, txtcomment, txtdate, txtcustomerbillno);
            Validation.makeLabelInVisible(lblmessage);
        }
    }
}