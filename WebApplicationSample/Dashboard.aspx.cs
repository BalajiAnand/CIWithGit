using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationSample.db;

namespace WebApplicationSample
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.LoadUserList();
            }
        }


        private void LoadUserList()
        {
            var dt = dbHelper.getRecord();

            lvCustomers.DataSource = dt;
            lvCustomers.DataBind();
        }

        protected void OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lvCustomers.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.LoadUserList();
        }
    }
}