﻿using System;
using System.Web.UI.WebControls;

namespace DataCoursework
{
    public partial class milestoneForm : System.Web.UI.Page
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

        protected void SqlDataSourceFormView_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                if (e.Exception.Message.Contains("ORA-00001"))
                {
                    lblError.Text = "Milestone ID already exists. Please choose a different Milestone ID.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
                else if (e.Exception.Message.Contains("ORA-02291"))
                {
                    lblError.Text = "Invalid Project ID or User ID. Please select a valid Project and User.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
                else
                {
                    lblError.Text = $"An error occurred while adding the milestone: {e.Exception.Message}. Please try again.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
            }
            else
            {
                lblError.Text = "Milestone added successfully!";
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
                    lblError.Text = "Invalid Project ID or User ID. Please select a valid Project and User.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
                else
                {
                    lblError.Text = $"An error occurred while updating the milestone: {e.Exception.Message}. Please try again.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = "No milestone was updated. The milestone may have been deleted or modified by another user.";
                lblError.Visible = true;
            }
            else
            {
                lblError.Text = "Milestone updated successfully!";
                lblError.CssClass = "text-green-500 mb-4 block";
                lblError.Visible = true;
                GridView1.DataBind();
                FormView1.DataBind();
            }
        }

        protected void SqlDataSourceFormView_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                if (e.Exception.Message.Contains("ORA-02292"))
                {
                    lblError.Text = "Cannot delete this milestone because it is referenced by other records.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
                else
                {
                    lblError.Text = $"An error occurred while deleting the milestone: {e.Exception.Message}. Please try again.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = "No milestone was deleted. The milestone may have already been removed.";
                lblError.Visible = true;
            }
            else
            {
                lblError.Text = "Milestone deleted successfully!";
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
                    lblError.Text = "Cannot delete this milestone because it is referenced by other records.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
                else
                {
                    lblError.Text = $"An error occurred while deleting the milestone: {e.Exception.Message}. Please try again.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = "No milestone was deleted. The milestone may have already been removed.";
                lblError.Visible = true;
            }
            else
            {
                lblError.Text = "Milestone deleted successfully!";
                lblError.CssClass = "text-green-500 mb-4 block";
                lblError.Visible = true;
                GridView1.DataBind();
                FormView1.DataBind();
            }
        }
    }
}