using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Medicine.DataManager;

/// <summary>
/// Summary description for DiscountUtilities
/// </summary>
public class DiscountUtilities
{
    public static double GetDiscountOnReceiptByReceiptNo(int receiptno)
    {
        try
        {
            Medicine.DataManager.DataSet1TableAdapters.discountinmedicineTableAdapter da = new Medicine.DataManager.DataSet1TableAdapters.discountinmedicineTableAdapter();
            DataSet1.discountinmedicineDataTable dt = da.GetDataByCustomerNo(receiptno);
            if (dt.Rows.Count <= 0)
                return 0;
            DataSet1.discountinmedicineRow dr = (DataSet1.discountinmedicineRow)dt.Rows[0];
            return dr.discountamount;
        }
        catch
        {
            return 0;
        }
    }
}