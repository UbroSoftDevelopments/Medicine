using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Medicine.DataManager;

/// <summary>
/// Summary description for MedicineTypeUtilities
/// </summary>
public class MedicineTypeUtilities
{
	
    public bool valid = false;
   public  int sno;
   public string type;
	public MedicineTypeUtilities(int sno,string type)

	{
        this.sno = sno;
        this.type = type;
        valid = true;
	}
    public MedicineTypeUtilities(int sno)
    {
        try
        {
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
    public string Type
    {
        get
        {
            return type;
        }
    }
}