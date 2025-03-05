<%@ Page Language="C#" MasterPageFile="~/layout/Site1.master" AutoEventWireup="true" CodeBehind="subtaskForm.aspx.cs" Inherits="DataCoursework.WebForm.subtaskForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Subtask Management</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-white rounded-lg shadow-md p-6">
        <h2 class="text-xl font-semibold text-teal-700 mb-6">Subtask Management</h2>
        
        <!-- Form View for Subtask Details -->
        <div class="mb-8 bg-gradient-to-r from-blue-50 to-teal-50 p-4 rounded-lg border border-teal-100">
            <h3 class="text-lg font-medium text-blue-700 mb-4">Subtask Details</h3>
            <asp:FormView ID="FormView2" runat="server" DataKeyNames="SUBTASK_ID" DataSourceID="SqlDataSourceFormView" 
                          CssClass="w-full max-w-lg">
                <EditItemTemplate>
                    <div class="grid grid-cols-1 gap-4">
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Subtask ID:</label>
                            <asp:Label ID="SUBTASK_IDLabel1" runat="server" Text='<%# Eval("SUBTASK_ID") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Name:</label>
                            <asp:TextBox ID="SUBTASK_NAMETextBox" runat="server" Text='<%# Bind("SUBTASK_NAME") %>' 
                                        CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Status:</label>
                            <asp:DropDownList ID="SUBTASK_STATUSDropDownList" runat="server" SelectedValue='<%# Bind("SUBTASK_STATUS") %>'
                                             CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500">
                                <asp:ListItem Text="Not Started" Value="Not Started"></asp:ListItem>
                                <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Start Date:</label>
                            <asp:TextBox ID="SUBTASK_START_DATETextBox" runat="server" Text='<%# Bind("SUBTASK_START_DATE", "{0:yyyy-MM-ddTHH:mm}") %>'
                                        TextMode="DateTimeLocal" CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Due Date:</label>
                            <asp:TextBox ID="SUBTASK_DUE_DATETextBox" runat="server" Text='<%# Bind("SUBTASK_DUE_DATE", "{0:yyyy-MM-ddTHH:mm}") %>'
                                        TextMode="DateTimeLocal" CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
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
                            <label class="w-32 font-medium text-gray-700">Subtask ID:</label>
                            <asp:TextBox ID="SUBTASK_IDTextBox" runat="server" Text='<%# Bind("SUBTASK_ID") %>' 
                                        CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Name:</label>
                            <asp:TextBox ID="SUBTASK_NAMETextBox" runat="server" Text='<%# Bind("SUBTASK_NAME") %>' 
                                        CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Status:</label>
                            <asp:DropDownList ID="SUBTASK_STATUSDropDownList" runat="server" SelectedValue='<%# Bind("SUBTASK_STATUS") %>'
                                             CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500">
                                <asp:ListItem Text="Not Started" Value="Not Started"></asp:ListItem>
                                <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Start Date:</label>
                            <asp:TextBox ID="SUBTASK_START_DATETextBox" runat="server" Text='<%# Bind("SUBTASK_START_DATE", "{0:yyyy-MM-ddTHH:mm}") %>'
                                        TextMode="DateTimeLocal" CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Due Date:</label>
                            <asp:TextBox ID="SUBTASK_DUE_DATETextBox" runat="server" Text='<%# Bind("SUBTASK_DUE_DATE", "{0:yyyy-MM-ddTHH:mm}") %>'
                                        TextMode="DateTimeLocal" CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
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
                            <label class="w-32 font-medium text-gray-700">Subtask ID:</label>
                            <asp:Label ID="SUBTASK_IDLabel" runat="server" Text='<%# Eval("SUBTASK_ID") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Name:</label>
                            <asp:Label ID="SUBTASK_NAMELabel" runat="server" Text='<%# Bind("SUBTASK_NAME") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Status:</label>
                            <asp:Label ID="SUBTASK_STATUSLabel" runat="server" Text='<%# Bind("SUBTASK_STATUS") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Start Date:</label>
                            <asp:Label ID="SUBTASK_START_DATELabel" runat="server" Text='<%# Bind("SUBTASK_START_DATE") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Due Date:</label>
                            <asp:Label ID="SUBTASK_DUE_DATELabel" runat="server" Text='<%# Bind("SUBTASK_DUE_DATE") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex space-x-2 mt-4">
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" 
                                          CssClass="bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded-md">
                                Edit
                            </asp:LinkButton>
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" 
                                          CssClass="bg-red-600 hover:bg-red-700 text-white py-2 px-4 rounded-md"
                                          OnClientClick="return confirm('Are you sure you want to delete this subtask?');">
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
                    <p class="text-gray-600">No subtask selected. Please select a subtask from the list below.</p>
                </EmptyDataTemplate>
            </asp:FormView>
        </div>
        
        <!-- Grid View for Subtask List -->
        <div>
            <h3 class="text-lg font-medium text-blue-700 mb-4">All Subtasks</h3>
            <div class="overflow-x-auto">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SUBTASK_ID" 
                              DataSourceID="SqlDataSource1" CssClass="min-w-full bg-white border-collapse"
                              HeaderStyle-CssClass="bg-gradient-to-r from-teal-500 to-blue-500 text-white text-left"
                              RowStyle-CssClass="border-b hover:bg-blue-50" AlternatingRowStyle-CssClass="border-b bg-gray-50 hover:bg-blue-50"
                              CellPadding="8" GridLines="None" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle CssClass="border-b bg-gray-50 hover:bg-blue-50"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField DataField="SUBTASK_ID" HeaderText="ID" ReadOnly="True" SortExpression="SUBTASK_ID" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" >
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="SUBTASK_NAME" HeaderText="Name" SortExpression="SUBTASK_NAME" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" >
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Status" SortExpression="SUBTASK_STATUS" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700">
                            <ItemTemplate>
                                <asp:Label ID="SUBTASK_STATUSLabel" runat="server" Text='<%# Eval("SUBTASK_STATUS") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="SUBTASK_STATUSDropDownList" runat="server" SelectedValue='<%# Bind("SUBTASK_STATUS") %>'
                                                 CssClass="border rounded-md p-2 w-full focus:ring-2 focus:ring-teal-300 focus:border-teal-500">
                                    <asp:ListItem Text="Not Started" Value="Not Started"></asp:ListItem>
                                    <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                    <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Start Date" SortExpression="SUBTASK_START_DATE" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700">
                            <ItemTemplate>
                                <asp:Label ID="SUBTASK_START_DATELabel" runat="server" Text='<%# Eval("SUBTASK_START_DATE") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="SUBTASK_START_DATETextBox" runat="server" Text='<%# Bind("SUBTASK_START_DATE", "{0:yyyy-MM-ddTHH:mm}") %>'
                                             TextMode="DateTimeLocal" CssClass="border rounded-md p-2 w-full focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                            </EditItemTemplate>
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Due Date" SortExpression="SUBTASK_DUE_DATE" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700">
                            <ItemTemplate>
                                <asp:Label ID="SUBTASK_DUE_DATELabel" runat="server" Text='<%# Eval("SUBTASK_DUE_DATE") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="SUBTASK_DUE_DATETextBox" runat="server" Text='<%# Bind("SUBTASK_DUE_DATE", "{0:yyyy-MM-ddTHH:mm}") %>'
                                             TextMode="DateTimeLocal" CssClass="border rounded-md p-2 w-full focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
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
                                    OnClientClick="return confirm('Are you sure you want to delete this subtask?');">
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand='DELETE FROM SUBTASK WHERE SUBTASK_ID = :original_SUBTASK_ID AND ((SUBTASK_NAME = :original_SUBTASK_NAME) OR (SUBTASK_NAME IS NULL AND :original_SUBTASK_NAME IS NULL)) AND ((SUBTASK_STATUS = :original_SUBTASK_STATUS) OR (SUBTASK_STATUS IS NULL AND :original_SUBTASK_STATUS IS NULL)) AND ((SUBTASK_START_DATE = :original_SUBTASK_START_DATE) OR (SUBTASK_START_DATE IS NULL AND :original_SUBTASK_START_DATE IS NULL)) AND ((SUBTASK_DUE_DATE = :original_SUBTASK_DUE_DATE) OR (SUBTASK_DUE_DATE IS NULL AND :original_SUBTASK_DUE_DATE IS NULL))'
            InsertCommand='INSERT INTO SUBTASK (SUBTASK_ID, SUBTASK_NAME, SUBTASK_STATUS, SUBTASK_START_DATE, SUBTASK_DUE_DATE) VALUES (:SUBTASK_ID, :SUBTASK_NAME, :SUBTASK_STATUS, :SUBTASK_START_DATE, :SUBTASK_DUE_DATE)'
            OldValuesParameterFormatString="original_{0}"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand='SELECT * FROM SUBTASK'
            UpdateCommand='UPDATE SUBTASK SET SUBTASK_NAME = :SUBTASK_NAME, SUBTASK_STATUS = :SUBTASK_STATUS, SUBTASK_START_DATE = :SUBTASK_START_DATE, SUBTASK_DUE_DATE = :SUBTASK_DUE_DATE WHERE SUBTASK_ID = :original_SUBTASK_ID AND ((SUBTASK_NAME = :original_SUBTASK_NAME) OR (SUBTASK_NAME IS NULL AND :original_SUBTASK_NAME IS NULL)) AND ((SUBTASK_STATUS = :original_SUBTASK_STATUS) OR (SUBTASK_STATUS IS NULL AND :original_SUBTASK_STATUS IS NULL)) AND ((SUBTASK_START_DATE = :original_SUBTASK_START_DATE) OR (SUBTASK_START_DATE IS NULL AND :original_SUBTASK_START_DATE IS NULL)) AND ((SUBTASK_DUE_DATE = :original_SUBTASK_DUE_DATE) OR (SUBTASK_DUE_DATE IS NULL AND :original_SUBTASK_DUE_DATE IS NULL))'>
            <DeleteParameters>
                <asp:Parameter Name="original_SUBTASK_ID" Type="Decimal" />
                <asp:Parameter Name="original_SUBTASK_NAME" Type="String" />
                <asp:Parameter Name="original_SUBTASK_STATUS" Type="String" />
                <asp:Parameter Name="original_SUBTASK_START_DATE" Type="DateTime" />
                <asp:Parameter Name="original_SUBTASK_DUE_DATE" Type="DateTime" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SUBTASK_ID" Type="Decimal" />
                <asp:Parameter Name="SUBTASK_NAME" Type="String" />
                <asp:Parameter Name="SUBTASK_STATUS" Type="String" />
                <asp:Parameter Name="SUBTASK_START_DATE" Type="DateTime" />
                <asp:Parameter Name="SUBTASK_DUE_DATE" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="SUBTASK_NAME" Type="String" />
                <asp:Parameter Name="SUBTASK_STATUS" Type="String" />
                <asp:Parameter Name="SUBTASK_START_DATE" Type="DateTime" />
                <asp:Parameter Name="SUBTASK_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="original_SUBTASK_ID" Type="Decimal" />
                <asp:Parameter Name="original_SUBTASK_NAME" Type="String" />
                <asp:Parameter Name="original_SUBTASK_STATUS" Type="String" />
                <asp:Parameter Name="original_SUBTASK_START_DATE" Type="DateTime" />
                <asp:Parameter Name="original_SUBTASK_DUE_DATE" Type="DateTime" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <!-- SQL Data Source for FormView -->
        <asp:SqlDataSource ID="SqlDataSourceFormView" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand='DELETE FROM SUBTASK WHERE SUBTASK_ID = :original_SUBTASK_ID AND ((SUBTASK_NAME = :original_SUBTASK_NAME) OR (SUBTASK_NAME IS NULL AND :original_SUBTASK_NAME IS NULL)) AND ((SUBTASK_STATUS = :original_SUBTASK_STATUS) OR (SUBTASK_STATUS IS NULL AND :original_SUBTASK_STATUS IS NULL)) AND ((SUBTASK_START_DATE = :original_SUBTASK_START_DATE) OR (SUBTASK_START_DATE IS NULL AND :original_SUBTASK_START_DATE IS NULL)) AND ((SUBTASK_DUE_DATE = :original_SUBTASK_DUE_DATE) OR (SUBTASK_DUE_DATE IS NULL AND :original_SUBTASK_DUE_DATE IS NULL))'
            InsertCommand='INSERT INTO SUBTASK (SUBTASK_ID, SUBTASK_NAME, SUBTASK_STATUS, SUBTASK_START_DATE, SUBTASK_DUE_DATE) VALUES (:SUBTASK_ID, :SUBTASK_NAME, :SUBTASK_STATUS, :SUBTASK_START_DATE, :SUBTASK_DUE_DATE)'
            OldValuesParameterFormatString="original_{0}"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand='SELECT * FROM SUBTASK WHERE SUBTASK_ID = :SUBTASK_ID'
            UpdateCommand='UPDATE SUBTASK SET SUBTASK_NAME = :SUBTASK_NAME, SUBTASK_STATUS = :SUBTASK_STATUS, SUBTASK_START_DATE = :SUBTASK_START_DATE, SUBTASK_DUE_DATE = :SUBTASK_DUE_DATE WHERE SUBTASK_ID = :original_SUBTASK_ID AND ((SUBTASK_NAME = :original_SUBTASK_NAME) OR (SUBTASK_NAME IS NULL AND :original_SUBTASK_NAME IS NULL)) AND ((SUBTASK_STATUS = :original_SUBTASK_STATUS) OR (SUBTASK_STATUS IS NULL AND :original_SUBTASK_STATUS IS NULL)) AND ((SUBTASK_START_DATE = :original_SUBTASK_START_DATE) OR (SUBTASK_START_DATE IS NULL AND :original_SUBTASK_START_DATE IS NULL)) AND ((SUBTASK_DUE_DATE = :original_SUBTASK_DUE_DATE) OR (SUBTASK_DUE_DATE IS NULL AND :original_SUBTASK_DUE_DATE IS NULL))'>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="SUBTASK_ID" PropertyName="SelectedValue" Type="Decimal" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="original_SUBTASK_ID" Type="Decimal" />
                <asp:Parameter Name="original_SUBTASK_NAME" Type="String" />
                <asp:Parameter Name="original_SUBTASK_STATUS" Type="String" />
                <asp:Parameter Name="original_SUBTASK_START_DATE" Type="DateTime" />
                <asp:Parameter Name="original_SUBTASK_DUE_DATE" Type="DateTime" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SUBTASK_ID" Type="Decimal" />
                <asp:Parameter Name="SUBTASK_NAME" Type="String" />
                <asp:Parameter Name="SUBTASK_STATUS" Type="String" />
                <asp:Parameter Name="SUBTASK_START_DATE" Type="DateTime" />
                <asp:Parameter Name="SUBTASK_DUE_DATE" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="SUBTASK_NAME" Type="String" />
                <asp:Parameter Name="SUBTASK_STATUS" Type="String" />
                <asp:Parameter Name="SUBTASK_START_DATE" Type="DateTime" />
                <asp:Parameter Name="SUBTASK_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="original_SUBTASK_ID" Type="Decimal" />
                <asp:Parameter Name="original_SUBTASK_NAME" Type="String" />
                <asp:Parameter Name="original_SUBTASK_STATUS" Type="String" />
                <asp:Parameter Name="original_SUBTASK_START_DATE" Type="DateTime" />
                <asp:Parameter Name="original_SUBTASK_DUE_DATE" Type="DateTime" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>