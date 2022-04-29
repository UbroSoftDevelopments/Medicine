using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Medicine.DataManager;

/// <summary>
/// Summary description for MrpUtilities
/// </summary>
public class MrpUtilities
{
    public static double GetProductMrpByProductNo(int productno)
    {
        try
        {
            Medicine.DataManager.DataSet1TableAdapters.productbatchTableAdapter da=new Medicine.DataManager.DataSet1TableAdapters.productbatchTableAdapter();
            DataSet1.productbatchDataTable dt=da.GetDataByProductNo(productno);
            DataSet1.productbatchRow dr=(DataSet1.productbatchRow)dt.Rows[0];
            return dr.rateforsale;
        }
        catch
        {
            return 0;
        }
    }
}