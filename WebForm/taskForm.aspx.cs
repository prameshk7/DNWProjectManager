using System;
using System.Web.UI.WebControls;

namespace DataCoursework
{
    public partial class taskForm : System.Web.UI.Page
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

        protected void SqlDataSourceFormView_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {

            }
            else
            {

                GridView1.DataBind();
                FormView2.DataBind();
            }
        }

        protected void SqlDataSource1_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {

                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {

            }
            else
            {

                GridView1.DataBind();
                FormView2.DataBind();
            }
        }
    }
}