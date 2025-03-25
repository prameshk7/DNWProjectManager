using System;
using System.Web.UI.WebControls;

namespace DataCoursework.WebForm
{
    public partial class TopPerformerCQ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlProjects.DataBind();
                GridView1.DataSourceID = "SqlDataSourceAllProjects";
                GridView1.DataBind();
            }
        }

        protected void ddlProjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ddlProjects.SelectedValue))
            {
                
                GridView1.DataSourceID = "SqlDataSourceAllProjects";
            }
            else
            {
     
                GridView1.DataSourceID = "SqlDataSourceSpecificProject";
            }

            GridView1.DataBind();
        }
    }
}