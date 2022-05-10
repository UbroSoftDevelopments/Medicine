using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Medicine.DataManager;

namespace Medicine
{
    public partial class DebitPayment : System.Web.UI.Page
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
                Response.Redirect("firmselectionfordebit.aspx");
            }
        }
        protected void btsave_Click(object sender, EventArgs e)
        {
            try
            {
                int firmno = Convert.ToInt32(Request.QueryString["sno"]);

                if (txtdate.Text.Equals(""))
                    throw new Exception("Please Enter Date");
                DateTime date = Convert.ToDateTime(txtdate.Text);
                if (txtamount.Text.Equals(""))
                    throw new Exception("Please Enter Amount Carefully");

                double amount = Convert.ToDouble(txtamount.Text);
                if (amount <= 0)
                    throw new Exception("Please Enter Valid Amount");
                string comment = txtcomment.Text;
                DataManager.DataSet1TableAdapters.debitpaymentTableAdapter da = new DataManager.DataSet1TableAdapters.debitpaymentTableAdapter();
                da.InsertQuery(firmno, date, Convert.ToDecimal((float)amount), comment);
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
            Validation.totalResetTextBoxes(txtamount, txtcomment, txtdate);
            Validation.makeLabelInVisible(lblmessage);
        }
    }
}