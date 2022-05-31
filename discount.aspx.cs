using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Medicine.DataManager;

namespace Medicine
{
    public partial class discount : System.Web.UI.Page
    {
        int receiptno;
        float totalamount = 0;
        DateTime date;
        int userno;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                bool b = LoginManager.ProtectPage(Session, Response);
                if (!b)
                    return;
                receiptno = Convert.ToInt32(Request.QueryString["receiptno"]);
                userno = LoginManager.GetUserNumberByUsername("" + Session["username"]);
                DataManager.DataSet1TableAdapters.customerdetailsTableAdapter da = new DataManager.DataSet1TableAdapters.customerdetailsTableAdapter();
                DataSet1.customerdetailsDataTable dt = da.GetDataByReceiptNo(receiptno);
                DataSet1.customerdetailsRow dr = (DataSet1.customerdetailsRow)dt.Rows[0];
                lblreceiptNo.Text = "RR" + "GLC" + receiptno;
                lblname.Text = dr.customername;
                date = dr.dateofpurchase;
                lbldateOfEntry.Text = DateUtilities.dateFormat(date);
                lbladdress.Text = dr.address;
                lblmobileNumber.Text = dr.mobileno;
                lblrefFrom.Text = dr.refferedby;
                DataManager.DataSet1TableAdapters.receipt_itemsTableAdapter ta = new DataManager.DataSet1TableAdapters.receipt_itemsTableAdapter();
                DataSet1.receipt_itemsDataTable ddt = ta.GetDataByReceiptNo(receiptno);

                int sn = 0;

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

                    lblrateafterdiscount.Text += "" + ddr.price + "<br/>";
                    lblamnt.Text += "" + Utilities.getTotal(ddr.price, ddr.quantity) + "<br/>";
                    totalamount = totalamount + (ddr.quantity * (float)ddr.price);
                    lbltotalamount.Text = "<b>" + totalamount + "/-</b>";
                    sn++;

                }

            }
            catch (Exception ex)
            {
                Response.Write("" + ex.Message);
            }

        }
        protected void btprint_Click(object sender, EventArgs e)
        {
            try
            {
                double discount;
                if (txtdiscount.Text.Equals(" "))
                    discount = 0;
                else
                    discount = Convert.ToDouble(txtdiscount.Text);
                if (discount < 0)
                    throw new Exception("Discount Must Not Less Than Zero !!");
                DataManager.DataSet1TableAdapters.discountinmedicineTableAdapter dm = new DataManager.DataSet1TableAdapters.discountinmedicineTableAdapter();
                dm.InsertQuery(receiptno,discount, (Convert.ToDateTime(lbldateOfEntry.Text)));
                double amount = totalamount - discount;
                DataManager.DataSet1TableAdapters.paymentfrommedicineTableAdapter da = new DataManager.DataSet1TableAdapters.paymentfrommedicineTableAdapter();
                da.InsertQuery(date, Math.Round(amount, 2), receiptno, userno);
                Response.Redirect("printreceipt.aspx?receiptno=" + Request.QueryString["receiptno"]);
            }
            catch (Exception ex)
            {
                lblmessage.CssClass = "w3-large w3-text-red";
                lblmessage.Text = ex.Message;
            }
        }
        protected void btskip_Click(object sender, EventArgs e)
        {
            DataManager.DataSet1TableAdapters.paymentfrommedicineTableAdapter da = new DataManager.DataSet1TableAdapters.paymentfrommedicineTableAdapter();
            da.InsertQuery(date, Math.Round(totalamount, 2), receiptno, userno);
            Response.Redirect("printreceipt.aspx?receiptno=" + Request.QueryString["receiptno"]);
        }
    }
}