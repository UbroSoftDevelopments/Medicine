using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Medicine.DataManager;

namespace Medicine
{
    public partial class searchmedicine : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            {
                bool b = LoginManager.ProtectPage(Session, Response);
                if (!b)
                    return;
                int count = 0;
                DataManager.DataSet1TableAdapters.medicinestockTableAdapter da = new DataManager.DataSet1TableAdapters.medicinestockTableAdapter();
                DataSet1.medicinestockDataTable dt = da.GetData();
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    DataSet1.medicinestockRow dr = (DataSet1.medicinestockRow)dt.Rows[i];
                    if (StockUtilities.GetTotalStockByPnoAndBatchNo(dr.productno, dr.batchno) > 0 || DateUtilities.dateDiffer(dr.expirydate) <= 60)
                        count++;

                }
                if (count >= 1)

                    id01.CssClass = id01.CssClass + " visibleclass ";
            }

        }
        protected void btselect_Click(object sender, EventArgs e)
        {
            string name = Txtname.Text;
            DataManager.DataSet1TableAdapters.productsTableAdapter da = new DataManager.DataSet1TableAdapters.productsTableAdapter();
            DataSet1.productsDataTable dt = da.GetDataByProductName(name);

        }
        protected void gvMedicine_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                int n = Convert.ToInt32(("" + e.Row.Cells[0].Text).Trim());
                MedicineStockData mdd = new MedicineStockData(n);
                int stock = StockUtilities.GetTotalStockByPnoAndBatchNo(mdd.ProductNo, mdd.BatchNo);//MedicineStockData.GetTotalStockBySno(n);
                if (stock <= 0)
                    e.Row.CssClass = " w3-hide ";
            }
            catch
            {

            }
        }
    }
}