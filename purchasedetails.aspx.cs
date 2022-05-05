using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Medicine.DataManager;

namespace Medicine
{
    public partial class purchasedetails : System.Web.UI.Page
    {
        int medicineinsidestrip = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                bool b = LoginManager.ProtectPage(Session, Response);
                if (!b)
                    return;
                int firmno = Convert.ToInt32(Request.QueryString["sno"]);
                MedicalStoresData md = new MedicalStoresData(firmno);
                if (!md.Valid)
                    throw new Exception();
                txtname.Text = md.FirmName;
                txtaddress.Text = md.Address + ",";
                txtmobileno.Text = md.MobileNo;
                txtstate.Text = md.State;
                txtcountry.Text = "(" + md.Country + ")";
                btsave.Visible = false;
                if (!this.IsPostBack)
                {
                    DataManager.DataSet1TableAdapters.purchasecartTableAdapter pcta = new DataManager.DataSet1TableAdapters.purchasecartTableAdapter();
                    DataSet1.purchasecartDataTable pcdt = pcta.GetData();
                    if (pcdt.Rows.Count > 0)
                    {
                        btsave.Visible = true;
                    }
                }

                //GridView1.DataSource = PurchaseCartController.GetShoppingCart(Session);
                //GridView1.DataBind();

                id01.CssClass = id01.CssClass + (" invisibleclass");
                Button4.Visible = false;
            }
            catch (Exception ex)
            {
                Response.Redirect("firmselection.aspx");

            }
        }
        protected void btadd_Click(object sender, EventArgs e)
        {
            try
            {

                string billno = (txtcustomerbillno.Text);

                int productno = Convert.ToInt32(ddproductno.SelectedValue);
                if (productno <= 0)
                    throw new Exception("Please Select Medicine Name!!");
                int stripinsidebox = Convert.ToInt32(txtnoofstripinsidebox.Text);
                medicineinsidestrip = Convert.ToInt32(txtqtyinsidestrip.Text);
                int boxno = Convert.ToInt32(txtboxno.Text);

                int index = ddUnits.SelectedIndex;
                if (index < 0)
                    throw new Exception("Please Select Unit Of Medicine");
                int unit = Convert.ToInt32(ddUnits.SelectedValue);




                int rackno = Convert.ToInt32(txtrackno.Text);
                string batchno = ddbatchno.SelectedValue;

                string productname = ddproductno.SelectedItem.Text;



                float purerate = (float)Convert.ToDouble(txtPureRate.Text);
                purerate = (float)Math.Round(purerate, 2);
                float mrp = purerate;
                DataManager.DataSet1TableAdapters.purchasecartTableAdapter pda = new DataManager.DataSet1TableAdapters.purchasecartTableAdapter();
                DataSet1.purchasecartDataTable pdt = pda.GetDataByProductNoAndBatchno(productno, batchno);
                if (pdt.Rows.Count <= 0)
                    pda.InsertQuery(billno, productno, boxno, stripinsidebox, medicineinsidestrip, unit, batchno, txthsnno.Text, mrp, Convert.ToDateTime(txtmfgdate.Text), Convert.ToDateTime(txtexpiry.Text), rackno);
                else
                {

                    DataSet1.purchasecartRow pdr = (DataSet1.purchasecartRow)pdt.Rows[0];
                    int sno = pdr.sno;
                    int boxinstock = pdr.boxno;
                    int stripinstock = pdr.stripinsidebox;
                    int medicineinstripinstock = pdr.medicineinsidestrip;
                    int totalbox = boxno + boxinstock;
                    int totalstrip = stripinsidebox;
                    int totalmedicine = medicineinsidestrip;
                    pda.UpdateQuantity(totalbox, totalstrip, totalmedicine, sno);
                }
                /*PurchaseItemDetails itemdetails = new PurchaseItemDetails(billno, productno, boxno, stripinsidebox, medicineinsidestrip,unit, productname, batchno, txthsnno.Text,mrp,purerate, Convert.ToDateTime(""+txtmfgdate.Text), Convert.ToDateTime(""+txtexpiry.Text),rackno);
                int totalQuantity = ProductUtilities.GetTotalMedicineQuantity(boxno, stripinsidebox, medicineinsidestrip);
                PurchaseItemDetails itemdetails = new PurchaseItemDetails(billno, totalQuantity, unit, productname, batchno, txthsnno.Text, mrp, purerate, Convert.ToDateTime("" + txtmfgdate.Text), Convert.ToDateTime("" + txtexpiry.Text), rackno);
                PurchaseCartController.AddMedicine(Session, itemdetails);
                */
                GridView1.DataBind();
                Validation.setSuccess(lblmessage, "Added");
                btsave.Visible = true;



            }
            catch (Exception ex)
            {
                //Validation.setError(lblmessage, ex);
                lblalertmessage.Text = "Add :" + ex.Message;

            }
        }

        protected void btreset_Click(object sender, EventArgs e)
        {
            Validation.totalResetTextBoxes(txthsnno, txtmfgdate, abc, txtPureRate, txtqtyinsidestrip, txtboxno, txtexpiry, txtnoofstripinsidebox);
            ddproductno.SelectedIndex = 0;
            ddUnits.SelectedIndex = 0;
            txtqtyinsidestrip.Text = "1";

        }
        protected void btsave_Click(object sender, EventArgs e)
        {
            try
            {
                double totalfirmamount = 0;
                string billno = "";
                int newbillno = -1;
                {
                    DataManager.DataSet1TableAdapters.customerbilldetailsTableAdapter da = new DataManager.DataSet1TableAdapters.customerbilldetailsTableAdapter();
                    da.InsertQuery(txtname.Text, Convert.ToDateTime(txtdate.Text), txtaddress.Text, txtmobileno.Text, txtcustomerbillno.Text);

                    newbillno = Convert.ToInt32(da.GetMaxSno());
                }

                if (newbillno < 0)
                    throw new Exception("Bill not generated");
                DataManager.DataSet1TableAdapters.purchasecartTableAdapter pda = new DataManager.DataSet1TableAdapters.purchasecartTableAdapter();
                DataSet1.purchasecartDataTable pdt = pda.GetData();
                DataManager.DataSet1TableAdapters.medicinestockTableAdapter mda = new DataManager.DataSet1TableAdapters.medicinestockTableAdapter();

                for (int i = 0; i <= pdt.Rows.Count - 1; i++)
                {
                    DataSet1.purchasecartRow pdr = (DataSet1.purchasecartRow)pdt.Rows[i];
                    DataSet1.medicinestockDataTable mdt = mda.GetDataByProductNoAndBatchNo(pdr.productno, pdr.batchno);
                    if (mdt.Rows.Count <= 0)
                    {
                        mda.InsertQuery(pdr.productno, pdr.batchno, pdr.mrp, pdr.mrp, pdr.mfgdate, pdr.expirydate, pdr.boxno, pdr.stripinsidebox, pdr.medicineinsidestrip, pdr.unit, pdr.hsnno, Convert.ToString(pdr.rackno), newbillno);

                    }
                    else
                    {
                        DataSet1.medicinestockRow mdr = (DataSet1.medicinestockRow)mdt.Rows[0];
                        int sno = mdr.sno;
                        int totalbox = pdr.boxno + mdr.boxno;
                        int stripinsidebox = mdr.stripinsidebox;
                        int medicineinsidestrp = mdr.medicineinsidestrip;
                        mda.UpdateQuantityBySno(totalbox, stripinsidebox, medicineinsidestrip, sno);
                    }
                    Button4.Visible = false;
                    int quantity = 0;
                    string unit = ProductUtilities.GetUnitName(pdr.unit);
                    if (unit.Equals("Tablet") || unit.Equals("Tab") || unit.Equals("Capsule"))
                    {
                        quantity = pdr.boxno;
                    }
                    else
                    {
                        quantity = pdr.boxno * pdr.stripinsidebox;
                    }
                    DataManager.DataSet1TableAdapters.productbatchTableAdapter pb = new DataManager.DataSet1TableAdapters.productbatchTableAdapter();
                    DataSet1.productbatchDataTable pbt = pb.GetDataByBatchNoAndProductNo(pdr.batchno, pdr.productno);
                    DataSet1.productbatchRow pbr = (DataSet1.productbatchRow)pbt.Rows[0];
                    double purchaserate = pbr.purchaserate;
                    totalfirmamount += quantity * purchaserate;
                    billno = "" + pdr.billno;



                }
                clearCart();

                GridView1.DataBind();
                btreset_Click(sender, e);
                int firmno = Convert.ToInt32(Request.QueryString["sno"]);
                DataManager.DataSet1TableAdapters.firmamountTableAdapter fda = new DataManager.DataSet1TableAdapters.firmamountTableAdapter();
                fda.InsertQuery(firmno, billno, totalfirmamount, System.DateTime.Now, "");


            }
            catch (Exception ex)
            {
                Validation.setError(lblmessage, ex);
            }
        }

        public void clearCart()
        {
            DataManager.DataSet1TableAdapters.purchasecartTableAdapter pcta = new DataManager.DataSet1TableAdapters.purchasecartTableAdapter();
            pcta.ClearFullCart();
        }

        protected void ddUnits_SelectedIndexChanged(object sender, EventArgs e)
        {
            string unitname = ddUnits.SelectedItem.Text;
            if ((unitname.Equals("Tablet") || unitname.Equals("Capsule") || unitname.Equals("Tab")))
            {
                lblmedicineno.Visible = true;
                txtqtyinsidestrip.Visible = true;
                txtqtyinsidestrip.Text = "1";
            }
            else
            {
                lblmedicineno.Visible = false;
                txtqtyinsidestrip.Visible = false;
                txtqtyinsidestrip.Text = "1";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                bool b = LoginManager.IsAdminLoggedIn(Session);
                if (!b)
                    throw new Exception(" Sorry!! Access Denied");
                else
                    id01.CssClass = id01.CssClass.Replace("invisibleclass", "visibleclass");
            }
            catch (Exception ex)
            {
                Validation.setError(lblmessage, ex);
            }
        }
        protected void btaddnew_Click(object sender, EventArgs e)
        {
            try
            {

                string name = txtproductname.Text;
                if (name.Equals(""))
                    throw new Exception("Please Enter The Name Of Product");

                int companyindex = ddproductcompany.SelectedIndex;
                if (companyindex <= 0)
                    throw new Exception("Please Select Product Company Name");
                int companyno = Convert.ToInt32(ddproductcompany.SelectedValue);
                int index = ddproducttype.SelectedIndex;
                if (index <= 0)
                    throw new Exception("Please Select Product Type");
                int typeno = Convert.ToInt32(ddproducttype.SelectedValue);
                if (txtpurchaserate.Text.Equals("") || Convert.ToDouble(txtpurchaserate.Text) <= 0)
                    throw new Exception("Invalid Purchase Rate");
                double purchaserate = Convert.ToDouble(txtpurchaserate.Text);
                if (txtsalerate.Text.Equals("") || Convert.ToDouble(txtsalerate.Text) <= 0)
                    throw new Exception("Invalid MRP");
                double rateforsale = Convert.ToDouble(txtsalerate.Text);

                string batchno = txtbatchno.Text;
                DataManager.DataSet1TableAdapters.productsTableAdapter da = new DataManager.DataSet1TableAdapters.productsTableAdapter();
                DataSet1.productsDataTable dt = da.GetDataByProductName(name);
                if (dt.Rows.Count <= 0)
                {
                    da.InsertQuery(name, typeno, companyno, "");

                    int productno = (int)da.GetMaxProductNo();
                    DataManager.DataSet1TableAdapters.productbatchTableAdapter pda = new DataManager.DataSet1TableAdapters.productbatchTableAdapter();
                    pda.InsertQuery(productno, batchno, purchaserate, rateforsale);
                }
                else
                {
                    DataSet1.productsRow dr = (DataSet1.productsRow)dt.Rows[0];
                    int productno = dr.productno;
                    DataManager.DataSet1TableAdapters.productbatchTableAdapter pda = new DataManager.DataSet1TableAdapters.productbatchTableAdapter();
                    DataSet1.productbatchDataTable pdt = pda.GetDataByBatchNoAndProductNo(batchno, productno);
                    if (pdt.Rows.Count > 0)
                        throw new Exception("Entry For This Batchno And Product Has Already Done!!");
                    pda.InsertQuery(productno, batchno, purchaserate, rateforsale);
                }

                Response.Redirect("purchasedetails.aspx?sno=" + Convert.ToInt32(Request.QueryString["sno"]));
            }
            catch (Exception ex)
            {
                Validation.setError(lblalertmessage, ex.Message);
            }
        }


        protected void reset_Click(object sender, EventArgs e)
        {
            Validation.totalResetTextBoxes(txtproductname, txtbatchno);
            ddproductcompany.SelectedIndex = 0;
            ddproducttype.SelectedIndex = 0;
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {
                clearCart();
                //PurchaseCartController.Clear(Session);
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Validation.setError(lblmessage, ex.Message);
            }
        }
        protected void ddbatchno_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddbatchno.SelectedIndex <= 0)
            {
                txtPureRate.Text = "";
            }
            else
                txtPureRate.Text = Utilities.getsalerate(ddproductno.SelectedValue, ddbatchno.SelectedValue);
        }

        public void batchSelectedDefault(object sender, EventArgs e)
        {
            ListItem li = new ListItem();
            li.Selected = true;
            li.Text = "Select Batch No";
            li.Value = "-1";
            ddbatchno.Items.Insert(0, li);
        }
    }
}