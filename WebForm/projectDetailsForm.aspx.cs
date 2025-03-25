using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DataCoursework
{
    public partial class projectDetailsForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex >= 0)
            {
                FormView2.DataBind();
            }
        }

        protected void SqlDataSourceFormView_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                if (e.Exception.Message.Contains("ORA-00001"))
                {
                    lblError.Text = "Project ID already exists. Please choose a different Project ID.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
                else
                {
                    lblError.Text = "An error occurred while adding the project. Please try again.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
            }
            else
            {
                lblError.Text = "Project added successfully!";
                lblError.CssClass = "text-green-500 mb-4 block";
                lblError.Visible = true;
                FormView2.ChangeMode(FormViewMode.Insert);
                GridView1.DataBind();
            }
        }

        protected void SqlDataSourceFormView_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = "An error occurred while updating the project. Please try again.";
                lblError.Visible = true;
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = "No project was updated. The project may have been modified by another user.";
                lblError.Visible = true;
            }
            else
            {
                lblError.Text = "Project updated successfully!";
                lblError.CssClass = "text-green-500 mb-4 block";
                lblError.Visible = true;
                GridView1.DataBind();
                FormView2.DataBind();
            }
        }

        protected void SqlDataSourceFormView_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = "An error occurred while deleting the project. Please try again.";
                lblError.Visible = true;
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = "No project was deleted. The project may have already been removed.";
                lblError.Visible = true;
            }
            else
            {
                lblError.Text = "Project deleted successfully!";
                lblError.CssClass = "text-green-500 mb-4 block";
                lblError.Visible = true;
                GridView1.DataBind();
                FormView2.DataBind();
            }
        }

        protected void SqlDataSource1_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = "An error occurred while deleting the project. Please try again.";
                lblError.Visible = true;
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = "No project was deleted. The project may have already been removed.";
                lblError.Visible = true;
            }
            else
            {
                lblError.Text = "Project deleted successfully!";
                lblError.CssClass = "text-green-500 mb-4 block";
                lblError.Visible = true;
                GridView1.DataBind();
                FormView2.DataBind();
            }
        }
    }
}