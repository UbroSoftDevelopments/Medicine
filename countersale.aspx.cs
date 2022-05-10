using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Medicine.DataManager;

namespace Medicine
{
    public partial class countersale : System.Web.UI.Page
    {
        int receiptno = -1;
        int totalsale = 0;
        int userno;
        protected void Page_Load(object sender, EventArgs e)
        {
            bool b = LoginManager.ProtectPage(Session, Response);
            if (!b)
                return;
            string username = "" + Session["username"];
            userno = LoginManager.GetUserNumberByUsername(username);
            if (GridView1.Rows.Count > 0)
                btsave.Visible = true;

        }
        public void AddMedicineInCart(int medicineno, int stripinsidebox, int medicineinsidestrip, int extra, float price, int userno)
        {
            try
            {
                DataManager.DataSet1TableAdapters.countersalecartTableAdapter da = new DataManager.DataSet1TableAdapters.countersalecartTableAdapter();
                DataSet1.countersalecartDataTable dt = da.GetDataByMedicineNo(medicineno);
                if (dt.Rows.Count <= 0)
                {
                    da.InsertQuery(medicineno, stripinsidebox, medicineinsidestrip, extra, Convert.ToDecimal(price), userno);
                }
                else
                {
                    DataSet1.countersalecartRow dr = (DataSet1.countersalecartRow)dt.Rows[0];
                    int stripincart = dr.stripinsidebox;
                    int extraincart = dr.extra;
                    int totalstrip = stripincart + stripinsidebox;
                    int totalextra = extraincart + extra;
                    da.UpdateStripAndExtraMedicineByMedicineNo(totalstrip, totalextra, medicineno);
                }

            }
            catch
            {

            }
        }
        public void ClearCounterSaleCart()
        {
            DataManager.DataSet1TableAdapters.countersalecartTableAdapter da = new DataManager.DataSet1TableAdapters.countersalecartTableAdapter();
            da.DeleteAllDataFromCart();
        }
        protected void btadd_Click(object sender, EventArgs e)
        {
            try
            {

                string customername = txtname.Text;
                if (customername.Equals(""))
                    throw new Exception("Please Enter Name Of Customer!!");
                if (txtdate.Text.Equals("") || txtdate.Text.Equals(null) || txtdate.Text.Equals(" "))
                    throw new Exception("Please Select Date!!");
                DateTime date = Convert.ToDateTime(txtdate.Text);
                int index = ddmedicinename.SelectedIndex;
                if (index < 0)
                    throw new Exception("Please Select a Medicine Name");
                int sno = Convert.ToInt32(ddmedicinename.SelectedValue);
                MedicineStockData mdd = new MedicineStockData(sno);
                int x = mdd.MedicineInsideStrip;
                float rate = mdd.RateAfterDiscount;

                int stripinsidebox = Convert.ToInt32(txtstripinsidebox.Text);
                if (stripinsidebox < 0)
                    throw new Exception("Invalid Strip Quantity !!");
                int extra = Convert.ToInt32(txtextra.Text);
                if (extra < 0)
                    throw new Exception("Invalid Extra Quantity !!");
                if (stripinsidebox == 0 && extra == 0)
                    throw new Exception("Add Strip Or Extra Medicine !!");
                int medicineinsidestrip = Convert.ToInt32(txtmedicineinsidestrip.Text);
                totalsale = totalsale + medicineinsidestrip * stripinsidebox + extra;
                float price = (float)Math.Round((rate / x), 2);

                if (!StockUtilities.isProductAvailable(mdd.ProductNo, mdd.BatchNo, totalsale))
                    throw new Exception("Medicine is Out Of Stock");

                AddMedicineInCart(sno, stripinsidebox, medicineinsidestrip, extra, price, userno);
                GridView1.DataBind();
                Validation.setSuccess(lblmessage, "Medicine Added");
                btsave.Visible = true;

            }
            catch (Exception ex)
            {
                lblmessage.CssClass = "w3-text-red";
                lblmessage.Text = ex.Message;

            }
        }
        public void SaveCartItemToDatabase(int receiptno)
        {
            try
            {
                DataManager.DataSet1TableAdapters.countersalecartTableAdapter ca = new DataManager.DataSet1TableAdapters.countersalecartTableAdapter();
                DataSet1.countersalecartDataTable ct = ca.GetData();
                if (ct.Rows.Count <= 0)
                    throw new Exception("No Items In Cart !!");
                for (int i = 0; i <= ct.Rows.Count - 1; i++)
                {
                    DataSet1.countersalecartRow cart = (DataSet1.countersalecartRow)ct.Rows[i];
                    DataManager.DataSet1TableAdapters.receipt_itemsTableAdapter da = new DataManager.DataSet1TableAdapters.receipt_itemsTableAdapter();
                    string medicinename = ProductUtilities.GetMedicineNameByStockSno(cart.medicineno);
                    int quantity = (cart.stripinsidebox * cart.medicineinsidestrip) + cart.extra;
                    da.InsertQuery(receiptno, medicinename, quantity, Convert.ToDecimal(cart.price), cart.medicineno);
                }


            }
            catch
            {

            }
        }
        protected void btsave_Click(object sender, EventArgs e)
        {


            try
            {
                {

                    hypReceipt.Visible = true;
                    string name = txtname.Text;
                    if (name.Equals(" ") || name.Equals(null))
                        throw new Exception("Enter Name Of Customer !!");
                    string address = txtaddress.Text;
                    if (address.Equals(" ") || address.Equals(null))
                        throw new Exception("Enter Address Of Customer !!");
                    string number = txtmobileno.Text;
                    if (number.Equals(" ") || number.Equals(null))
                        throw new Exception("Enter Contact No. Of Customer !!");
                    string reffered = txtreff.Text;
                    if (reffered.Equals(" ") || reffered.Equals(null))
                        throw new Exception("Enter Refered From !!");
                    string ipno;
                    ipno = txtipno.Text;
                    if (ipno.Equals(""))
                        ipno = "";

                    if (txtdate.Text.Equals("") || txtdate.Text.Equals(null) || txtdate.Text.Equals(" "))
                        throw new Exception("Please Select Date!!");
                    DataManager.DataSet1TableAdapters.customerdetailsTableAdapter da = new DataManager.DataSet1TableAdapters.customerdetailsTableAdapter();
                    da.InsertQuery(txtname.Text, Convert.ToDateTime(txtdate.Text), address, number, reffered, ipno, userno);
                    receiptno = Convert.ToInt32(da.GetNewReceiptNo());
                    if (receiptno <= 0)
                        throw new Exception("Receipt error");
                }
                {
                    SaveCartItemToDatabase(receiptno);
                    //CartController.SaveToDatabase(Session, receiptno);
                }
                btclear.Visible = false;
                Validation.setSuccess(lblmessage, "Success");
                hypReceipt.NavigateUrl = "discount.aspx?receiptno=" + receiptno;
                hypReceipt.Target = "new";

                //CartController.Clear(Session);
                ClearCounterSaleCart();
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                lblmessage.CssClass = "w3-text-red";
                lblmessage.Text = ex.Message;
            }
        }
        protected void btclear_Click(object sender, EventArgs e)
        {
            //CartController.Clear(Session);
            ClearCounterSaleCart();
            GridView1.DataBind();
            lblmessage.Text = "";
            btsave.Visible = false;
            //btclear.Visible = false;


        }

