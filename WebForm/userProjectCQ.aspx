<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userProjectCQ.aspx.cs" Inherits="DataCoursework.WebForm.userProjectCQ" MasterPageFile="~/Layout/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>User Projects</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-white rounded-lg shadow-md p-6">
        <h2 class="text-xl font-semibold text-teal-700 mb-6">User Projects</h2>

        <!-- User Dropdown Filter -->
        <div class="mb-6">
            <label for="ddlUsers" class="block text-sm font-medium text-gray-700 mb-2">Select User:</label>
            <asp:DropDownList ID="ddlUsers" runat="server" AutoPostBack="True" 
                CssClass="mt-1 block w-1/4 p-2 border border-gray-300 rounded-md shadow-sm focus:ring-teal-500 focus:border-teal-500" 
                DataSourceID="SqlDataSourceUsers" DataTextField="USER_NAME" DataValueField="USER_ID" 
                OnSelectedIndexChanged="ddlUsers_SelectedIndexChanged">
                <asp:ListItem Text="-- Select a User --" Value="" />
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
                ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
                SelectCommand='SELECT USER_ID, USER_NAME FROM "User" ORDER BY USER_NAME' />
        </div>

        <!-- User Details Section -->
        <div class="mb-8 bg-gradient-to-r from-blue-50 to-teal-50 p-4 rounded-lg border border-teal-100">
            <h3 class="text-lg font-medium text-blue-700 mb-4">User Details</h3>
            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSourceUserDetails" CssClass="w-full max-w-lg">
                <ItemTemplate>
                    <div class="grid grid-cols-1 gap-2">
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">User ID:</label>
                            <asp:Label ID="USER_IDLabel" runat="server" Text='<%# Eval("USER_ID") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Name:</label>
                            <asp:Label ID="USER_NAMELabel" runat="server" Text='<%# Eval("USER_NAME") %>' CssClass="text-gray-900" />
                        </div>
                    </div>
                </ItemTemplate>
                <EmptyDataTemplate>
                    <p class="text-gray-600">No user details available.</p>
                </EmptyDataTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSourceUserDetails" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
                ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
                SelectCommand='SELECT USER_ID, USER_NAME FROM "User" WHERE USER_ID = :USER_ID'>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlUsers" Name="USER_ID" PropertyName="SelectedValue" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

        <!-- User Projects Grid -->
        <div>
            <h3 class="text-lg font-medium text-blue-700 mb-4">Associated Projects</h3>
            <div class="overflow-x-auto">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USER_ID,PROJECT_ID" 
                              DataSourceID="SqlDataSource1" CssClass="min-w-full bg-white border-collapse"
                              HeaderStyle-CssClass="bg-gradient-to-r from-teal-500 to-blue-500 text-white text-left"
                              RowStyle-CssClass="border-b hover:bg-blue-50" AlternatingRowStyle-CssClass="border-b bg-gray-50 hover:bg-blue-50"
                              CellPadding="8" GridLines="None" AllowSorting="True">
                    <AlternatingRowStyle CssClass="border-b bg-gray-50 hover:bg-blue-50"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField DataField="USER_ID" HeaderText="User ID" SortExpression="USER_ID" ReadOnly="True" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" >
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="USER_NAME" HeaderText="User Name" SortExpression="USER_NAME" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" >
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="PROJECT_ID" HeaderText="Project ID" SortExpression="PROJECT_ID" ReadOnly="True" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" >
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="PROJECT_NAME" HeaderText="Project Name" SortExpression="PROJECT_NAME" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" >
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="PROJECT_STATUS" HeaderText="Status" SortExpression="PROJECT_STATUS" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" >
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="PROJECT_START_DATE" HeaderText="Start Date" SortExpression="PROJECT_START_DATE" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" >
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="PROJECT_DUE_DATE" HeaderText="Due Date" SortExpression="PROJECT_DUE_DATE" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" >
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
                SelectCommand='SELECT u.USER_ID, u.USER_NAME, p.PROJECT_ID, up.PROJECT_NAME, up.PROJECT_STATUS, up.PROJECT_START_DATE, up.PROJECT_DUE_DATE 
                               FROM "User" u 
                               JOIN PROJECT p ON u.USER_ID = p.USER_ID 
                               JOIN USERPROJECT up ON p.PROJECT_ID = up.PROJECT_ID 
                               WHERE u.USER_ID = :USER_ID 
                               ORDER BY up.PROJECT_START_DATE DESC'>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlUsers" Name="USER_ID" PropertyName="SelectedValue" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>