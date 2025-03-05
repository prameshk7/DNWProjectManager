<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectMilestoneCQ.aspx.cs" Inherits="DataCoursework.WebForm.ProjectMilestoneCQ" MasterPageFile="~/Layout/Site1.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Project Milestones</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-white shadow rounded-lg p-6">
        <h2 class="text-2xl font-semibold text-gray-800 mb-6">Project Milestones</h2>

        <!-- Project Dropdown Filter -->
        <div class="mb-4">
            <label for="ddlProjects" class="block text-sm font-medium text-gray-700">Select Project:</label>
            <asp:DropDownList ID="ddlProjects" runat="server" AutoPostBack="True" CssClass="mt-1 block w-1/4 p-2 border border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500" 
                DataSourceID="SqlDataSourceProjects" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID" />
            <asp:SqlDataSource ID="SqlDataSourceProjects" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT &quot;PROJECT_ID&quot;, &quot;PROJECT_NAME&quot; FROM &quot;PROJECT&quot; ORDER BY &quot;PROJECT_NAME&quot;" />
        </div>

        <!-- Project Details -->
        <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="SqlDataSourceProjectDetails" AutoGenerateRows="False" CssClass="w-full mb-6 border-collapse">
            <Fields>
                <asp:BoundField DataField="PROJECT_NAME" HeaderText="Project Name" ItemStyle-CssClass="border p-3" HeaderStyle-CssClass="bg-gray-100 border p-3 font-semibold w-1/4" />
                <asp:BoundField DataField="PROJECT_STATUS" HeaderText="Status" ItemStyle-CssClass="border p-3" HeaderStyle-CssClass="bg-gray-100 border p-3 font-semibold" />
                <asp:BoundField DataField="PROJECT_START_DATE" HeaderText="Start Date" ItemStyle-CssClass="border p-3" HeaderStyle-CssClass="bg-gray-100 border p-3 font-semibold" />
                <asp:BoundField DataField="PROJECT_DUE_DATE" HeaderText="Due Date" ItemStyle-CssClass="border p-3" HeaderStyle-CssClass="bg-gray-100 border p-3 font-semibold" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSourceProjectDetails" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT &quot;PROJECT_NAME&quot;, &quot;PROJECT_STATUS&quot;, &quot;PROJECT_START_DATE&quot;, &quot;PROJECT_DUE_DATE&quot; FROM &quot;PROJECT&quot; WHERE &quot;PROJECT_ID&quot; = :PROJECT_ID">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlProjects" Name="PROJECT_ID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <!-- Milestones Grid -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT m.&quot;MILESTONE_ID&quot;, p.&quot;PROJECT_ID&quot;, m.&quot;MILESTONE_NAME&quot;, m.&quot;MILESTONE_DUE_DATE&quot; FROM &quot;PROJECT&quot; p JOIN &quot;MILESTONE&quot; m ON p.&quot;PROJECT_ID&quot; = m.&quot;PROJECT_ID&quot; WHERE p.&quot;PROJECT_ID&quot; = :PROJECT_ID ORDER BY m.&quot;MILESTONE_DUE_DATE&quot;">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlProjects" Name="PROJECT_ID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MILESTONE_ID,PROJECT_ID" DataSourceID="SqlDataSource1" CssClass="w-full border-collapse" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="MILESTONE_ID" HeaderText="Milestone ID" SortExpression="MILESTONE_ID" ItemStyle-CssClass="border p-3" HeaderStyle-CssClass="bg-gray-100 border p-3 font-semibold" />
                <asp:BoundField DataField="PROJECT_ID" HeaderText="Project ID" SortExpression="PROJECT_ID" ItemStyle-CssClass="border p-3" HeaderStyle-CssClass="bg-gray-100 border p-3 font-semibold" />
                <asp:BoundField DataField="MILESTONE_NAME" HeaderText="Milestone Name" SortExpression="MILESTONE_NAME" ItemStyle-CssClass="border p-3" HeaderStyle-CssClass="bg-gray-100 border p-3 font-semibold" />
                <asp:BoundField DataField="MILESTONE_DUE_DATE" HeaderText="Due Date" SortExpression="MILESTONE_DUE_DATE" ItemStyle-CssClass="border p-3" HeaderStyle-CssClass="bg-gray-100 border p-3 font-semibold" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>