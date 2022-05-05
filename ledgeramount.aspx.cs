using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Medicine.DataManager;

namespace Medicine
{
    public partial class ledgeramount : System.Web.UI.Page
    {
        float amountcreadit = 0;
        float amountdebit = 0;
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
                lblcreadit.Text = " Credit Amount";
                DataManager.DataSet1TableAdapters.firmamountTableAdapter da = new DataManager.DataSet1TableAdapters.firmamountTableAdapter();
                DataSet1.firmamountDataTable dt = da.GetDataBySno(firmno);

                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DataSet1.firmamountRow dr = (DataSet1.firmamountRow)dt.Rows[i];
                    amountcreadit = amountcreadit + (float)dr.amount;

                }

                lblcreaditamount.Text = "Total Amount:-" + amountcreadit + "/-";
                lblDebit.Text = "Debit Amount";

                DataManager.DataSet1TableAdapters.debitpaymentTableAdapter dpa = new DataManager.DataSet1TableAdapters.debitpaymentTableAdapter();
                DataSet1.debitpaymentDataTable dpt = dpa.GetDataBySno(firmno);
                for (int i = 0; i <= dpt.Rows.Count - 1; i++)
                {
                    DataSet1.debitpaymentRow dbr = (DataSet1.debitpaymentRow)dpt.Rows[i];
                    amountdebit = amountdebit + (float)dbr.amount;

                }

                lbldebitamount.Text = "Total Amount:-" + amountdebit + "/-";
                lblbalance.Text = "Balance Amount";
                lblbalancecreadit.Text = "Total Credit=" + amountcreadit + "/-";
                lblbalancedebit.Text = "Total Debit=" + amountdebit + "/-";
                float totalbalance = amountcreadit - amountdebit;
                lbltotalbalance.Text = "Balance=" + totalbalance + "/-";


            }
            catch
            {
                Response.Redirect("Firmselectionforledger.aspx");
            }

        }
    }
}