using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Medicine.DataManager;

/// <summary>
/// Summary description for userUtils
/// </summary>
public class userUtils
{
	public userUtils()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static string getusertype(int sno)
    {
        Medicine.DataManager.DataSet1TableAdapters.usertypeTableAdapter uta = new Medicine.DataManager.DataSet1TableAdapters.usertypeTableAdapter();
        DataSet1.usertypeDataTable udt = uta.GetDataBySno(sno);
        DataSet1.usertypeRow ur = (DataSet1.usertypeRow)udt.Rows[0];
        return ur.usertype;
    }
}