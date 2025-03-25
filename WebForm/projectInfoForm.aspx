<%@ Page Language="C#" MasterPageFile="~/Layout/Site1.master" AutoEventWireup="true" CodeBehind="projectInfoForm.aspx.cs" Inherits="DataCoursework.projectInfoForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Project Informations</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-white rounded-lg shadow-md p-6">
        <h2 class="text-xl font-semibold text-teal-700 mb-6">Project Informations</h2>
        
        <!-- Error Message Label -->
        <asp:Label ID="lblError" runat="server" CssClass="text-red-500 mb-4 block" Visible="false"></asp:Label>

        <!-- Form View for Project Info Details -->
        <div class="mb-8 bg-gradient-to-r from-blue-50 to-teal-50 p-4 rounded-lg border border-teal-100">
            <h3 class="text-lg font-medium text-blue-700 mb-4">Project Informations</h3>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="PROJECT_ID,USER_ID" DataSourceID="SqlDataSourceFormView" 
                          CssClass="w-full max-w-lg" AllowPaging="False">
                <InsertItemTemplate>
                    <div class="grid grid-cols-1 gap-4">
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Project:</label>
                            <asp:DropDownList ID="PROJECT_IDDropDownList" runat="server" SelectedValue='<%# Bind("PROJECT_ID") %>'
                                             DataSourceID="SqlDataSourceProjects" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID"
                                             CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvProjectIDInsert" runat="server" ControlToValidate="PROJECT_IDDropDownList" 
                                                        ErrorMessage="Project is required." CssClass="text-red-500 text-sm ml-2" Display="Dynamic" InitialValue="" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">User:</label>
                            <asp:DropDownList ID="USER_IDDropDownList" runat="server" SelectedValue='<%# Bind("USER_ID") %>'
                                             DataSourceID="SqlDataSourceUsers" DataTextField="USER_NAME" DataValueField="USER_ID"
                                             CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvUserIDInsert" runat="server" ControlToValidate="USER_IDDropDownList" 
                                                        ErrorMessage="User is required." CssClass="text-red-500 text-sm ml-2" Display="Dynamic" InitialValue="" />
                        </div>
                        <div class="flex space-x-2 mt-4">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" 
                                          CssClass="bg-green-600 hover:bg-green-700 text-white py-2 px-4 rounded-md">
                                Insert
                            </asp:LinkButton>
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" 
                                          CssClass="bg-gray-300 hover:bg-gray-400 text-gray-800 py-2 px-4 rounded-md">
                                Cancel
                            </asp:LinkButton>
                        </div>
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    <div class="grid grid-cols-1 gap-2">
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Project:</label>
                            <asp:Label ID="PROJECT_IDLabel" runat="server" Text='<%# Eval("PROJECT_NAME") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">User:</label>
                            <asp:Label ID="USER_IDLabel" runat="server" Text='<%# Eval("USER_NAME") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex space-x-2 mt-4">
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" 
                                          CssClass="bg-red-600 hover:bg-red-700 text-white py-2 px-4 rounded-md"
                                          OnClientClick="return confirm('Are you sure you want to delete this project-user association?');">
                                Delete
                            </asp:LinkButton>
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" 
                                          CssClass="bg-green-600 hover:bg-green-700 text-white py-2 px-4 rounded-md">
                                New
                            </asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>
                <EmptyDataTemplate>
                    <p class="text-gray-600">No project-user association selected. Please select an association from the list below.</p>
                </EmptyDataTemplate>
            </asp:FormView>
        </div>
        
        <!-- Grid View for Project Info List -->
        <div>
            <h3 class="text-lg font-medium text-blue-700 mb-4">All Project-User Associations</h3>
            <div class="overflow-x-auto">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PROJECT_ID,USER_ID" 
                              DataSourceID="SqlDataSource1" CssClass="min-w-full bg-white border-collapse"
                              HeaderStyle-CssClass="bg-gradient-to-r from-teal-500 to-blue-500 text-white text-left"
                              RowStyle-CssClass="border-b hover:bg-blue-50" AlternatingRowStyle-CssClass="border-b bg-gray-50 hover:bg-blue-50"
                              CellPadding="8" GridLines="None" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle CssClass="border-b bg-gray-50 hover:bg-blue-50"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField DataField="PROJECT_ID" HeaderText="Project ID" ReadOnly="True" SortExpression="PROJECT_ID" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" >
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="PROJECT_NAME" HeaderText="Project Name" SortExpression="PROJECT_NAME" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" >
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="USER_ID" HeaderText="User ID" ReadOnly="True" SortExpression="USER_ID" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" >
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="USER_NAME" HeaderText="User Name" SortExpression="USER_NAME" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" >
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Action" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" ItemStyle-CssClass="p-4">
                            <ItemTemplate>
                                <asp:LinkButton ID="SelectButton" runat="server" CommandName="Select" Text="Select"
                                    CssClass="bg-green-500 hover:bg-green-600 text-white py-1 px-3 rounded-md text-sm mr-1">
                                </asp:LinkButton>
                                <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete"
                                    CssClass="bg-red-500 hover:bg-red-600 text-white py-1 px-3 rounded-md text-sm"
                                    OnClientClick="return confirm('Are you sure you want to delete this project-user association?');">
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="bg-gradient-to-r from-teal-500 to-blue-500 text-white text-left"></HeaderStyle>
                    <RowStyle CssClass="border-b hover:bg-blue-50"></RowStyle>
                </asp:GridView>
            </div>
        </div>
        
        <!-- SQL Data Source for GridView -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
            SelectCommand='SELECT P.PROJECT_ID, P.USER_ID, UP.PROJECT_NAME, U.USER_NAME FROM "PROJECT" P JOIN "USERPROJECT" UP ON P.PROJECT_ID = UP.PROJECT_ID JOIN "User" U ON P.USER_ID = U.USER_ID'
            DeleteCommand='DELETE FROM "PROJECT" WHERE PROJECT_ID = :PROJECT_ID AND USER_ID = :USER_ID'
            InsertCommand='INSERT INTO "PROJECT" (PROJECT_ID, USER_ID) VALUES (:PROJECT_ID, :USER_ID)'
            OnDeleted="SqlDataSource1_Deleted">
            <DeleteParameters>
                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                <asp:Parameter Name="USER_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                <asp:Parameter Name="USER_ID" Type="Decimal" />
            </InsertParameters>
        </asp:SqlDataSource>

        <!-- SQL Data Source for FormView -->
        <asp:SqlDataSource ID="SqlDataSourceFormView" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
            SelectCommand='SELECT P.PROJECT_ID, P.USER_ID, UP.PROJECT_NAME, U.USER_NAME FROM "PROJECT" P JOIN "USERPROJECT" UP ON P.PROJECT_ID = UP.PROJECT_ID JOIN "User" U ON P.USER_ID = U.USER_ID WHERE P.PROJECT_ID = :PROJECT_ID AND P.USER_ID = :USER_ID'
            DeleteCommand='DELETE FROM "PROJECT" WHERE PROJECT_ID = :PROJECT_ID AND USER_ID = :USER_ID'
            InsertCommand='INSERT INTO "PROJECT" (PROJECT_ID, USER_ID) VALUES (:PROJECT_ID, :USER_ID)'
            OnInserted="SqlDataSourceFormView_Inserted"
            OnDeleted="SqlDataSourceFormView_Deleted">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="PROJECT_ID" PropertyName="SelectedDataKey.Values[0]" Type="Decimal" />
                <asp:ControlParameter ControlID="GridView1" Name="USER_ID" PropertyName="SelectedDataKey.Values[1]" Type="Decimal" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                <asp:Parameter Name="USER_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                <asp:Parameter Name="USER_ID" Type="Decimal" />
            </InsertParameters>
        </asp:SqlDataSource>

        <!-- SQL Data Source for Projects DropDownList -->
        <asp:SqlDataSource ID="SqlDataSourceProjects" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
            SelectCommand='SELECT PROJECT_ID, PROJECT_NAME FROM "USERPROJECT"'>
        </asp:SqlDataSource>

        <!-- SQL Data Source for Users DropDownList -->
        <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
            SelectCommand='SELECT USER_ID, USER_NAME FROM "User"'>
        </asp:SqlDataSource>
    </div>
</asp:Content>