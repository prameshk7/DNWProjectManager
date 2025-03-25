using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DataCoursework.WebForm
{
    public partial class ProjectMilestoneCQ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                ddlProjects.DataBind();


                if (ddlProjects.Items.Count > 1)
                {
                    ddlProjects.SelectedIndex = 1;
                    DetailsView1.DataBind();
                    GridView1.DataBind();
                }

                string projectId = Request.QueryString["PROJECT_ID"];
                if (!string.IsNullOrEmpty(projectId))
                {
                    ddlProjects.SelectedValue = projectId;
                    DetailsView1.DataBind();
                    GridView1.DataBind();
                }
            }
        }

        protected void ddlProjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            DetailsView1.DataBind();
            GridView1.DataBind();
        }
    }
}