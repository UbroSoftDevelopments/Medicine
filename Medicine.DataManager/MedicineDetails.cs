using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Medicine.DataManager;

/// <summary>
/// Summary description for MedicineDetails
/// </summary>
public class MedicineDetails
{
    bool valid = false;
    public int productno;
    int sno,stripinsidebox,medicineinsidestrip,rackno,unit,extra;
     float mrp, rateafterdiscount,price;
    string batchno,hsn,productname,unitname;
    DateTime expirydate, mfgdate;
	public MedicineDetails(int sno,int productno, float price,int extra,int stripinsidebox,int medicineinsidestrip,int rackno,float mrp, float rateafterdiscount
      ,  string batchno,string productname,string hsn, int unit, DateTime expirydate, DateTime mfgdate)
        
	{
        this.sno = sno;
        this.batchno = batchno;
        this.productno = productno;
        this.extra = extra;
        this.mrp = mrp;
        this.rateafterdiscount =rateafterdiscount;
        this.expirydate = expirydate;
        this.mfgdate = mfgdate;
        this.price = price;
        this.stripinsidebox = stripinsidebox;
        this.medicineinsidestrip = medicineinsidestrip;
        this.unit = unit;
        this.hsn = hsn;
        this.productname = productname;
        this.rackno = rackno;
        valid = true;
}
  public MedicineDetails(int sno,int medicineinsidestrip,int stripinsidebox,int extra,float price)
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
          
          this.stripinsidebox = stripinsidebox;
          this.medicineinsidestrip = medicineinsidestrip;
          UnitUtilities un = new UnitUtilities(dr.unit);
          this.unitname = un.unit;
          this.hsn = dr.hsn;
          this.rackno = Convert.ToInt32(dr.rackno);
          
          //this.price = rateafterdiscount % medicineinsidestrip+extra;
          this.price = price;
            Medicine.DataManager.DataSet1TableAdapters.productsTableAdapter pda = new Medicine.DataManager.DataSet1TableAdapters.productsTableAdapter();
          DataSet1.productsDataTable pdt = pda.GetDataByProductNo(productno);
          DataSet1.productsRow pdr = (DataSet1.productsRow)pdt.Rows[0];
          this.productname = pdr.productname;
          this.extra = extra;
           valid = true;


      }
      catch {

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
  public int Extra
  {
      get
      {
          return extra;
      }
  }
  public int Sno
  {
      get
      {
          return sno;

      }
  }
  public float Price
  {
      get
      {

          return price;
      }
  }


  public string ProductName
  {

      get
      {
          return productname;
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

  public string unitName
  {
      get
      {
          return unitname;
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