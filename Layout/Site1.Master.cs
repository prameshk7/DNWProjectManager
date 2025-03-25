using System;
using System.Web.UI;

namespace DataCoursework.Layout
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (ScriptManager.ScriptResourceMapping.GetDefinition("jquery") == null)
                {
                    ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
                    {
                        Path = "~/Scripts/jquery-3.6.0.min.js",
                        CdnPath = "https://code.jquery.com/jquery-3.6.0.min.js",
                        CdnSupportsSecureConnection = true,
                        LoadSuccessExpression = "window.jQuery"
                    });
                }

            }
        }

        protected bool IsActivePage(string pagePath)
        {
            string currentPath = Request.AppRelativeCurrentExecutionFilePath;
            return currentPath.Equals(pagePath, StringComparison.OrdinalIgnoreCase);
        }

        protected bool IsReportsPage()
        {
            string currentPath = Request.AppRelativeCurrentExecutionFilePath;
            return currentPath.Equals("~/WebForm/userProjectCQ.aspx", StringComparison.OrdinalIgnoreCase) ||
                   currentPath.Equals("~/WebForm/ProjectMilestoneCQ.aspx", StringComparison.OrdinalIgnoreCase) ||
                   currentPath.Equals("~/WebForm/TopPerformerCQ.aspx", StringComparison.OrdinalIgnoreCase);
        }
    }
}