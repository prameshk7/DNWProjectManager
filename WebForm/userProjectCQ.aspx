<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userProjectCQ.aspx.cs" Inherits="DataCoursework.WebForm.userProjectCQ" MasterPageFile="~/Layout/Site1.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>User Projects</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-white shadow rounded-lg p-6">
        <h2 class="text-2xl font-semibold text-gray-800 mb-6">User Projects</h2>

        <!-- User Dropdown Filter -->
        <div class="mb-4">
            <label for="ddlUsers" class="block text-sm font-medium text-gray-700">Select User:</label>
            <asp:DropDownList ID="ddlUsers" runat="server" AutoPostBack="True" CssClass="mt-1 block w-1/4 p-2 border border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500" 
                DataSourceID="SqlDataSourceUsers" DataTextField="USER_NAME" DataValueField="USER_ID" />
            <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT &quot;USER_ID&quot;, &quot;USER_NAME&quot; FROM &quot;User&quot; ORDER BY &quot;USER_NAME&quot;" />
        </div>

        <!-- User Projects Grid -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT u.&quot;USER_ID&quot;, u.&quot;USER_NAME&quot;, u.&quot;USER_EMAIL&quot;, u.&quot;CONTACT&quot;, u.&quot;USER_TYPE&quot;, p.&quot;PROJECT_ID&quot;, p.&quot;PROJECT_NAME&quot;, p.&quot;PROJECT_STATUS&quot;, p.&quot;PROJECT_START_DATE&quot;, p.&quot;PROJECT_DUE_DATE&quot; FROM &quot;User&quot; u JOIN &quot;PROJECT&quot; p ON u.&quot;USER_ID&quot; = p.&quot;USER_ID&quot; WHERE u.&quot;USER_ID&quot; = :USER_ID ORDER BY p.&quot;PROJECT_START_DATE&quot; DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlUsers" Name="USER_ID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USER_ID,PROJECT_ID" DataSourceID="SqlDataSource1" CssClass="w-full border-collapse" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="USER_ID" HeaderText="User ID" SortExpression="USER_ID" ItemStyle-CssClass="border p-3" HeaderStyle-CssClass="bg-gray-100 border p-3 font-semibold" />
                <asp:BoundField DataField="USER_NAME" HeaderText="User Name" SortExpression="USER_NAME" ItemStyle-CssClass="border p-3" HeaderStyle-CssClass="bg-gray-100 border p-3 font-semibold" />
                <asp:BoundField DataField="USER_EMAIL" HeaderText="Email" SortExpression="USER_EMAIL" ItemStyle-CssClass="border p-3" HeaderStyle-CssClass="bg-gray-100 border p-3 font-semibold" />
                <asp:BoundField DataField="CONTACT" HeaderText="Contact" SortExpression="CONTACT" ItemStyle-CssClass="border p-3" HeaderStyle-CssClass="bg-gray-100 border p-3 font-semibold" />
                <asp:BoundField DataField="USER_TYPE" HeaderText="User Type" SortExpression="USER_TYPE" ItemStyle-CssClass="border p-3" HeaderStyle-CssClass="bg-gray-100 border p-3 font-semibold" />
                <asp:BoundField DataField="PROJECT_ID" HeaderText="Project ID" SortExpression="PROJECT_ID" ItemStyle-CssClass="border p-3" HeaderStyle-CssClass="bg-gray-100 border p-3 font-semibold" />
                <asp:BoundField DataField="PROJECT_NAME" HeaderText="Project Name" SortExpression="PROJECT_NAME" ItemStyle-CssClass="border p-3" HeaderStyle-CssClass="bg-gray-100 border p-3 font-semibold" />
                <asp:BoundField DataField="PROJECT_STATUS" HeaderText="Status" SortExpression="PROJECT_STATUS" ItemStyle-CssClass="border p-3" HeaderStyle-CssClass="bg-gray-100 border p-3 font-semibold" />
                <asp:BoundField DataField="PROJECT_START_DATE" HeaderText="Start Date" SortExpression="PROJECT_START_DATE" ItemStyle-CssClass="border p-3" HeaderStyle-CssClass="bg-gray-100 border p-3 font-semibold" />
                <asp:BoundField DataField="PROJECT_DUE_DATE" HeaderText="Due Date" SortExpression="PROJECT_DUE_DATE" ItemStyle-CssClass="border p-3" HeaderStyle-CssClass="bg-gray-100 border p-3 font-semibold" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>