using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Medicine.DataManager;

/// <summary>
/// Summary description for CompanyUtilities
/// </summary>
public class CompanyUtilities
{
    public bool valid = false;
   public  int companyno;
   public string companyname, comment;
	public CompanyUtilities(int companyno,string companyname,string comment)
	{
        this.companyno = companyno;
        this.companyname = companyname;
        this.comment = comment;
        valid = true;
		
	}
    public CompanyUtilities(int companyno)
    {
        try
        {
            Medicine.DataManager.DataSet1TableAdapters.medicinecompanyTableAdapter da = new Medicine.DataManager.DataSet1TableAdapters.medicinecompanyTableAdapter();
            DataSet1.medicinecompanyDataTable dt = da.GetDataByCompanyNo(companyno);
            DataSet1.medicinecompanyRow dr = (DataSet1.medicinecompanyRow)dt.Rows[0];
            this.companyno = dr.companyno;
            this.companyname = dr.companyname;
            this.comment = dr.comment;
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
    public int CompanyNo
    {
        get
        {
            return companyno;
        }
    }
    public string CompanyName
    {
        get
        {
            return companyname;
        }
    }
}