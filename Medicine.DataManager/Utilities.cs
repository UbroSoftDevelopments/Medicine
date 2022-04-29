using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Utilities
/// </summary>
public class Utilities
{
    public bool valid = false;
    public static string getTotal(double price,double quantity)
    {
        price = Math.Round(price, 2);
        return "" + (price * quantity);
    }
    public static string gettype(object sno)
    {
        try
        {

            return getPackingType(Convert.ToInt32(sno));
        }
        catch
        {
            return "";
        }

    }
    public static string getMargin(double purchaserate, double sellingrate)
    {
        return "<i class=\"fa fa-inr \"/>" + (sellingrate - purchaserate)+"/-";
    }
    public static string getMarginPercentage(double purchaserate, double sellingrate)
    {
        return""+ (((sellingrate - purchaserate) / purchaserate) *100)+"%";
    }
    public static string getsalerate(object productno,string batchno)
    {
        try
        {
            SearchingUtilities su = new SearchingUtilities(Convert.ToInt32(productno),batchno);
            if (!su.Valid)
                throw new Exception();
            return ""+su.RateForSale;
        }
        catch(Exception ex)
        {
            return ex.Message;
        }
    }
    public static string getMedicineType(object sno)
    {
        try
        {
            MedicineTypeUtilities mtu = new MedicineTypeUtilities(Convert.ToInt32(sno));
            if (!mtu.Valid)
                throw new Exception();
            return mtu.Type;
        }
        catch
        {
            return "";
        }
    }

    public static string getPackingType(object sno)
    {
        try
        {
            ProductUtilities product = new ProductUtilities(""+sno);
            if (!product.Valid)
                throw new Exception();
            return product.Type;
        }
        catch
        {
            return "";
        }

    }
    public static string getCompanyName(int Companyno)
    {
        try
        {
            CompanyUtilities utilities = new CompanyUtilities(Companyno);
            if (!utilities.Valid)
                throw new Exception();
            return utilities.CompanyName;
        }
        catch
        {
            return "";
        }

    }

    public static float GetMrp(int sno)
    {
        try
        {
            MedicineStockData msd = new MedicineStockData(sno);
            if (!msd.Valid)
                throw new Exception();
            return msd.Mrp;

        }
        catch
        {
            return 0;
        }
    }

    public static int GetMedicineNo(int sno)
    {
        try
        {
            MedicineStockData msd = new MedicineStockData(sno);
            if (!msd.Valid)
                throw new Exception();
            return msd.MedicineInsideStrip;

        }
        catch
        {
            return 0;
        }
    }


    public static DateTime GetExpiry(int sno)
    {
        MedicineStockData mds = new MedicineStockData(sno);
        if (!mds.Valid)
            throw new Exception();
        return mds.ExpiryDate;
    }
    public static string GetBAtchNo(int sno)
    {
        MedicineStockData msd = new MedicineStockData(sno);
        if (!msd.Valid)
            throw new Exception();
        return msd.BatchNo;
    }

}