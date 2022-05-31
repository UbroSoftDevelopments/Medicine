using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Medicine.DataManager;

namespace Medicine
{
    public partial class medicinenearexpiry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool b = LoginManager.ProtectPage(Session, Response);
            if (!b)
                return;

        }


        protected void btselect_Click(object sender, EventArgs e)
        {
            string name = Txtname.Text;
            DataManager.DataSet1TableAdapters.productsTableAdapter da = new DataManager.DataSet1TableAdapters.productsTableAdapter();
            DataSet1.productsDataTable dt = da.GetDataByProductName(name);

        }
    }
}