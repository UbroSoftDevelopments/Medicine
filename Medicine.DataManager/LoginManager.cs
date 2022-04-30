using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.SessionState;

namespace Medicine.DataManager
{
    public class LoginManager
    {
        private static string loginpage = "login.aspx", homepage = "home.aspx", blankpage = "blank.aspx";
        public static void DoLogout(HttpSessionState session, HttpResponse response)
        {
            session.Abandon();
            response.Redirect(loginpage);
        }

        public static int GetUserNumberByUsername(string username)
        {
            try
            {
                DataSet1TableAdapters.siteusersTableAdapter da = new DataSet1TableAdapters.siteusersTableAdapter();
                DataSet1.siteusersDataTable dt = da.GetDataByUserName(username);
                if (dt.Rows.Count <= 0)
                    return 0;
                DataSet1.siteusersRow dr = (DataSet1.siteusersRow)dt.Rows[0];
                return dr.userno;
            }
            catch
            {
                return 0;
            }
        }
        public static string GetUsernamByUserNo(int userno)
        {
            try
            {
                DataSet1TableAdapters.siteusersTableAdapter da = new DataSet1TableAdapters.siteusersTableAdapter();
                DataSet1.siteusersDataTable dt = da.GetDataBySno(userno);
                if (dt.Rows.Count <= 0)
                    return "";
                DataSet1.siteusersRow dr = (DataSet1.siteusersRow)dt.Rows[0];
                return dr.userid;
            }
            catch
            {
                return "";
            }
        }
        public static bool ProtectAdminPage(HttpSessionState session, HttpResponse response)
        {

            try
            {
                if (IsAdminLoggedIn(session))
                    return true;
                response.Redirect(loginpage);
                return false;
            }
            catch
            {
                return false;

            }
        }

        public static bool ProtectClerkPage(HttpSessionState session, HttpResponse response)
        {

            try
            {
                if (IsClerkLoggedIn(session))
                    return true;
                response.Redirect(loginpage);
                return false;
            }
            catch
            {
                return false;

            }
        }


        public static bool ProtectPage(HttpSessionState session, HttpResponse response)
        {

            try
            {
                if (IsUserLoggedIn(session))
                    return true;
                response.Redirect(loginpage);
                return false;
            }
            catch
            {
                return false;

            }
        }


        public static string addNewUser(String userName, int userType, String password)
        {
            try
            {
                DataSet1TableAdapters.siteusersTableAdapter suta = new DataSet1TableAdapters.siteusersTableAdapter();
                DataSet1.siteusersDataTable sudt = suta.GetDataByUserName(userName);
                if (sudt.Rows.Count != 0)
                    return "User Already Exists Change User Name";

                suta.Insert(userName, password, "active", userType);
                return "Success";
            }
            catch (Exception ex)
            {
                return "" + ex.Message;
            }
        }





        public static bool DoLogin(string username, string password, HttpSessionState session, HttpResponse response)
        {
            try
            {
                bool b = IsUserNameAndPasswordCorrect(username, password);
                if (!b)
                    return false;
                bool active = IsUserActive(username);
                if (!active)
                    return false;
                session["username"] = username;
                string usertype = checkUserType(username);
                session["usertype"] = usertype;
                response.Redirect(homepage);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool IsUserLoggedIn(HttpSessionState session)
        {
            if (session["username"] == null)
                return false;
            return true;
        }
        public static string CurrentUser(HttpSessionState session)
        {
            if (session["username"] == null)
                return "";
            return "" + session["username"];
        }


        public static string ProtectAdmin(HttpSessionState session, HttpResponse response)
        {

            try
            {
                if (IsAdminLoggedIn(session))
                    return "admin";
                throw new Exception();

            }
            catch (Exception ex)
            {
                return "" + ex;

            }
        }





        public static bool IsClerkLoggedIn(HttpSessionState session)
        {
            if (("" + session["usertype"]).Equals("clerk"))
                return true;
            return false;
        }
        public static bool IsAdminLoggedIn(HttpSessionState session)
        {
            if (("" + session["usertype"]).Equals("admin"))
                return true;
            return false;

        }







        public static string checkUserType(string userName)
        {
            try
            {
                DataSet1TableAdapters.siteusersTableAdapter da = new DataSet1TableAdapters.siteusersTableAdapter();
                DataSet1.siteusersDataTable sdt = da.GetDataByUserName(userName);
                DataSet1.siteusersRow sur = (DataSet1.siteusersRow)sdt.Rows[0];
                int uType = sur.usertype;

                DataSet1TableAdapters.usertypeTableAdapter utta = new DataSet1TableAdapters.usertypeTableAdapter();
                DataSet1.usertypeDataTable utdt = utta.GetDataBySno(uType);
                DataSet1.usertypeRow utr = (DataSet1.usertypeRow)utdt.Rows[0];
                return utr.usertype;
            }
            catch
            {
                return "";
            }
        }

        public static bool IsUserActive(string user)
        {
            DataSet1TableAdapters.siteusersTableAdapter da = new DataSet1TableAdapters.siteusersTableAdapter();
            DataSet1.siteusersDataTable sdt = da.GetDataByUserName(user);
            DataSet1.siteusersRow sur = (DataSet1.siteusersRow)sdt.Rows[0];
            if (sur.status.Equals("active"))
                return true;
            return false;
        }


        public static bool IsUserNameAndPasswordCorrect(string username, string password)
        {
            try
            {
                DataSet1TableAdapters.siteusersTableAdapter da = new DataSet1TableAdapters.siteusersTableAdapter();
                DataSet1.siteusersDataTable dt = da.GetDataByUserIdAndPassword(username, password);
                if (dt.Rows.Count <= 0)
                    return false;
                DataSet1.siteusersRow dr = (DataSet1.siteusersRow)dt.Rows[0];
                if (!dr.userid.Equals(username))
                    return false;
                if (!dr.password.Equals(password))
                    return false;
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static bool logout(HttpSessionState session, HttpResponse response)
        {
            try
            {
                session.Abandon();
                response.Redirect(loginpage);
                return true;
            }
            catch
            {
                return false;
            }
        }

    }
}
