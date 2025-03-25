<%@ Page Language="C#" MasterPageFile="~/Layout/Site1.master" AutoEventWireup="true" CodeBehind="milestoneForm.aspx.cs" Inherits="DataCoursework.milestoneForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Milestone Management</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-white rounded-lg shadow-md p-6">
        <h2 class="text-xl font-semibold text-teal-700 mb-6">Milestone Management</h2>
        
        <!-- Error Message Label -->
        <asp:Label ID="lblError" runat="server" CssClass="text-red-500 mb-4 block" Visible="false"></asp:Label>

        <!-- Form View for Milestone Details -->
        <div class="mb-8 bg-gradient-to-r from-blue-50 to-teal-50 p-4 rounded-lg border border-teal-100">
            <h3 class="text-lg font-medium text-blue-700 mb-4">Milestone Details</h3>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="MILESTONE_ID" DataSourceID="SqlDataSourceFormView" 
                          CssClass="w-full max-w-lg" AllowPaging="False">
                <EditItemTemplate>
                    <div class="grid grid-cols-1 gap-4">
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Milestone ID:</label>
                            <asp:Label ID="MILESTONE_IDLabel1" runat="server" Text='<%# Eval("MILESTONE_ID") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Name:</label>
                            <asp:TextBox ID="MILESTONE_NAMETextBox" runat="server" Text='<%# Bind("MILESTONE_NAME") %>' 
                                        CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                            <asp:RequiredFieldValidator ID="rfvMilestoneNameEdit" runat="server" ControlToValidate="MILESTONE_NAMETextBox" 
                                                        ErrorMessage="Milestone Name is required." CssClass="text-red-500 text-sm ml-2" Display="Dynamic" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Due Date:</label>
                            <asp:TextBox ID="MILESTONE_DUE_DATETextBox" runat="server" Text='<%# Bind("MILESTONE_DUE_DATE", "{0:yyyy-MM-ddTHH:mm}") %>'
                                        TextMode="DateTimeLocal" CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                            <asp:RequiredFieldValidator ID="rfvDueDateEdit" runat="server" ControlToValidate="MILESTONE_DUE_DATETextBox" 
                                                        ErrorMessage="Due Date is required." CssClass="text-red-500 text-sm ml-2" Display="Dynamic" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Project:</label>
                            <asp:DropDownList ID="PROJECT_IDDropDownList" runat="server" SelectedValue='<%# Bind("PROJECT_ID") %>'
                                             DataSourceID="SqlDataSourceProjects" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID"
                                             CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvProjectIDEdit" runat="server" ControlToValidate="PROJECT_IDDropDownList" 
                                                        ErrorMessage="Project is required." CssClass="text-red-500 text-sm ml-2" Display="Dynamic" InitialValue="" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">User:</label>
                            <asp:DropDownList ID="USER_IDDropDownList" runat="server" SelectedValue='<%# Bind("USER_ID") %>'
                                             DataSourceID="SqlDataSourceUsers" DataTextField="USER_NAME" DataValueField="USER_ID"
                                             CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvUserIDEdit" runat="server" ControlToValidate="USER_IDDropDownList" 
                                                        ErrorMessage="User is required." CssClass="text-red-500 text-sm ml-2" Display="Dynamic" InitialValue="" />
                        </div>
                        <div class="flex space-x-2 mt-4">
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" 
                                          CssClass="bg-green-600 hover:bg-green-700 text-white py-2 px-4 rounded-md">
                                Update
                            </asp:LinkButton>
                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" 
                                          CssClass="bg-gray-300 hover:bg-gray-400 text-gray-800 py-2 px-4 rounded-md">
                                Cancel
                            </asp:LinkButton>
                        </div>
                    </div>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div class="grid grid-cols-1 gap-4">
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Milestone ID:</label>
                            <asp:TextBox ID="MILESTONE_IDTextBox" runat="server" Text='<%# Bind("MILESTONE_ID") %>' 
                                        CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                            <asp:RequiredFieldValidator ID="rfvMilestoneIDInsert" runat="server" ControlToValidate="MILESTONE_IDTextBox" 
                                                        ErrorMessage="Milestone ID is required." CssClass="text-red-500 text-sm ml-2" Display="Dynamic" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Name:</label>
                            <asp:TextBox ID="MILESTONE_NAMETextBox" runat="server" Text='<%# Bind("MILESTONE_NAME") %>' 
                                        CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                            <asp:RequiredFieldValidator ID="rfvMilestoneNameInsert" runat="server" ControlToValidate="MILESTONE_NAMETextBox" 
                                                        ErrorMessage="Milestone Name is required." CssClass="text-red-500 text-sm ml-2" Display="Dynamic" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Due Date:</label>
                            <asp:TextBox ID="MILESTONE_DUE_DATETextBox" runat="server" Text='<%# Bind("MILESTONE_DUE_DATE", "{0:yyyy-MM-ddTHH:mm}") %>'
                                        TextMode="DateTimeLocal" CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                            <asp:RequiredFieldValidator ID="rfvDueDateInsert" runat="server" ControlToValidate="MILESTONE_DUE_DATETextBox" 
                                                        ErrorMessage="Due Date is required." CssClass="text-red-500 text-sm ml-2" Display="Dynamic" />
                        </div>
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
                            <label class="w-32 font-medium text-gray-700">Milestone ID:</label>
                            <asp:Label ID="MILESTONE_IDLabel" runat="server" Text='<%# Eval("MILESTONE_ID") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Name:</label>
                            <asp:Label ID="MILESTONE_NAMELabel" runat="server" Text='<%# Bind("MILESTONE_NAME") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Due Date:</label>
                            <asp:Label ID="MILESTONE_DUE_DATELabel" runat="server" Text='<%# Bind("MILESTONE_DUE_DATE") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Project:</label>
                            <asp:Label ID="PROJECT_IDLabel" runat="server" Text='<%# Eval("PROJECT_NAME") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">User:</label>
                            <asp:Label ID="USER_IDLabel" runat="server" Text='<%# Eval("USER_NAME") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex space-x-2 mt-4">
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" 
                                          CssClass="bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded-md">
                                Edit
                            </asp:LinkButton>
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" 
                                          CssClass="bg-red-600 hover:bg-red-700 text-white py-2 px-4 rounded-md"
                                          OnClientClick="return confirm('Are you sure you want to delete this milestone?');">
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
                    <p class="text-gray-600">No milestone selected. Please select a milestone from the list below.</p>
                </EmptyDataTemplate>
            </asp:FormView>
        </div>
        
        <!-- Grid View for Milestone List -->
        <div>
            <h3 class="text-lg font-medium text-blue-700 mb-4">All Milestones</h3>
            <div class="overflow-x-auto">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MILESTONE_ID" 
                              DataSourceID="SqlDataSource1" CssClass="min-w-full bg-white border-collapse"
                              HeaderStyle-CssClass="bg-gradient-to-r from-teal-500 to-blue-500 text-white text-left"
                              RowStyle-CssClass="border-b hover:bg-blue-50" AlternatingRowStyle-CssClass="border-b bg-gray-50 hover:bg-blue-50"
                              CellPadding="8" GridLines="None" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle CssClass="border-b bg-gray-50 hover:bg-blue-50"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField DataField="MILESTONE_ID" HeaderText="ID" ReadOnly="True" SortExpression="MILESTONE_ID" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" >
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="MILESTONE_NAME" HeaderText="Name" SortExpression="MILESTONE_NAME" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" >
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Due Date" SortExpression="MILESTONE_DUE_DATE" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700">
                            <ItemTemplate>
                                <asp:Label ID="MILESTONE_DUE_DATELabel" runat="server" Text='<%# Eval("MILESTONE_DUE_DATE") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="MILESTONE_DUE_DATETextBox" runat="server" Text='<%# Bind("MILESTONE_DUE_DATE", "{0:yyyy-MM-ddTHH:mm}") %>'
                                             TextMode="DateTimeLocal" CssClass="border rounded-md p-2 w-full focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                            </EditItemTemplate>
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Project" SortExpression="PROJECT_ID" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700">
                            <ItemTemplate>
                                <asp:Label ID="PROJECT_IDLabel" runat="server" Text='<%# Eval("PROJECT_NAME") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="PROJECT_IDDropDownList" runat="server" SelectedValue='<%# Bind("PROJECT_ID") %>'
                                                 DataSourceID="SqlDataSourceProjects" DataTextField="PROJECT_NAME" DataValueField="PROJECT_ID"
                                                 CssClass="border rounded-md p-2 w-full focus:ring-2 focus:ring-teal-300 focus:border-teal-500">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User" SortExpression="USER_ID" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700">
                            <ItemTemplate>
                                <asp:Label ID="USER_IDLabel" runat="server" Text='<%# Eval("USER_NAME") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="USER_IDDropDownList" runat="server" SelectedValue='<%# Bind("USER_ID") %>'
                                                 DataSourceID="SqlDataSourceUsers" DataTextField="USER_NAME" DataValueField="USER_ID"
                                                 CssClass="border rounded-md p-2 w-full focus:ring-2 focus:ring-teal-300 focus:border-teal-500">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" ItemStyle-CssClass="p-4">
                            <ItemTemplate>
                                <asp:LinkButton ID="SelectButton" runat="server" CommandName="Select" Text="Select"
                                    CssClass="bg-green-500 hover:bg-green-600 text-white py-1 px-3 rounded-md text-sm mr-1">
                                </asp:LinkButton>
                                <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="Edit"
                                    CssClass="bg-blue-500 hover:bg-blue-600 text-white py-1 px-3 rounded-md text-sm mr-1">
                                </asp:LinkButton>
                                <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete"
                                    CssClass="bg-red-500 hover:bg-red-600 text-white py-1 px-3 rounded-md text-sm"
                                    OnClientClick="return confirm('Are you sure you want to delete this milestone?');">
                                </asp:LinkButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" Text="Update"
                                    CssClass="bg-green-500 hover:bg-green-600 text-white py-1 px-3 rounded-md text-sm mr-1">
                                </asp:LinkButton>
                                <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel"
                                    CssClass="bg-gray-500 hover:bg-gray-600 text-white py-1 px-3 rounded-md text-sm">
                                </asp:LinkButton>
                            </EditItemTemplate>
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
            SelectCommand='SELECT M.MILESTONE_ID, M.MILESTONE_NAME, M.MILESTONE_DUE_DATE, M.PROJECT_ID, M.USER_ID, UP.PROJECT_NAME, U.USER_NAME FROM "MILESTONE" M JOIN "USERPROJECT" UP ON M.PROJECT_ID = UP.PROJECT_ID JOIN "User" U ON M.USER_ID = U.USER_ID'
            DeleteCommand='DELETE FROM "MILESTONE" WHERE MILESTONE_ID = :MILESTONE_ID'
            InsertCommand='INSERT INTO "MILESTONE" (MILESTONE_ID, MILESTONE_NAME, MILESTONE_DUE_DATE, PROJECT_ID, USER_ID) VALUES (:MILESTONE_ID, :MILESTONE_NAME, :MILESTONE_DUE_DATE, :PROJECT_ID, :USER_ID)'
            UpdateCommand='UPDATE "MILESTONE" SET MILESTONE_NAME = :MILESTONE_NAME, MILESTONE_DUE_DATE = :MILESTONE_DUE_DATE, PROJECT_ID = :PROJECT_ID, USER_ID = :USER_ID WHERE MILESTONE_ID = :MILESTONE_ID'
            OnDeleted="SqlDataSource1_Deleted">
            <DeleteParameters>
                <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
                <asp:Parameter Name="MILESTONE_NAME" Type="String" />
                <asp:Parameter Name="MILESTONE_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                <asp:Parameter Name="USER_ID" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="MILESTONE_NAME" Type="String" />
                <asp:Parameter Name="MILESTONE_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                <asp:Parameter Name="USER_ID" Type="Decimal" />
                <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <!-- SQL Data Source for FormView -->
        <asp:SqlDataSource ID="SqlDataSourceFormView" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
            SelectCommand='SELECT M.MILESTONE_ID, M.MILESTONE_NAME, M.MILESTONE_DUE_DATE, M.PROJECT_ID, M.USER_ID, UP.PROJECT_NAME, U.USER_NAME FROM "MILESTONE" M JOIN "USERPROJECT" UP ON M.PROJECT_ID = UP.PROJECT_ID JOIN "User" U ON M.USER_ID = U.USER_ID WHERE M.MILESTONE_ID = :MILESTONE_ID'
            DeleteCommand='DELETE FROM "MILESTONE" WHERE MILESTONE_ID = :MILESTONE_ID'
            InsertCommand='INSERT INTO "MILESTONE" (MILESTONE_ID, MILESTONE_NAME, MILESTONE_DUE_DATE, PROJECT_ID, USER_ID) VALUES (:MILESTONE_ID, :MILESTONE_NAME, :MILESTONE_DUE_DATE, :PROJECT_ID, :USER_ID)'
            UpdateCommand='UPDATE "MILESTONE" SET MILESTONE_NAME = :MILESTONE_NAME, MILESTONE_DUE_DATE = :MILESTONE_DUE_DATE, PROJECT_ID = :PROJECT_ID, USER_ID = :USER_ID WHERE MILESTONE_ID = :MILESTONE_ID'
            OnDeleted="SqlDataSourceFormView_Deleted"
            OnInserted="SqlDataSourceFormView_Inserted"
            OnUpdated="SqlDataSourceFormView_Updated">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="MILESTONE_ID" PropertyName="SelectedValue" Type="Decimal" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
                <asp:Parameter Name="MILESTONE_NAME" Type="String" />
                <asp:Parameter Name="MILESTONE_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                <asp:Parameter Name="USER_ID" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="MILESTONE_NAME" Type="String" />
                <asp:Parameter Name="MILESTONE_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                <asp:Parameter Name="USER_ID" Type="Decimal" />
                <asp:Parameter Name="MILESTONE_ID" Type="Decimal" />
            </UpdateParameters>
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