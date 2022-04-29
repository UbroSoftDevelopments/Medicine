using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Medicine.DataManager;

/// <summary>
/// Summary description for ProductUtilities
/// </summary>
public class ProductUtilities
{
    public bool valid=false;
    public int sno, companyno;
    public string type, companyname;
	public ProductUtilities(int sno,string type)
	{
        this.sno = sno;
        this.type = type;
        valid = true;
		
	}
    public ProductUtilities(string companyname,int companyno)
    {
        this.companyno = companyno;
        this.companyname = companyname;
        valid = true;
    }
    public ProductUtilities(string sn)
    {
        try
        {
            int sno = Convert.ToInt32(sn);
            Medicine.DataManager.DataSet1TableAdapters.unitTableAdapter da = new Medicine.DataManager.DataSet1TableAdapters.unitTableAdapter();
            DataSet1.unitDataTable dt = da.GetDataBySno(sno);
            DataSet1.unitRow dr = (DataSet1.unitRow)dt.Rows[0];
            this.sno = dr.sno;
            this.type = dr.unit;
            valid = true;
        }
        catch
        {
            valid = false;
        }
    
    
      }
    public ProductUtilities(int companyno)
    {
       
        try
        {
            Medicine.DataManager.DataSet1TableAdapters.medicinecompanyTableAdapter da = new Medicine.DataManager.DataSet1TableAdapters.medicinecompanyTableAdapter();
            DataSet1.medicinecompanyDataTable dt = da.GetDataByCompanyNo(companyno);
            DataSet1.medicinecompanyRow dr = (DataSet1.medicinecompanyRow)dt.Rows[0];
            this.companyno = dr.companyno;
            this.companyname = dr.companyname;
            valid = true;
        }
        catch
        {
            valid = false;

        }

    }
    public bool Valid
    {
        get
        {
            return valid;
        }

    }
    public static string GetMedicineNameByStockSno(int medicinestocksno)
    {
        try
        {
            Medicine.DataManager.DataSet1TableAdapters.medicinestockTableAdapter ma = new Medicine.DataManager.DataSet1TableAdapters.medicinestockTableAdapter();
            DataSet1.medicinestockDataTable mt = ma.GetDataBySno(medicinestocksno);
            if (mt.Rows.Count <= 0)
                return " ";
            DataSet1.medicinestockRow mr = (DataSet1.medicinestockRow)mt.Rows[0];
            int productno = mr.productno;
            Medicine.DataManager.DataSet1TableAdapters.productsTableAdapter da = new Medicine.DataManager.DataSet1TableAdapters.productsTableAdapter();
            DataSet1.productsDataTable dt = da.GetDataByProductNo(productno);
            DataSet1.productsRow dr = (DataSet1.productsRow)dt.Rows[0];
            return dr.productname;
        }
        catch
        {
            return " ";
        }
    }
    public static string GetProductNameByProductNo(int productno)
    {
        try
        {
            Medicine.DataManager.DataSet1TableAdapters.productsTableAdapter da = new Medicine.DataManager.DataSet1TableAdapters.productsTableAdapter();
            DataSet1.productsDataTable dt = da.GetDataByProductNo(productno);
            DataSet1.productsRow dr = (DataSet1.productsRow)dt.Rows[0];
            return dr.productname;
        }
        catch
        {
            return "";
        }
    }
    public static int GetTotalQuantity(int productno)
    {
        try
        {
            int quantity = 0;
            MedicineStockData mda = new MedicineStockData(productno);
            int box = mda.BoxNo;
            int strip = mda.StripInsideBox;
            int medicine = mda.MedicineInsideStrip;
            quantity = quantity + (box * strip * medicine);
            return quantity;
           

        }
        catch
        {
            return 0;
        }

    }
    public static string GetUnitName(int sno)
    {
        try
        {
            UnitUtilities ut = new UnitUtilities(sno);
            return ut.Unit;
        }
        catch
        {
            return "";
        }
    }
    public int Sno
    {
        get {
            return sno;
         }
    
     }
    public int CompanyNo
    {
        get
        {
            return companyno;
        }
    }
    public string Type
    {
        get
        {
            return type;
        }
    }
    public string CompanyName
    {
        get
        {
            return companyname;
        }
    }
    public static string GetBatchNoFromProductNo(int productno)
    {
        try
        {
            Medicine.DataManager.DataSet1TableAdapters.productbatchTableAdapter da = new Medicine.DataManager.DataSet1TableAdapters.productbatchTableAdapter();
            DataSet1.productbatchDataTable dt = da.GetDataByProductNo(productno);
            DataSet1.productbatchRow dr = (DataSet1.productbatchRow)dt.Rows[0];
            return dr.batchno;
        }
        catch
        {
            return "";
        }
    }
    public static string GetProductCompanyNameFromProductNo(int productno)
    {
        try
        {
            Medicine.DataManager.DataSet1TableAdapters.productsTableAdapter da = new Medicine.DataManager.DataSet1TableAdapters.productsTableAdapter();
            DataSet1.productsDataTable dt = da.GetDataByProductNo(productno);
            DataSet1.productsRow dr = (DataSet1.productsRow)dt.Rows[0];
            int companyno=dr.companyno;
            Medicine.DataManager.DataSet1TableAdapters.medicinecompanyTableAdapter mda = new Medicine.DataManager.DataSet1TableAdapters.medicinecompanyTableAdapter();
            DataSet1.medicinecompanyDataTable mdt = mda.GetDataByCompanyNo(companyno);
            DataSet1.medicinecompanyRow mdr = (DataSet1.medicinecompanyRow)mdt.Rows[0];
            return mdr.companyname;
        }
        catch
        {
            return "";
        }
    }
    public static string GetProductPackingFromProductNo(int productno)
    {
        try
        {
            Medicine.DataManager.DataSet1TableAdapters.productsTableAdapter da = new Medicine.DataManager.DataSet1TableAdapters.productsTableAdapter();
            DataSet1.productsDataTable dt = da.GetDataByProductNo(productno);
            DataSet1.productsRow dr = (DataSet1.productsRow)dt.Rows[0];
            int typeno = dr.typeno;
            Medicine.DataManager.DataSet1TableAdapters.unitTableAdapter uda = new Medicine.DataManager.DataSet1TableAdapters.unitTableAdapter();
            DataSet1.unitDataTable udt = uda.GetDataBySno(typeno);
            DataSet1.unitRow udr = (DataSet1.unitRow)udt.Rows[0];
            return udr.unit;
        }
        catch
        {
            return "";
        }
    }
    public static int GetTotalMedicineQuantity(int box, int strip, int medicine)
    {
        try
        {
            int quantity = 0;
            quantity = quantity + (box * strip * medicine);
            return quantity;


        }
        catch
        {
            return 0;
        }
    }
    public static string GetFirmNameFromBillNo(int billno)
    {
        try
        {
            Medicine.DataManager.DataSet1TableAdapters.customerbilldetailsTableAdapter da = new Medicine.DataManager.DataSet1TableAdapters.customerbilldetailsTableAdapter();
            DataSet1.customerbilldetailsDataTable dt = da.GetDataByBillno(billno);
            DataSet1.customerbilldetailsRow dr = (DataSet1.customerbilldetailsRow)dt.Rows[0];
            return dr.firmname;
        }
        catch
        {
            return "";
        }
    }

}