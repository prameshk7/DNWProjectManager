<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectMilestoneCQ.aspx.cs" Inherits="DataCoursework.WebForm.ProjectMilestoneCQ" MasterPageFile="~/Layout/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Project Milestones</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-white rounded-lg shadow-md p-6">
        <h2 class="text-xl font-semibold text-teal-700 mb-6">Project Milestones</h2>

        <!-- Project Dropdown Filter -->
        <div class="mb-6">
            <label for="ddlProjects" class="block text-sm font-medium text-gray-700 mb-2">Select Project:</label>
            <asp:DropDownList ID="ddlProjects" runat="server" AutoPostBack="True" 
                CssClass="mt-1 block w-1/4 p-2 border border-gray-300 rounded-md shadow-sm focus:ring-teal-500 focus:border-teal-500" 
                DataSourceID="SqlDataSourceProjects" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID" 
                OnSelectedIndexChanged="ddlProjects_SelectedIndexChanged">
                <asp:ListItem Text="-- Select a Project --" Value="" />
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceProjects" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
                ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
                SelectCommand='SELECT PROJECT_ID, PROJECT_NAME FROM USERPROJECT ORDER BY PROJECT_NAME' />
        </div>

        <!-- Project Details -->
        <div class="mb-8 bg-gradient-to-r from-blue-50 to-teal-50 p-4 rounded-lg border border-teal-100">
            <h3 class="text-lg font-medium text-blue-700 mb-4">Project Details</h3>
            <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="SqlDataSourceProjectDetails" AutoGenerateRows="False" 
                CssClass="w-full max-w-lg border-collapse">
                <Fields>
                    <asp:BoundField DataField="PROJECT_ID" HeaderText="Project ID" ItemStyle-CssClass="p-3" HeaderStyle-CssClass="bg-gray-50 p-3 font-semibold text-gray-700 w-1/4" />
                    <asp:BoundField DataField="PROJECT_NAME" HeaderText="Project Name" ItemStyle-CssClass="p-3" HeaderStyle-CssClass="bg-gray-50 p-3 font-semibold text-gray-700" />
                    <asp:BoundField DataField="PROJECT_STATUS" HeaderText="Status" ItemStyle-CssClass="p-3" HeaderStyle-CssClass="bg-gray-50 p-3 font-semibold text-gray-700" />
                    <asp:BoundField DataField="PROJECT_START_DATE" HeaderText="Start Date" ItemStyle-CssClass="p-3" HeaderStyle-CssClass="bg-gray-50 p-3 font-semibold text-gray-700" />
                    <asp:BoundField DataField="PROJECT_DUE_DATE" HeaderText="Due Date" ItemStyle-CssClass="p-3" HeaderStyle-CssClass="bg-gray-50 p-3 font-semibold text-gray-700" />
                </Fields>
                <EmptyDataTemplate>
                    <p class="text-gray-600">No project details available.</p>
                </EmptyDataTemplate>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSourceProjectDetails" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
                ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
                SelectCommand='SELECT PROJECT_ID, PROJECT_NAME, PROJECT_STATUS, PROJECT_START_DATE, PROJECT_DUE_DATE 
                               FROM USERPROJECT 
                               WHERE PROJECT_ID = :PROJECT_ID'>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlProjects" Name="PROJECT_ID" PropertyName="SelectedValue" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

        <!-- Milestones Grid -->
        <div>
            <h3 class="text-lg font-medium text-blue-700 mb-4">Project Milestones</h3>
            <div class="overflow-x-auto">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MILESTONE_ID,PROJECT_ID" 
                              DataSourceID="SqlDataSource1" CssClass="min-w-full bg-white border-collapse"
                              HeaderStyle-CssClass="bg-gradient-to-r from-teal-500 to-blue-500 text-white text-left"
                              RowStyle-CssClass="border-b hover:bg-blue-50" AlternatingRowStyle-CssClass="border-b bg-gray-50 hover:bg-blue-50"
                              CellPadding="8" GridLines="None" AllowSorting="True">
                    <AlternatingRowStyle CssClass="border-b bg-gray-50 hover:bg-blue-50"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField DataField="MILESTONE_ID" HeaderText="Milestone ID" SortExpression="MILESTONE_ID" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" >
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="PROJECT_ID" HeaderText="Project ID" SortExpression="PROJECT_ID" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" >
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="MILESTONE_NAME" HeaderText="Milestone Name" SortExpression="MILESTONE_NAME" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" >
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="MILESTONE_DUE_DATE" HeaderText="Due Date" SortExpression="MILESTONE_DUE_DATE" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" >
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                    <HeaderStyle CssClass="bg-gradient-to-r from-teal-500 to-blue-500 text-white text-left"></HeaderStyle>
                    <RowStyle CssClass="border-b hover:bg-blue-50"></RowStyle>
                </asp:GridView>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
                SelectCommand='SELECT m.MILESTONE_ID, m.PROJECT_ID, m.MILESTONE_NAME, m.MILESTONE_DUE_DATE 
                               FROM USERPROJECT up 
                               JOIN MILESTONE m ON up.PROJECT_ID = m.PROJECT_ID 
                               WHERE up.PROJECT_ID = :PROJECT_ID 
                               ORDER BY m.MILESTONE_DUE_DATE'>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlProjects" Name="PROJECT_ID" PropertyName="SelectedValue" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>