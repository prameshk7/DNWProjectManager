using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DataCoursework.WebForm
{
    public partial class userProjectCQ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlUsers.DataBind();

                if (ddlUsers.Items.Count > 1)
                {
                    ddlUsers.SelectedIndex = 1;
                    FormView1.DataBind();
                    GridView1.DataBind();
                }
            }
        }

        protected void ddlUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            FormView1.DataBind();
            GridView1.DataBind();
        }
    }
}