using System;
using System.Web.UI.WebControls;

namespace DataCoursework
{
    public partial class userTaskForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex >= 0)
            {
                FormView1.DataBind();
            }
        }

        protected void SqlDataSourceFormView_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                if (e.Exception.Message.Contains("ORA-02292"))
                {
                    lblError.Text = "Cannot delete this task because it is referenced by other records (e.g., subtasks).";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
                else
                {
                    lblError.Text = $"An error occurred while deleting the task: {e.Exception.Message}. Please try again.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = "No task was deleted. The task may have already been removed.";
                lblError.Visible = true;
            }
            else
            {
                lblError.Text = "Task deleted successfully!";
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
                    lblError.Text = "Cannot delete this task because it is referenced by other records (e.g., subtasks).";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
                else
                {
                    lblError.Text = $"An error occurred while deleting the task: {e.Exception.Message}. Please try again.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = "No task was deleted. The task may have already been removed.";
                lblError.Visible = true;
            }
            else
            {
                lblError.Text = "Task deleted successfully!";
                lblError.CssClass = "text-green-500 mb-4 block";
                lblError.Visible = true;
                GridView1.DataBind();
                FormView1.DataBind();
            }
        }

        protected void SqlDataSourceFormView_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                if (e.Exception.Message.Contains("ORA-00001"))
                {
                    lblError.Text = "Task ID already exists. Please choose a different Task ID.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
                else if (e.Exception.Message.Contains("ORA-02291"))
                {
                    lblError.Text = "Invalid Project ID. Please select a valid Project.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
                else
                {
                    lblError.Text = $"An error occurred while adding the task: {e.Exception.Message}. Please try again.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
            }
            else
            {
                lblError.Text = "Task added successfully!";
                lblError.CssClass = "text-green-500 mb-4 block";
                lblError.Visible = true;
                FormView1.ChangeMode(FormViewMode.Insert);
                GridView1.DataBind();
            }
        }

        protected void SqlDataSourceFormView_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                if (e.Exception.Message.Contains("ORA-02291"))
                {
                    lblError.Text = "Invalid Project ID. Please select a valid Project.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
                else
                {
                    lblError.Text = $"An error occurred while updating the task: {e.Exception.Message}. Please try again.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = "No task was updated. The task may have been deleted or modified by another user.";
                lblError.Visible = true;
            }
            else
            {
                lblError.Text = "Task updated successfully!";
                lblError.CssClass = "text-green-500 mb-4 block";
                lblError.Visible = true;
                GridView1.DataBind();
                FormView1.DataBind();
            }
        }
    }
}