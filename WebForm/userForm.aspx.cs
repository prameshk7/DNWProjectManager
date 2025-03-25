using System;
using System.Web.UI.WebControls;

namespace DataCoursework
{
    public partial class userForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void DataSourceCW_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            FormView2.DataBind();
        }

        protected void SqlDataSourceFormView_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                if (e.Exception.Message.Contains("ORA-00001"))
                {
                    lblError.Text = "User ID already exists. Please choose a different User ID.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
                else
                {
                    lblError.Text = "An error occurred while adding the user. Please try again.";
                    lblError.Visible = true;
                    e.ExceptionHandled = true;
                }
            }
            else
            {
                lblError.Text = "User added successfully!";
                lblError.CssClass = "text-green-500 mb-4 block";
                lblError.Visible = true;
                FormView2.ChangeMode(FormViewMode.Insert);
                GridView1.DataBind();
            }
        }
    }
}