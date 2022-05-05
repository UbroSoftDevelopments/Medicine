using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Medicine.DataManager;

namespace Medicine
{
    public partial class mycollection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool b = LoginManager.IsUserLoggedIn(Session);
            lblMsg.Text = "";
            if (!b)
            {
                Response.Redirect("login.aspx");
                return;
            }
            if (LoginManager.IsClerkLoggedIn(Session))
                user.Value = LoginManager.GetUserNumberByUsername("" + Session["username"]) + "";
            else
            {
                drpUsers_SelectedIndexChanged(sender, e);
            }
            if (!this.IsPostBack)
            {
                DateTime today = System.DateTime.Now.AddHours(12.50);
                todayDate.Value = today.Month + "/" + today.Day + "/" + today.Year;
            }
            else
            {
                doRefresh(sender, e);
            }
        }
        double m = 0, n = 0;

        protected void doRefresh(object sender, EventArgs e)
        {
            if (txtDate.Text.Trim().Equals(""))
            {
                lblMsg.Text = "Please Select Valid Date";
                return;
            }
            DateTime dateSelected = Convert.ToDateTime(txtDate.Text);
            todayDate.Value = dateSelected.Month + "/" + dateSelected.Day + "/" + dateSelected.Year;
            if (LoginManager.IsAdminLoggedIn(Session))
                user.Value = drpUsers.SelectedValue;
            grdPays.DataBind();

        }

        public void setTotal(object sender, EventArgs e)
        {
            if (grdPays.Rows.Count > 0)
            {
                grdPays.FooterRow.Cells[0].Text = "<b>Total</b>";
                grdPays.FooterRow.Cells[1].Text = "<b>Rs." + m + "/-</b>";
            }
            m = 0;
        }
        public void onRowBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                m += double.Parse(e.Row.Cells[1].Text);
            }
        }


        protected void drpUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            user.Value = drpUsers.SelectedValue;
            grdPays.DataBind();

        }
    }
}