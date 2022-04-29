using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DateUtilities
/// </summary>
public class DateUtilities
{

    private static DateTime defaultdate = new DateTime(1900, 1, 1);
    private static string[] months = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
    public static string[] fullmonths = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };

    public static int getInt(string str)
    {
        str = ("" + str).Trim();
        if (str.Equals(""))
            return -1;
        return Convert.ToInt32(str);
    }
    public static string dateFormat(DateTime date)
    {
        if (date == defaultdate)
            return "";
        return "" + date.Day + "-" + months[date.Month - 1] + "-" + date.Year;
    }
    public static string dateFormat1(DateTime date)
    {
        if (date == defaultdate)
            return "";
        return "" + months[date.Month - 1] + "-" + date.Year;
    }
    public static string dateFormat(object date)
    {
        try
        {
            DateTime dt = Convert.ToDateTime("" + date);
            return dateFormat(dt);
        }
        catch
        {
            return dateFormat(defaultdate);
        }
    }
    public static DateTime getDate(string date)
    {
        date = ("" + date.Trim());
        if (date.Equals(""))
            return defaultdate;
        return Convert.ToDateTime(date);



    }


    public static int dateDiffer(object startDate)
    {
        DateTime start = Convert.ToDateTime(startDate);
        DateTime today = System.DateTime.Now;
        double total = (start-today).TotalDays;
        int tt = (int)total;
        return tt;
    }

    public static DateTime getMidnight(DateTime date)
    {
        return new DateTime(date.Year, date.Month, date.Day);
    }
    public static DateTime DefaultDate
    {
        get
        {
            return defaultdate;
        }
    }
}