<%@ Page Language="C#" MasterPageFile="~/Layout/Site1.master" AutoEventWireup="true" CodeBehind="projectForm.aspx.cs" Inherits="DataCoursework.projectForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Project Management</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-white rounded-lg shadow-md p-6">
        <h2 class="text-xl font-semibold text-teal-700 mb-6">Project Management</h2>
        
        <!-- Form View for Project Details -->
        <div class="mb-8 bg-gradient-to-r from-blue-50 to-teal-50 p-4 rounded-lg border border-teal-100">
            <h3 class="text-lg font-medium text-blue-700 mb-4">Project Details</h3>
            <asp:FormView ID="FormView2" runat="server" DataKeyNames="PROJECT_ID" DataSourceID="SqlDataSourceFormView" 
                          CssClass="w-full max-w-lg">
                <EditItemTemplate>
                    <div class="grid grid-cols-1 gap-4">
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Project ID:</label>
                            <asp:Label ID="PROJECT_IDLabel1" runat="server" Text='<%# Eval("PROJECT_ID") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Name:</label>
                            <asp:TextBox ID="PROJECT_NAMETextBox" runat="server" Text='<%# Bind("PROJECT_NAME") %>' 
                                        CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Status:</label>
                            <asp:DropDownList ID="PROJECT_STATUSDropDownList" runat="server" SelectedValue='<%# Bind("PROJECT_STATUS") %>'
                                             CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500">
                                <asp:ListItem Text="Not Started" Value="Not Started"></asp:ListItem>
                                <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Start Date:</label>
                            <asp:TextBox ID="PROJECT_START_DATETextBox" runat="server" Text='<%# Bind("PROJECT_START_DATE", "{0:yyyy-MM-ddTHH:mm}") %>'
                                        TextMode="DateTimeLocal" CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Due Date:</label>
                            <asp:TextBox ID="PROJECT_DUE_DATETextBox" runat="server" Text='<%# Bind("PROJECT_DUE_DATE", "{0:yyyy-MM-ddTHH:mm}") %>'
                                        TextMode="DateTimeLocal" CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">User ID:</label>
                            <asp:TextBox ID="USER_IDTextBox" runat="server" Text='<%# Bind("USER_ID") %>' 
                                        CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
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
                            <label class="w-32 font-medium text-gray-700">Project ID:</label>
                            <asp:TextBox ID="PROJECT_IDTextBox" runat="server" Text='<%# Bind("PROJECT_ID") %>' 
                                        CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Name:</label>
                            <asp:TextBox ID="PROJECT_NAMETextBox" runat="server" Text='<%# Bind("PROJECT_NAME") %>' 
                                        CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Status:</label>
                            <asp:DropDownList ID="PROJECT_STATUSDropDownList" runat="server" SelectedValue='<%# Bind("PROJECT_STATUS") %>'
                                             CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500">
                                <asp:ListItem Text="Not Started" Value="Not Started"></asp:ListItem>
                                <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Start Date:</label>
                            <asp:TextBox ID="PROJECT_START_DATETextBox" runat="server" Text='<%# Bind("PROJECT_START_DATE", "{0:yyyy-MM-ddTHH:mm}") %>'
                                        TextMode="DateTimeLocal" CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Due Date:</label>
                            <asp:TextBox ID="PROJECT_DUE_DATETextBox" runat="server" Text='<%# Bind("PROJECT_DUE_DATE", "{0:yyyy-MM-ddTHH:mm}") %>'
                                        TextMode="DateTimeLocal" CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">User ID:</label>
                            <asp:TextBox ID="USER_IDTextBox" runat="server" Text='<%# Bind("USER_ID") %>' 
                                        CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
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
                            <label class="w-32 font-medium text-gray-700">Project ID:</label>
                            <asp:Label ID="PROJECT_IDLabel" runat="server" Text='<%# Eval("PROJECT_ID") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Name:</label>
                            <asp:Label ID="PROJECT_NAMELabel" runat="server" Text='<%# Bind("PROJECT_NAME") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Status:</label>
                            <asp:Label ID="PROJECT_STATUSLabel" runat="server" Text='<%# Bind("PROJECT_STATUS") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Start Date:</label>
                            <asp:Label ID="PROJECT_START_DATELabel" runat="server" Text='<%# Bind("PROJECT_START_DATE") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Due Date:</label>
                            <asp:Label ID="PROJECT_DUE_DATELabel" runat="server" Text='<%# Bind("PROJECT_DUE_DATE") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">User ID:</label>
                            <asp:Label ID="USER_IDLabel" runat="server" Text='<%# Bind("USER_ID") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex space-x-2 mt-4">
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" 
                                          CssClass="bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded-md">
                                Edit
                            </asp:LinkButton>
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" 
                                          CssClass="bg-red-600 hover:bg-red-700 text-white py-2 px-4 rounded-md"
                                          OnClientClick="return confirm('Are you sure you want to delete this project?');">
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
                    <p class="text-gray-600">No Project selected. Please select a project from the list below.</p>
                </EmptyDataTemplate>
            </asp:FormView>
        </div>
        
        <!-- Grid View for Project List -->
        <div>
            <h3 class="text-lg font-medium text-blue-700 mb-4">All Projects</h3>
            <div class="overflow-x-auto">
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="PROJECT_ID" 
                              DataSourceID="SqlDataSource1" CssClass="min-w-full bg-white border-collapse"
                              HeaderStyle-CssClass="bg-gradient-to-r from-teal-500 to-blue-500 text-black text-left"
                              RowStyle-CssClass="border-b hover:bg-blue-50" AlternatingRowStyle-CssClass="border-b bg-gray-50 hover:bg-blue-50"
                              CellPadding="8" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle CssClass="border-b bg-gray-50 hover:bg-blue-50"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField DataField="PROJECT_ID" HeaderText="ID" ReadOnly="True" SortExpression="PROJECT_ID" ItemStyle-CssClass="px-4 py-2" >
                            <ItemStyle CssClass="px-4 py-2"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="PROJECT_NAME" HeaderText="Name" SortExpression="PROJECT_NAME" ItemStyle-CssClass="px-4 py-2" >
                            <ItemStyle CssClass="px-4 py-2"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Status" SortExpression="PROJECT_STATUS" ItemStyle-CssClass="px-4 py-2">
                            <ItemTemplate>
                                <asp:Label ID="PROJECT_STATUSLabel" runat="server" Text='<%# Eval("PROJECT_STATUS") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="PROJECT_STATUSDropDownList" runat="server" SelectedValue='<%# Bind("PROJECT_STATUS") %>'
                                                 CssClass="border rounded-md p-2 w-full focus:ring-2 focus:ring-teal-300 focus:border-teal-500">
                                    <asp:ListItem Text="Not Started" Value="Not Started"></asp:ListItem>
                                    <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                    <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemStyle CssClass="px-4 py-2"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Start Date" SortExpression="PROJECT_START_DATE" ItemStyle-CssClass="px-4 py-2">
                            <ItemTemplate>
                                <asp:Label ID="PROJECT_START_DATELabel" runat="server" Text='<%# Eval("PROJECT_START_DATE") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="PROJECT_START_DATETextBox" runat="server" Text='<%# Bind("PROJECT_START_DATE", "{0:yyyy-MM-ddTHH:mm}") %>'
                                             TextMode="DateTimeLocal" CssClass="border rounded-md p-2 w-full focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                            </EditItemTemplate>
                            <ItemStyle CssClass="px-4 py-2"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Due Date" SortExpression="PROJECT_DUE_DATE" ItemStyle-CssClass="px-4 py-2">
                            <ItemTemplate>
                                <asp:Label ID="PROJECT_DUE_DATELabel" runat="server" Text='<%# Eval("PROJECT_DUE_DATE") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="PROJECT_DUE_DATETextBox" runat="server" Text='<%# Bind("PROJECT_DUE_DATE", "{0:yyyy-MM-ddTHH:mm}") %>'
                                             TextMode="DateTimeLocal" CssClass="border rounded-md p-2 w-full focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                            </EditItemTemplate>
                            <ItemStyle CssClass="px-4 py-2"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="USER_ID" HeaderText="User ID" SortExpression="USER_ID" ItemStyle-CssClass="px-4 py-2" >
                            <ItemStyle CssClass="px-4 py-2"></ItemStyle>
                        </asp:BoundField>
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
                                    OnClientClick="return confirm('Are you sure you want to delete this project?');">
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
                    <HeaderStyle CssClass="bg-gradient-to-r from-teal-500 to-blue-500 text-black text-left"></HeaderStyle>
                    <RowStyle CssClass="border-b hover:bg-blue-50"></RowStyle>
                </asp:GridView>
            </div>
        </div>
        
        <!-- SQL Data Source for GridView -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" 
                          ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                          DeleteCommand='DELETE FROM PROJECT WHERE PROJECT_ID = :original_PROJECT_ID AND ((PROJECT_NAME = :original_PROJECT_NAME) OR (PROJECT_NAME IS NULL AND :original_PROJECT_NAME IS NULL)) AND ((PROJECT_STATUS = :original_PROJECT_STATUS) OR (PROJECT_STATUS IS NULL AND :original_PROJECT_STATUS IS NULL)) AND ((PROJECT_START_DATE = :original_PROJECT_START_DATE) OR (PROJECT_START_DATE IS NULL AND :original_PROJECT_START_DATE IS NULL)) AND ((PROJECT_DUE_DATE = :original_PROJECT_DUE_DATE) OR (PROJECT_DUE_DATE IS NULL AND :original_PROJECT_DUE_DATE IS NULL)) AND USER_ID = :original_USER_ID' 
                          InsertCommand='INSERT INTO PROJECT (PROJECT_ID, PROJECT_NAME, PROJECT_STATUS, PROJECT_START_DATE, PROJECT_DUE_DATE, USER_ID) VALUES (:PROJECT_ID, :PROJECT_NAME, :PROJECT_STATUS, :PROJECT_START_DATE, :PROJECT_DUE_DATE, :USER_ID)' 
                          OldValuesParameterFormatString="original_{0}" 
                          ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                          SelectCommand='SELECT * FROM PROJECT' 
                          UpdateCommand='UPDATE PROJECT SET PROJECT_NAME = :PROJECT_NAME, PROJECT_STATUS = :PROJECT_STATUS, PROJECT_START_DATE = :PROJECT_START_DATE, PROJECT_DUE_DATE = :PROJECT_DUE_DATE, USER_ID = :USER_ID WHERE PROJECT_ID = :original_PROJECT_ID AND ((PROJECT_NAME = :original_PROJECT_NAME) OR (PROJECT_NAME IS NULL AND :original_PROJECT_NAME IS NULL)) AND ((PROJECT_STATUS = :original_PROJECT_STATUS) OR (PROJECT_STATUS IS NULL AND :original_PROJECT_STATUS IS NULL)) AND ((PROJECT_START_DATE = :original_PROJECT_START_DATE) OR (PROJECT_START_DATE IS NULL AND :original_PROJECT_START_DATE IS NULL)) AND ((PROJECT_DUE_DATE = :original_PROJECT_DUE_DATE) OR (PROJECT_DUE_DATE IS NULL AND :original_PROJECT_DUE_DATE IS NULL)) AND USER_ID = :original_USER_ID'>
            <DeleteParameters>
                <asp:Parameter Name="original_PROJECT_ID" Type="Decimal" />
                <asp:Parameter Name="original_PROJECT_NAME" Type="String" />
                <asp:Parameter Name="original_PROJECT_STATUS" Type="String" />
                <asp:Parameter Name="original_PROJECT_START_DATE" Type="DateTime" />
                <asp:Parameter Name="original_PROJECT_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="original_USER_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                <asp:Parameter Name="PROJECT_NAME" Type="String" />
                <asp:Parameter Name="PROJECT_STATUS" Type="String" />
                <asp:Parameter Name="PROJECT_START_DATE" Type="DateTime" />
                <asp:Parameter Name="PROJECT_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="USER_ID" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="PROJECT_NAME" Type="String" />
                <asp:Parameter Name="PROJECT_STATUS" Type="String" />
                <asp:Parameter Name="PROJECT_START_DATE" Type="DateTime" />
                <asp:Parameter Name="PROJECT_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="USER_ID" Type="Decimal" />
                <asp:Parameter Name="original_PROJECT_ID" Type="Decimal" />
                <asp:Parameter Name="original_PROJECT_NAME" Type="String" />
                <asp:Parameter Name="original_PROJECT_STATUS" Type="String" />
                <asp:Parameter Name="original_PROJECT_START_DATE" Type="DateTime" />
                <asp:Parameter Name="original_PROJECT_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="original_USER_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <!-- SQL Data Source for FormView -->
        <asp:SqlDataSource ID="SqlDataSourceFormView" runat="server" ConflictDetection="CompareAllValues" 
                          ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                          DeleteCommand='DELETE FROM PROJECT WHERE PROJECT_ID = :original_PROJECT_ID AND ((PROJECT_NAME = :original_PROJECT_NAME) OR (PROJECT_NAME IS NULL AND :original_PROJECT_NAME IS NULL)) AND ((PROJECT_STATUS = :original_PROJECT_STATUS) OR (PROJECT_STATUS IS NULL AND :original_PROJECT_STATUS IS NULL)) AND ((PROJECT_START_DATE = :original_PROJECT_START_DATE) OR (PROJECT_START_DATE IS NULL AND :original_PROJECT_START_DATE IS NULL)) AND ((PROJECT_DUE_DATE = :original_PROJECT_DUE_DATE) OR (PROJECT_DUE_DATE IS NULL AND :original_PROJECT_DUE_DATE IS NULL)) AND USER_ID = :original_USER_ID' 
                          InsertCommand='INSERT INTO PROJECT (PROJECT_ID, PROJECT_NAME, PROJECT_STATUS, PROJECT_START_DATE, PROJECT_DUE_DATE, USER_ID) VALUES (:PROJECT_ID, :PROJECT_NAME, :PROJECT_STATUS, :PROJECT_START_DATE, :PROJECT_DUE_DATE, :USER_ID)' 
                          OldValuesParameterFormatString="original_{0}" 
                          ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                          SelectCommand='SELECT * FROM PROJECT WHERE PROJECT_ID = :PROJECT_ID' 
                          UpdateCommand='UPDATE PROJECT SET PROJECT_NAME = :PROJECT_NAME, PROJECT_STATUS = :PROJECT_STATUS, PROJECT_START_DATE = :PROJECT_START_DATE, PROJECT_DUE_DATE = :PROJECT_DUE_DATE, USER_ID = :USER_ID WHERE PROJECT_ID = :original_PROJECT_ID AND ((PROJECT_NAME = :original_PROJECT_NAME) OR (PROJECT_NAME IS NULL AND :original_PROJECT_NAME IS NULL)) AND ((PROJECT_STATUS = :original_PROJECT_STATUS) OR (PROJECT_STATUS IS NULL AND :original_PROJECT_STATUS IS NULL)) AND ((PROJECT_START_DATE = :original_PROJECT_START_DATE) OR (PROJECT_START_DATE IS NULL AND :original_PROJECT_START_DATE IS NULL)) AND ((PROJECT_DUE_DATE = :original_PROJECT_DUE_DATE) OR (PROJECT_DUE_DATE IS NULL AND :original_PROJECT_DUE_DATE IS NULL)) AND USER_ID = :original_USER_ID'>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="PROJECT_ID" PropertyName="SelectedValue" Type="Decimal" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="original_PROJECT_ID" Type="Decimal" />
                <asp:Parameter Name="original_PROJECT_NAME" Type="String" />
                <asp:Parameter Name="original_PROJECT_STATUS" Type="String" />
                <asp:Parameter Name="original_PROJECT_START_DATE" Type="DateTime" />
                <asp:Parameter Name="original_PROJECT_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="original_USER_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
                <asp:Parameter Name="PROJECT_NAME" Type="String" />
                <asp:Parameter Name="PROJECT_STATUS" Type="String" />
                <asp:Parameter Name="PROJECT_START_DATE" Type="DateTime" />
                <asp:Parameter Name="PROJECT_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="USER_ID" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="PROJECT_NAME" Type="String" />
                <asp:Parameter Name="PROJECT_STATUS" Type="String" />
                <asp:Parameter Name="PROJECT_START_DATE" Type="DateTime" />
                <asp:Parameter Name="PROJECT_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="USER_ID" Type="Decimal" />
                <asp:Parameter Name="original_PROJECT_ID" Type="Decimal" />
                <asp:Parameter Name="original_PROJECT_NAME" Type="String" />
                <asp:Parameter Name="original_PROJECT_STATUS" Type="String" />
                <asp:Parameter Name="original_PROJECT_START_DATE" Type="DateTime" />
                <asp:Parameter Name="original_PROJECT_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="original_USER_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>