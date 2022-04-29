using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Medicine.DataManager;

/// <summary>
/// Summary description for MedicineEntryInStockcs
/// </summary>
public class MedicineEntryInStockcs
{
    public static int  UpdateMedicineInStock( int productno, int boxno, int stripinsidebox, int medicineinsidestrip, int rackno, float mrp, float rateafterdiscount
      , string batchno, string hsn, int unit, DateTime expirydate, DateTime mfgdate)
    {
        Medicine.DataManager.DataSet1TableAdapters.medicinestockTableAdapter da = new Medicine.DataManager.DataSet1TableAdapters.medicinestockTableAdapter();
        try
        {
           
            //da.Insert(productno, batchno, mrp, rateafterdiscount, mfgdate, expirydate, boxno, stripinsidebox, medicineinsidestrip, unit, hsn, rackno);
            int sno = Convert.ToInt32(da.GetMaxSno());
            return sno;
                      
        }
        catch
        {
            DataSet1.medicinestockDataTable dt = da.GetDataBySearchProduct(productno, batchno, stripinsidebox, medicineinsidestrip);
            if (dt.Rows.Count <= 0)
                return -1;
            DataSet1.medicinestockRow dr = (DataSet1.medicinestockRow)dt.Rows[0];
            int sno = dr.sno;
            da.UpdateStock(boxno, stripinsidebox, medicineinsidestrip, sno);
            return sno;

        }


    }
}