using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Medicine.DataManager;

/// <summary>
/// Summary description for MedicineStockData
/// </summary>
public class MedicineStockData
{
    bool valid = false;
    int sno, productno, boxno, stripinsidebox, medicineinsidestrip, rackno, unit;
    float mrp, rateafterdiscount;
    string batchno, hsn;
    DateTime expirydate, mfgdate;
    public MedicineStockData(int sno, int productno, int boxno, int stripinsidebox, int medicineinsidestrip, int rackno, float mrp, float rateafterdiscount
      , string batchno, string hsn, int unit, DateTime expirydate, DateTime mfgdate)
	{
        this.sno = sno;
        this.batchno = batchno;
        this.productno = productno;
        this.mrp = mrp;
        this.rateafterdiscount =rateafterdiscount;
        this.expirydate = expirydate;
        this.mfgdate = mfgdate;
        this.boxno = boxno;
        this.stripinsidebox = stripinsidebox;
        this.medicineinsidestrip = medicineinsidestrip;
        this.unit = unit;
        this.hsn = hsn;
        this.rackno = rackno;
        valid = true;
}
  public MedicineStockData(int sno)
  {
      try
      {
            Medicine.DataManager.DataSet1TableAdapters.medicinestockTableAdapter da = new Medicine.DataManager.DataSet1TableAdapters.medicinestockTableAdapter();
          DataSet1.medicinestockDataTable dt = da.GetDataBySno(sno);
          DataSet1.medicinestockRow dr = (DataSet1.medicinestockRow)dt.Rows[0];
          this.sno = dr.sno;
       
          this.productno = dr.productno;
          this.batchno = dr.batchno;
          this.mrp =(float) dr.mrp;
          this.rateafterdiscount = (float)dr.rateafterdiscount;
          this.expirydate = dr.expirydate;
          this.mfgdate = dr.mfgdate;
          this.boxno = dr.boxno;
          this.stripinsidebox = dr.stripinsidebox;
          this.medicineinsidestrip = dr.medicineinsidestrip;
          this.unit = dr.unit;
          this.hsn = dr.hsn;
          this.rackno = Convert.ToInt32(dr.rackno);
           valid = true;


      }
      catch {

          valid = false;
       }
  
  }

  /* public static int GetTotalStockByProductno(int productno)
   {
       try{
           DataSet1TableAdapters.currentstockTableAdapter da = new DataSet1TableAdapters.currentstockTableAdapter();
          int qty=Convert.ToInt32( da.GetDataByProductNo( Convert.ToInt32( productno)));
         return qty;
           
  
   }
       catch
   {
     return 0;

   }
   }
   public static int GetTotalStockBySno(int sno)
   {
       try
       {
           DataSet1TableAdapters.currentstockTableAdapter da = new DataSet1TableAdapters.currentstockTableAdapter();
           DataSet1.currentstockDataTable dt = da.GetDataByMedicineStockSno(sno);
           DataSet1.currentstockRow dr = (DataSet1.currentstockRow)dt.Rows[0];
           int avilable = dr.availableqty;
           int salequantity=0;
           if(!dr.IsqtyNull())
           salequantity = dr.qty;
           int avilablequantity = avilable - salequantity;
           return avilablequantity;


       }
       catch
       {
           return 0;

       }
   }*/


  public bool Valid
  {
      get
      {
          return valid;
      }

  }
  public int Sno
  {
      get
      {
          return sno;

      }
  }

  public int ProductNo
  {
      get
      {
          return productno;

      }
  }
  public string BatchNo
  {
      get
      {
          return batchno;
      }

  }
  public float Mrp
  {
      get
      {
          return mrp;
      }
  }
  public float RateAfterDiscount
  {
      get
      {
          return rateafterdiscount;
      }
  }
  public DateTime MfgDate
  {
      get
      {

          return mfgdate;
      }
  }
  public DateTime ExpiryDate
  {
      get
      {
          return expirydate;
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
  public int Unit
  {
      get
      {
          return unit;
      }
  }
  public string Hsn
  {
      get
      {

          return hsn;
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