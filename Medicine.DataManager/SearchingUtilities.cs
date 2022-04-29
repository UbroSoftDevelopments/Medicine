using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Medicine.DataManager;

/// <summary>
/// Summary description for SearchingUtilities
/// </summary>
public class SearchingUtilities
{
    public bool valid = false;
   public  int productno, typeno, companyno;
   float purchaserate, salerate;
  public   string productname, comment;
	public SearchingUtilities(int productno,int typeno,int companyno,string productname,string comment,float purchaserate,float salerate)
	{

        this.productno = productno;
        this.typeno = typeno;
        this.companyno = companyno;
        this.productname = productname;
        this.comment = comment;
        this.purchaserate = purchaserate;
        this.salerate = salerate;

        valid = true;
		
	}
    public SearchingUtilities(int productno,string batchno)
    {
        try
        {
            Medicine.DataManager.DataSet1TableAdapters.productsTableAdapter da = new Medicine.DataManager.DataSet1TableAdapters.productsTableAdapter();
            DataSet1.productsDataTable dt = da.GetDataByProductNo(productno);
            DataSet1.productsRow dr = (DataSet1.productsRow)dt.Rows[0];
            this.productno = dr.productno;
            this.typeno =dr.typeno;
            this.companyno = dr.companyno;
            this.productname = dr.productname;
            this.comment = dr.comment;
            Medicine.DataManager.DataSet1TableAdapters.productbatchTableAdapter pda = new Medicine.DataManager.DataSet1TableAdapters.productbatchTableAdapter();
            DataSet1.productbatchDataTable pdt = pda.GetDataByBatchNoAndProductNo(batchno, productno);
            DataSet1.productbatchRow pdr = (DataSet1.productbatchRow)pdt.Rows[0];
            this.purchaserate = (float)pdr.purchaserate;
            this.salerate = (float)pdr.rateforsale;
          
            valid = true;

        }
        catch
        {
            valid= false;
        }
    }
    public bool Valid
    {
        get
        {
            return valid;
        }
    }
    public int ProductNo
    {
        get
        {
            return productno;
        }
    }
    public float PurchaseRate
    {
        get
        {
            return purchaserate;
        }
    }
    public float RateForSale
    {
        get
        {
            return salerate;
        }
    }
    public int TypeNo
    {
        get
        {
            return typeno;
        }
    }
    public int CompanyNo
    {
        get
        {
            return companyno;
        }
    }
    public string ProductName
    {
        get
        {
            return productname;
        }
    }
    public string Comment
    {
        get
        {
            return comment;
        }
    }


}