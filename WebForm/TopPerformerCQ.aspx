<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TopPerformerCQ.aspx.cs" Inherits="DataCoursework.WebForm.TopPerformerCQ" MasterPageFile="~/Layout/Site1.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Top Performers</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-white shadow rounded-lg p-6">
        <h2 class="text-2xl font-semibold text-gray-800 mb-6">Top Performers</h2>
        
        <!-- Project Dropdown Filter -->
        <div class="mb-4">
            <label for="ddlProjects" class="block text-sm font-medium text-gray-700">Filter by Project:</label>
            <asp:DropDownList ID="ddlProjects" runat="server" AutoPostBack="True" CssClass="mt-1 block w-1/4 p-2 border border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500" 
                DataSourceID="SqlDataSourceProjects" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID" AppendDataBoundItems="true" 
                OnSelectedIndexChanged="ddlProjects_SelectedIndexChanged">
                <asp:ListItem Text="All Projects" Value="" Selected="True" />
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceProjects" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                ProviderName="Oracle.ManagedDataAccess.Client"
                SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;USERPROJECT&quot; ORDER BY &quot;PROJECT_NAME&quot;" />
        </div>

        <!-- SqlDataSource for All Projects -->
        <asp:SqlDataSource ID="SqlDataSourceAllProjects" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="Oracle.ManagedDataAccess.Client"
            SelectCommand="
                SELECT *
                FROM (
                    SELECT u.&quot;USER_ID&quot;, u.&quot;USER_NAME&quot;, COUNT(ut.&quot;TASK_ID&quot;) AS &quot;COMPLETED_TASKS&quot;
                    FROM &quot;User&quot; u
                    JOIN &quot;TASK&quot; t ON u.&quot;USER_ID&quot; = t.&quot;USER_ID&quot;
                    JOIN &quot;USERTASK&quot; ut ON t.&quot;TASK_ID&quot; = ut.&quot;TASK_ID&quot;
                    WHERE ut.&quot;TASK_STATUS&quot; = 'Completed'
                    GROUP BY u.&quot;USER_ID&quot;, u.&quot;USER_NAME&quot;
                    ORDER BY &quot;COMPLETED_TASKS&quot; DESC
                )
                WHERE ROWNUM <= 3" />

        <!-- SqlDataSource for Specific Project -->
        <asp:SqlDataSource ID="SqlDataSourceSpecificProject" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="Oracle.ManagedDataAccess.Client"
            SelectCommand="
                SELECT *
                FROM (
                    SELECT u.&quot;USER_ID&quot;, u.&quot;USER_NAME&quot;, COUNT(ut.&quot;TASK_ID&quot;) AS &quot;COMPLETED_TASKS&quot;
                    FROM &quot;User&quot; u
                    JOIN &quot;PROJECT&quot; p ON u.&quot;USER_ID&quot; = p.&quot;USER_ID&quot;
                    JOIN &quot;USERPROJECT&quot; up ON p.&quot;PROJECT_ID&quot; = up.&quot;PROJECT_ID&quot;
                    JOIN &quot;USERTASK&quot; ut ON up.&quot;PROJECT_ID&quot; = ut.&quot;PROJECT_ID&quot;
                    JOIN &quot;TASK&quot; t ON ut.&quot;TASK_ID&quot; = t.&quot;TASK_ID&quot; AND t.&quot;USER_ID&quot; = u.&quot;USER_ID&quot;
                    WHERE ut.&quot;TASK_STATUS&quot; = 'Completed'
                    AND up.&quot;PROJECT_ID&quot; = :PROJECT_ID
                    GROUP BY u.&quot;USER_ID&quot;, u.&quot;USER_NAME&quot;
                    ORDER BY &quot;COMPLETED_TASKS&quot; DESC
                )
                WHERE ROWNUM <= 3">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlProjects" Name="PROJECT_ID" PropertyName="SelectedValue" Type="String" DefaultValue="" />
            </SelectParameters>
        </asp:SqlDataSource>

        <!-- Top Performers Grid -->
        <asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" CssClass="w-full border-collapse" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="USER_ID" HeaderText="User ID" SortExpression="USER_ID" ItemStyle-CssClass="border p-3" HeaderStyle-CssClass="bg-gray-100 border p-3 font-semibold" />
                <asp:BoundField DataField="USER_NAME" HeaderText="User Name" SortExpression="USER_NAME" ItemStyle-CssClass="border p-3" HeaderStyle-CssClass="bg-gray-100 border p-3 font-semibold" />
                <asp:BoundField DataField="COMPLETED_TASKS" HeaderText="Completed Tasks" SortExpression="COMPLETED_TASKS" ItemStyle-CssClass="border p-3" HeaderStyle-CssClass="bg-gray-100 border p-3 font-semibold" />
            </Columns>
            <EmptyDataTemplate>
                <div class="text-center p-4 text-gray-500">No data available for the selected project.</div>
            </EmptyDataTemplate>
        </asp:GridView>
    </div>
</asp:Content>