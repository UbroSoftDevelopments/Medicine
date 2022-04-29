using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CartItem
/// </summary>
public class CartItem
{
  private  MedicineDetails medicine;
  private int purchasedquantity;
  float price;
  public int sno;
  public int productno;
	public CartItem(int sno,int quantity,int medicineinsidestrip,int stripsinsidebox,int extra,float price)
	{
        this.sno = sno;
         this.medicine = new MedicineDetails(sno,medicineinsidestrip,stripsinsidebox,extra,price);
         this.purchasedquantity = quantity;
         this.productno = medicine.productno;
	}

    public int serial()
    {
        return medicine.Sno;
    }

    /*public int Serialno
    {
        get
        {
            return medicine.Sno;
        }
    }*/

    public string ProductName
    {
        get
        {
          return medicine.ProductName;
        }
    }

    public string BatchNo
    {
        get
        {
            return medicine.BatchNo;
        }
    }
    public string MfgDate
    {
        get
        {
            return DateUtilities.dateFormat(medicine.MfgDate);
        }
    }
    public string ExpiryDate
    {
        get
        {
            return DateUtilities.dateFormat(medicine.ExpiryDate);
        }
    }
    public int Extra
    {
        get
        {
            return medicine.Extra;
        }
    }

    public int Quantity
    {
        get
        {
            return purchasedquantity;
        }
        set
        {
            purchasedquantity = value;
        }
    }
    /*public float Mrp
    {
        get
        {
            return medicine.Mrp;
        }
    }*/

    public float MRP
    {
        get
        {
            
            return medicine.RateAfterDiscount;
        }
    }
    
    public int StripInsideBox
    {
        get
        {
            return medicine.StripInsideBox;
        }

    }

    public float Price
    {
        get
        {
            return medicine.Price;
        }
    }

    public int MedicineInsideStrip
    {
        get
        {
            return medicine.MedicineInsideStrip;
        }

    }
    public string Unit
    {
        get
        {
            return medicine.unitName;
        }
    }
    public string Hsn
    {
        get
        {
            return medicine.Hsn;
        }
    }
    public int RackNo
    {
        get
        {

            return medicine.RackNo;
        }
    }
    
}