using System;
using System.Web.UI.WebControls;
using System.Text;

namespace DataCoursework.WebForm
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Bind the Repeaters to fetch the data
                RepeaterTaskStatus.DataBind();
                RepeaterProjectStatus.DataBind();

                // Generate the JavaScript array for taskStatusData (Bar Chart)
                StringBuilder taskStatusDataScript = new StringBuilder();
                taskStatusDataScript.Append("[");
                bool firstTask = true;
                foreach (RepeaterItem item in RepeaterTaskStatus.Items)
                {
                    if (!firstTask)
                    {
                        taskStatusDataScript.Append(",");
                    }
                    Label statusLabel = (Label)item.FindControl("lblStatus");
                    Label countLabel = (Label)item.FindControl("lblCount");
                    if (statusLabel != null && countLabel != null)
                    {
                        taskStatusDataScript.Append($"{{ status: '{statusLabel.Text}', count: {countLabel.Text} }}");
                    }
                    firstTask = false;
                }
                taskStatusDataScript.Append("]");

                // Register the script to set taskStatusData
                string taskScript = $"var taskStatusData = {taskStatusDataScript.ToString()};";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "TaskStatusDataScript", taskScript, true);

                // Generate the JavaScript array for projectStatusData (Pie Chart)
                StringBuilder projectStatusDataScript = new StringBuilder();
                projectStatusDataScript.Append("[");
                bool firstProject = true;
                foreach (RepeaterItem item in RepeaterProjectStatus.Items)
                {
                    if (!firstProject)
                    {
                        projectStatusDataScript.Append(",");
                    }
                    Label statusLabel = (Label)item.FindControl("lblStatus");
                    Label countLabel = (Label)item.FindControl("lblCount");
                    if (statusLabel != null && countLabel != null)
                    {
                        projectStatusDataScript.Append($"{{ status: '{statusLabel.Text}', count: {countLabel.Text} }}");
                    }
                    firstProject = false;
                }
                projectStatusDataScript.Append("]");

                // Register the script to set projectStatusData
                string projectScript = $"var projectStatusData = {projectStatusDataScript.ToString()};";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ProjectStatusDataScript", projectScript, true);
            }
        }
    }
}