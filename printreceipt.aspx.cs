using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Medicine.DataManager;

namespace Medicine
{
    public partial class printreceipt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                bool b = LoginManager.ProtectPage(Session, Response);
                if (!b)
                    return;
                int receiptno = Convert.ToInt32(Request.QueryString["receiptno"]);
                DataManager.DataSet1TableAdapters.customerdetailsTableAdapter da = new DataManager.DataSet1TableAdapters.customerdetailsTableAdapter();
                DataSet1.customerdetailsDataTable dt = da.GetDataByReceiptNo(receiptno);
                DataSet1.customerdetailsRow dr = (DataSet1.customerdetailsRow)dt.Rows[0];
                lblreceiptNo.Text = "RR" + "GLC" + receiptno;
                lblname.Text = dr.customername;
                DateTime date = dr.dateofpurchase;
                lbldateOfEntry.Text = DateUtilities.dateFormat(date);
                lbladdress.Text = dr.address;
                lblmobileNumber.Text = dr.mobileno;
                lblrefFrom.Text = dr.refferedby;
                DataManager.DataSet1TableAdapters.receipt_itemsTableAdapter ta = new DataManager.DataSet1TableAdapters.receipt_itemsTableAdapter();
                DataSet1.receipt_itemsDataTable ddt = ta.GetDataByReceiptNo(receiptno);
                float totalamount = 0;
                int sn = 0;
                lblamount.Text = " 0/-";
                for (int i = 0; i <= ddt.Rows.Count - 1; i++)
                {
                    DataSet1.receipt_itemsRow ddr = (DataSet1.receipt_itemsRow)ddt.Rows[i];
                    lblsno.Text += "" + (sn + 1) + "<br/>";

                    lblparticular.Text += ddr.medicinename + "<br/>";
                    string batchno = Utilities.GetBAtchNo(ddr.medicinestocksno);
                    lblbatchno.Text += batchno + "<br/>";
                    lblquantity.Text += "" + ddr.quantity + "<br/>";
                    DateTime datetime = Utilities.GetExpiry(ddr.medicinestocksno);

                    lblexpiry.Text += datetime.Month + "-" + ((datetime.Year) % 2000) + "<br/>";
                    float mrp = Utilities.GetMrp(ddr.medicinestocksno);
                    int medicineno = Utilities.GetMedicineNo(ddr.medicinestocksno);

                    lblrateafterdiscount.Text += "" + Math.Round(ddr.price, 2) + "<br/>";
                    lblamnt.Text += "" + Utilities.getTotal(ddr.price, ddr.quantity) + "<br/>";
                    totalamount = totalamount + (ddr.quantity * (float)ddr.price);
                    lbltotalamount.Text = "<b>" + totalamount + "/-</b>";
                    double discount = DiscountUtilities.GetDiscountOnReceiptByReceiptNo(receiptno);
                    lblamount.Text = "<b>" + (discount) + "/-</b>";
                    float grandtotal = (float)Math.Round((totalamount - discount), 2);
                    double total = Math.Round(grandtotal, 0);
                    lblround.Text = "<b>" + Math.Round(grandtotal, 0) + "/-</b>";
                    lblamtInWords.Text = Validation.ConvertNumbertoWords((long)total) + "   RUPEES ONLY ";
                    sn++;

                }

            }
            catch (Exception ex)
            {
                Response.Write("" + ex.Message);
            }
        }

    }
}