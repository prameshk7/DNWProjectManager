using System;

namespace DataCoursework.WebForm
{
    public partial class ProjectMilestoneCQ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string projectId = Request.QueryString["PROJECT_ID"];
                if (!string.IsNullOrEmpty(projectId))
                {
                    SqlDataSource1.SelectParameters["PROJECT_ID"].DefaultValue = projectId;
                    GridView1.DataBind();
                }
            }
        }

        protected void ddlProjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

    
    }
}