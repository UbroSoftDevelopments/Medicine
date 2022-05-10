using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Medicine.DataManager;

namespace Medicine
{
    public partial class productname : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool b = LoginManager.ProtectAdminPage(Session, Response);
            if (!b)
                return;
            rdproductconfirm_SelectedIndexChanged(sender, e);
            DataManager.DataSet1TableAdapters.productsTableAdapter pda = new DataManager.DataSet1TableAdapters.productsTableAdapter();
            DataSet1.productsDataTable pdt = pda.GetData();
            int count = pdt.Rows.Count - 1;
            lblproductquantity.Text = "Total Product Added:-" + count;

        }

        protected void btsave_Click(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            lblmessage.Text = "";
            try
            {
                double purchaserate, rateforsale;
                string batchno;
                if (rdproductconfirm.SelectedValue.Equals("new"))
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
                    purchaserate = Convert.ToDouble(txtpurchaserate.Text);
                    if (txtsalerate.Text.Equals("") || Convert.ToDouble(txtsalerate.Text) <= 0)
                        throw new Exception("Invalid MRP");
                    rateforsale = Convert.ToDouble(txtsalerate.Text);
                    if (purchaserate > rateforsale)
                        throw new Exception("Purchase Rate Should Be Less Than MRP!!");

                    batchno = txtbatchno.Text;
                    if (batchno.Equals(""))
                        throw new Exception("Please Enter The Batch No.!!");



                    DataManager.DataSet1TableAdapters.productsTableAdapter da = new DataManager.DataSet1TableAdapters.productsTableAdapter();
                    DataSet1.productsDataTable dt = da.GetDataByProductName(name);
                    if (dt.Rows.Count <= 0)
                    {
                        da.InsertQuery(name, typeno, companyno, "");

                        int productno = Convert.ToInt32(da.GetMaxProductNo());
                        DataManager.DataSet1TableAdapters.productbatchTableAdapter pda = new DataManager.DataSet1TableAdapters.productbatchTableAdapter();
                        pda.InsertQuery(productno, batchno, Convert.ToDecimal(purchaserate), Convert.ToDecimal(rateforsale));
                    }
                }
                else
                {
                    if (rdproductconfirm.SelectedValue.Equals("existing"))
                    {
                        if (txtpurchaserate.Text.Equals("") || Convert.ToDouble(txtpurchaserate.Text) <= 0)
                            throw new Exception("Invalid Purchase Rate");
                        purchaserate = Convert.ToDouble(txtpurchaserate.Text);
                        if (txtsalerate.Text.Equals("") || Convert.ToDouble(txtsalerate.Text) <= 0)
                            throw new Exception("Invalid MRP");
                        rateforsale = Convert.ToDouble(txtsalerate.Text);
                        if (purchaserate > rateforsale)
                            throw new Exception("Purchase Rate Should Be Less Than MRP!!");
                        batchno = txtbatchno.Text;
                        if (batchno.Equals(""))
                            throw new Exception("Please Enter The Batch No.!!");
                        int productno = Convert.ToInt32(ddproduct.SelectedValue);
                        DataManager.DataSet1TableAdapters.productbatchTableAdapter pda = new DataManager.DataSet1TableAdapters.productbatchTableAdapter();
                        DataSet1.productbatchDataTable pdt = pda.GetDataByBatchNoAndProductNo(batchno, productno);
                        if (pdt.Rows.Count > 0)
                            throw new Exception("Entry For This Batchno And Product Has Already Done!!");

                        double oldmrp = Convert.ToDouble(pda.GetMinMrpByProductNo(productno));
                        if ((oldmrp < purchaserate) && b.Text.Equals("Save"))
                        {
                            id01.CssClass = id01.CssClass + " visibleclass ";
                            lblmrpdetails.Text = "You have already purchase this medicine @ Rs." + oldmrp + "/-";
                            hymrpdetails.NavigateUrl = "mrpdetails.aspx?pno=" + productno;
                            return;
                        }
                        pda.InsertQuery(productno, batchno, Convert.ToDecimal(purchaserate), Convert.ToDecimal(rateforsale));
                    }
                }


                Validation.setSuccess(lblmessage, "Success");
                GridView1.DataBind();

            }

            catch (Exception ex)
            {
                Validation.setError(lblmessage, ex.Message);
            }
        }
        protected void btreset_Click(object sender, EventArgs e)
        {
            Validation.totalResetTextBoxes(txtproductname, txtbatchno, txtpurchaserate, txtsalerate);
            Validation.totalResetLabels(lblmessage);
            ddproductcompany.SelectedIndex = 0;
            ddproducttype.SelectedIndex = 0;
        }


        protected void rdproductconfirm_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdproductconfirm.SelectedValue.Equals("new"))
            {
                newproductdiv.Visible = true;
                existingproductdiv.Visible = false;
                ratesdiv.Visible = true;
            }
            else
                if (rdproductconfirm.SelectedValue.Equals("existing"))
            {
                newproductdiv.Visible = false;
                existingproductdiv.Visible = true;
                ratesdiv.Visible = true;
            }
        }
    }
}