        protected void ddmedicinename_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddmedicinename.SelectedIndex == 0)
            {

                txtmedicineinsidestrip.Text = "";
                return;
            }
            DataManager.DataSet1TableAdapters.medicinestockTableAdapter da = new DataManager.DataSet1TableAdapters.medicinestockTableAdapter();
            DataSet1.medicinestockDataTable dt = da.GetDataBySno(Convert.ToInt32(ddmedicinename.SelectedValue));
            DataSet1.medicinestockRow dr = (DataSet1.medicinestockRow)dt.Rows[0];


            txtmedicineinsidestrip.Text = "" + dr.medicineinsidestrip;

        }
        public void medicineSelectedDefault(object sender, EventArgs e)
        {
            ListItem li = new ListItem();
            li.Selected = true;
            li.Text = "Select Medicine Name";
            li.Attributes.CssStyle.Add("font-weight", "bold");
            li.Value = "-1";
            ddmedicinename.Items.Insert(0, li);

        }

        protected void btcheckip_Click(object sender, EventArgs e)
        {
            try
            {
                string ipnumber = txtipno.Text;
                if (ipnumber.Equals(""))
                    throw new Exception("Please Enter Ip No.");
                DataManager.DataSet2TableAdapters.opdformTableAdapter oda = new DataManager.DataSet2TableAdapters.opdformTableAdapter();
                DataSet2.opdformDataTable odt = oda.GetDataByIPNumber(ipnumber);
                if (odt.Rows.Count <= 0)
                {
                    throw new Exception("No Data Found For This Ip Number!!");
                }
                else
                {
                    DataSet2.opdformRow odr = (DataSet2.opdformRow)odt.Rows[0];
                    txtname.Text = odr.firstname + " " + odr.lastname;
                    txtaddress.Text = odr.address;
                    txtmobileno.Text = odr.mobileno;

                }
            }
            catch (Exception ex)
            {
                lblmessage.CssClass = "w3-text-red";
                lblmessage.Text = ex.Message;
            }
        }
        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            try
            {
                double amount = 0;

                DataManager.DataSet1TableAdapters.countersalecartTableAdapter da = new DataManager.DataSet1TableAdapters.countersalecartTableAdapter();
                DataSet1.countersalecartDataTable dt = da.GetData();
                lbltotalmedicine.Text = "Total Medicine :- " + dt.Rows.Count;
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DataSet1.countersalecartRow dr = (DataSet1.countersalecartRow)dt.Rows[i];
                    int quantity = (dr.stripinsidebox * dr.medicineinsidestrip) + dr.extra;
                    double price = dr.price;
                    amount += quantity * price;
                }
                lbltotalamount.Text = "Total Amount:- Rs." + amount + "/-";
            }
            catch
            {

            }
        }
    }
}