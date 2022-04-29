using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Medicine.DataManager;

/// <summary>
/// Summary description for MedicalStoresData
/// </summary>
public class MedicalStoresData
{
    public bool valid=false;
   public int sno;
   public string firmname, comment, address, mobileno, state, country;
	public MedicalStoresData(int sno,string firmname,string comment,string address,string mobileno,string state,string country)

	{
        this.sno = sno;
        this.firmname = firmname;
        this.comment = comment;
        this.address = address;
        this.mobileno = mobileno;
        this.state = state;
        this.country = country;
        valid = true;
	}
    public MedicalStoresData(int sno)
    {
        try
        {
            Medicine.DataManager.DataSet1TableAdapters.medicalstoresTableAdapter da = new Medicine.DataManager.DataSet1TableAdapters.medicalstoresTableAdapter();
            DataSet1.medicalstoresDataTable dt = da.GetDataBySno(sno);
            DataSet1.medicalstoresRow dr = (DataSet1.medicalstoresRow)dt.Rows[0];
            this.sno = dr.sno;
            this.firmname = dr.firmname;
            this.comment = dr.comment;
            this.address = dr.address;
            this.mobileno = dr.mobileno;
            this.state = dr.state;
            this.country = dr.country;
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
    public string FirmName
    {
        get
        {
            return firmname;
        }
    }
    public string Comment
    {
        get
        {
            return comment;
        }
    }
    public string Address
    {
        get
        {
            return address;
        }
    }
    public string MobileNo
    {
        get
        {
            return mobileno;
        }
    }
    public string State
    {
        get
        {
            return state;
        }
    }
    public string Country
    {
        get
        {
            return country;
        }
    }
}