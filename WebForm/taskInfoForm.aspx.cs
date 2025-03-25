using System;
using System.Web.UI.WebControls;

namespace DataCoursework
{
    public partial class taskInfoForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            FormView1.DataBind();
        }

        protected void SqlDataSourceFormView_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                if (e.Exception.Message.Contains("ORA-00001"))
                {
                    lblError.Text = "This task-user association already exists. Please choose a different combination.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
                else if (e.Exception.Message.Contains("ORA-02291"))
                {
                    lblError.Text = "Invalid Task ID or User ID. Please select a valid Task and User.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
                else
                {
                    lblError.Text = $"An error occurred while adding the task-user association: {e.Exception.Message}. Please try again.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
            }
            else
            {
                lblError.Text = "Task-user association added successfully!";
                lblError.CssClass = "text-green-500 mb-4 block";
                lblError.Visible = true;
                FormView1.ChangeMode(FormViewMode.Insert);
                GridView1.DataBind();
            }
        }

        protected void SqlDataSourceFormView_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                if (e.Exception.Message.Contains("ORA-02292"))
                {
                    lblError.Text = "Cannot delete this task-user association because it is referenced by other records.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
                else
                {
                    lblError.Text = $"An error occurred while deleting the task-user association: {e.Exception.Message}. Please try again.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = "No task-user association was deleted. The association may have already been removed.";
                lblError.Visible = true;
            }
            else
            {
                lblError.Text = "Task-user association deleted successfully!";
                lblError.CssClass = "text-green-500 mb-4 block";
                lblError.Visible = true;
                GridView1.DataBind();
                FormView1.DataBind();
            }
        }

        protected void SqlDataSource1_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                if (e.Exception.Message.Contains("ORA-02292"))
                {
                    lblError.Text = "Cannot delete this task-user association because it is referenced by other records.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
                else
                {
                    lblError.Text = $"An error occurred while deleting the task-user association: {e.Exception.Message}. Please try again.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = "No task-user association was deleted. The association may have already been removed.";
                lblError.Visible = true;
            }
            else
            {
                lblError.Text = "Task-user association deleted successfully!";
                lblError.CssClass = "text-green-500 mb-4 block";
                lblError.Visible = true;
                GridView1.DataBind();
                FormView1.DataBind();
            }
        }
    }
}