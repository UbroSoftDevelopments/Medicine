using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Medicine.DataManager;

public class PurchaseItemDetails
{
    int  billno,productno,boxno,stripinsidebox,medicineinsidestrip,unit;
    string productname,hsn, batchno,Uname;
    float mrp, purerate;
    DateTime mfgdate, expirydate;
    bool valid=false;
    int rackno;
    int totalQuantity;
	public PurchaseItemDetails(int billno,int productno,int boxno,int stripinsidebox,int medicineinsidestrip,int unit,
        string productname,string batchno, string hsn,float mrp,float purerate,DateTime mfgdate,DateTime expirydate,int rackno)
	{
        this.rackno = rackno;
        this.billno = billno;
        this.productno = productno;
        this.hsn = hsn;
        this.boxno = boxno;
        this.stripinsidebox = stripinsidebox;
        this.medicineinsidestrip = medicineinsidestrip;
        this.unit = unit;

        UnitUtilities un = new UnitUtilities(unit);
        this.Uname = un.unit;

        this.productname = productname;
        this.batchno = batchno;
        this.mrp = mrp;
        this.purerate = purerate;
        this.mfgdate = mfgdate;
        this.expirydate = expirydate;
        this.rackno = rackno;
        valid = true;

}

    /***********************************************************************************/
    public PurchaseItemDetails(int billno, int totalQuantity, int unit,
        string productname, string batchno, string hsn, float mrp, float purerate, DateTime mfgdate, DateTime expirydate, int rackno)
    {
        this.rackno = rackno;
        this.billno = billno;
        this.hsn = hsn;
        this.totalQuantity = totalQuantity;
        this.unit = unit;

        UnitUtilities un = new UnitUtilities(unit);
        this.Uname = un.unit;

        this.productname = productname;
        this.batchno = batchno;
        this.mrp = mrp;
        this.purerate = purerate;
        this.mfgdate = mfgdate;
        this.expirydate = expirydate;
        this.rackno = rackno;
        valid = true;

    }
    /***********************************************************************************/

    public PurchaseItemDetails(int productno)
    {
        try
        {
            Medicine.DataManager.DataSet1TableAdapters.purchaseitemTableAdapter da = new Medicine.DataManager.DataSet1TableAdapters.purchaseitemTableAdapter();
            DataSet1.purchaseitemDataTable dt = da.GetDataBySno(productno);
            DataSet1.purchaseitemRow dr = (DataSet1.purchaseitemRow)dt.Rows[0];
            this.productno = dr.productno;
            this.billno = dr.billno;
            this.productno = dr.productno;
            this.hsn =dr.hsn;
            this.boxno = dr.boxno;
            this.stripinsidebox = dr.stripinsidebox;
            this.medicineinsidestrip = dr.medicineinsidestrip;

            UnitUtilities un = new UnitUtilities(dr.unit);
            this.Uname = un.unit;

            this.productname = dr.productname;
            this.batchno =dr.batchno;
            this.mrp =(float)dr.mrp;
            this.purerate =(float)dr.purerate;
            this.mfgdate =dr.mfgdate;
            this.expirydate = dr.expirydate;
           
            valid = true;
        }
        catch
        {

            valid = false;
        }
      }

    /*public bool Valid
    {
        get {

            return valid;
         }
    
      }*/
 
    public int BillNo
    {
        get
        {
            return billno;
        }

    }
    public string ProductName
    {
        get
        {
            return productname;
        }

    }
    public string BatchNo
    {
        get
        {
            return batchno;
        }

    }
    public float price()
    {
        return mrp;
    }
    /*public float Mrp
    {
        get
        {
            return mrp;
        }
    }*/
    public float MRP
    {
        get
        {
            return purerate;
        }
    }
    public string MfgDate
    {
        get
        {

            return DateUtilities.dateFormat( mfgdate);
        }
    }
    public string ExpiryDate
    {
        get
        {
            return DateUtilities.dateFormat( expirydate);
        }

    }
    public int BoxNo
    {
        get
        {
            return boxno;
        }
    }
    public int StripInsideBox
    {
        get
        {
            return stripinsidebox;
        }
    }
    public int MedicineInsideStrip
    {
        get
        {
            return medicineinsidestrip;
        }
    }

    public int Unit()
    {
        return unit;
    }

    public string UnitName
    {
        get
        {
            return Uname;
        }
    }
    public string Hsn
    {
        get
        {

            return hsn;
        }
    }
    
   public int ProductNo
    {
        get
        {
            return productno;
        }
    }
    public int RackNo
    {
        get
        {
            return rackno;
        }
    }
   

}
