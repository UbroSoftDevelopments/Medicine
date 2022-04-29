using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Medicine.DataManager;

/// <summary>
/// Summary description for StockUtilities
/// </summary>
public class StockUtilities
{
	public StockUtilities()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static int getTotalProductByProductnoAndBatchno(int productno, string batchno)
    {
        Medicine.DataManager.DataSet1TableAdapters.medicinestockTableAdapter msta = new Medicine.DataManager.DataSet1TableAdapters.medicinestockTableAdapter();
        int totalQuantity = Convert.ToInt32(msta.GetTotalStockByProductNoAndBatchNo(productno, batchno));
        if (totalQuantity == null)
            totalQuantity = 0;
        return totalQuantity;
    }
    public static int getTotalSoldProductByProductnoAndBatchno(int productno, string batchno)
    {
        Medicine.DataManager.DataSet1TableAdapters.medicinestockTableAdapter msta = new Medicine.DataManager.DataSet1TableAdapters.medicinestockTableAdapter();
        DataSet1.medicinestockDataTable msdt=msta.GetDataByProductNoAndBatchNo(productno,batchno);
        DataSet1.medicinestockRow msr=(DataSet1.medicinestockRow)msdt.Rows[0];

        Medicine.DataManager.DataSet1TableAdapters.receipt_itemsTableAdapter rita = new Medicine.DataManager.DataSet1TableAdapters.receipt_itemsTableAdapter();
        int totalQuantity;
        if(rita.GetSoldQuantityByMedicineStockSno(msr.sno)==null)
            totalQuantity=0;
        else
        totalQuantity= Convert.ToInt32(rita.GetSoldQuantityByMedicineStockSno(msr.sno));
        if (totalQuantity == null)
            totalQuantity = 0;
        return totalQuantity;
    }

    public static bool isProductAvailable(int productno, string batchno, int currentSelling)
    {
        int totalQuantity = StockUtilities.getTotalProductByProductnoAndBatchno(productno, batchno);
        int soldQuantity = StockUtilities.getTotalSoldProductByProductnoAndBatchno(productno, batchno);
        int balanceStock = totalQuantity - soldQuantity;
        if (currentSelling > balanceStock)
            return false;
        else
            return true;
    }

    public static int GetTotalStockByPnoAndBatchNo(int productno, string batchno)
    {
        int totalQuantity = StockUtilities.getTotalProductByProductnoAndBatchno(productno, batchno);
        int soldQuantity = StockUtilities.getTotalSoldProductByProductnoAndBatchno(productno, batchno);
        int balanceStock = totalQuantity - soldQuantity;
        return balanceStock;
    }

}