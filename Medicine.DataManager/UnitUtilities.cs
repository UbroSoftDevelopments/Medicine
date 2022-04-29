using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Medicine.DataManager;

/// <summary>
/// Summary description for UnitUtilities
/// </summary>
public class UnitUtilities
{
    public bool valid = false;
   public  int sno;
   public string unit;
	public UnitUtilities(int sno,string unit)

	{
        this.sno = sno;
        this.unit = unit;
        valid = true;
	}
    public UnitUtilities(int sno)
    {
        try
        {
            Medicine.DataManager.DataSet1TableAdapters.unitTableAdapter da = new Medicine.DataManager.DataSet1TableAdapters.unitTableAdapter();
            DataSet1.unitDataTable dt = da.GetDataBySno(sno);
            DataSet1.unitRow dr = (DataSet1.unitRow)dt.Rows[0];
            this.sno = dr.sno;
            this.unit = dr.unit;
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
    public int Sno
    {
        get
        {
            return sno;
        }
    }
    public string Unit
    {
        get
        {
            return unit;
        }
    }
   

}