<%@ Page Language="C#" MasterPageFile="~/Layout/Site1.Master" AutoEventWireup="true" CodeBehind="taskForm.aspx.cs" Inherits="DataCoursework.taskForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-white rounded-lg shadow-md p-6">
        <h2 class="text-xl font-semibold text-teal-700 mb-6">Task Management</h2>
        
        <!-- Form View for Task Details -->
        <div class="mb-8 bg-gradient-to-r from-blue-50 to-teal-50 p-4 rounded-lg border border-teal-100">
            <h3 class="text-lg font-medium text-blue-700 mb-4">Task Details</h3>
            <asp:FormView ID="FormView2" runat="server" DataKeyNames="TASK_ID" DataSourceID="SqlDataSourceFormView" 
                          CssClass="w-full max-w-lg" AllowPaging="False">
                <EditItemTemplate>
                    <div class="grid grid-cols-1 gap-4">
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Task ID:</label>
                            <asp:Label ID="TASK_IDLabel1" runat="server" Text='<%# Eval("TASK_ID") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Task Name:</label>
                            <asp:TextBox ID="TASK_NAMETextBox" runat="server" Text='<%# Bind("TASK_NAME") %>' 
                                        CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Status:</label>
                            <asp:DropDownList ID="TASK_STATUSDropDownList" runat="server" SelectedValue='<%# Bind("TASK_STATUS") %>'
                                              CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500">
                                <asp:ListItem Text="Not Started" Value="Not Started"></asp:ListItem>
                                <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="flex items-start">
                            <label class="w-32 font-medium text-gray-700">Start Date:</label>
                            <asp:TextBox ID="TASK_START_DATETextBox" runat="server" Text='<%# Bind("TASK_START_DATE", "{0:yyyy-MM-ddTHH:mm}") %>'
                                        TextMode="DateTimeLocal" CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                        </div>
                        <div class="flex items-start">
                            <label class="w-32 font-medium text-gray-700">Due Date:</label>
                            <asp:TextBox ID="TASK_DUE_DATETextBox" runat="server" Text='<%# Bind("TASK_DUE_DATE", "{0:yyyy-MM-ddTHH:mm}") %>'
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
                            <label class="w-32 font-medium text-gray-700">Task ID:</label>
                            <asp:TextBox ID="TASK_IDTextBox" runat="server" Text='<%# Bind("TASK_ID") %>' 
                                        CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Task Name:</label>
                            <asp:TextBox ID="TASK_NAMETextBox" runat="server" Text='<%# Bind("TASK_NAME") %>' 
                                        CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Status:</label>
                            <asp:DropDownList ID="TASK_STATUSDropDownList" runat="server" SelectedValue='<%# Bind("TASK_STATUS") %>'
                                              CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500">
                                <asp:ListItem Text="Not Started" Value="Not Started"></asp:ListItem>
                                <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="flex items-start">
                            <label class="w-32 font-medium text-gray-700">Start Date:</label>
                            <asp:TextBox ID="TASK_START_DATETextBox" runat="server" Text='<%# Bind("TASK_START_DATE", "{0:yyyy-MM-ddTHH:mm}") %>'
                                        TextMode="DateTimeLocal" CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                        </div>
                        <div class="flex items-start">
                            <label class="w-32 font-medium text-gray-700">Due Date:</label>
                            <asp:TextBox ID="TASK_DUE_DATETextBox" runat="server" Text='<%# Bind("TASK_DUE_DATE", "{0:yyyy-MM-ddTHH:mm}") %>'
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
                            <label class="w-32 font-medium text-gray-700">Task ID:</label>
                            <asp:Label ID="TASK_IDLabel" runat="server" Text='<%# Eval("TASK_ID") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Task Name:</label>
                            <asp:Label ID="TASK_NAMELabel" runat="server" Text='<%# Bind("TASK_NAME") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Status:</label>
                            <asp:Label ID="TASK_STATUSLabel" runat="server" Text='<%# Bind("TASK_STATUS") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Start Date:</label>
                            <asp:Label ID="TASK_START_DATELabel" runat="server" Text='<%# Bind("TASK_START_DATE", "{0:MM/dd/yyyy}") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Due Date:</label>
                            <asp:Label ID="TASK_DUE_DATELabel" runat="server" Text='<%# Bind("TASK_DUE_DATE", "{0:MM/dd/yyyy}") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex space-x-2 mt-4">
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" 
                                          CssClass="bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded-md">
                                Edit
                            </asp:LinkButton>
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" 
                                          CssClass="bg-red-600 hover:bg-red-700 text-white py-2 px-4 rounded-md"
                                          OnClientClick="return confirm('Are you sure you want to delete this task?');">
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
                    <p class="text-gray-600">No task selected. Please select a task from the list below.</p>
                </EmptyDataTemplate>
            </asp:FormView>
        </div>
        
        <!-- Grid View for Task List -->
        <div>
            <h3 class="text-lg font-medium text-blue-700 mb-4">All Tasks</h3>
            <div class="overflow-x-auto">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TASK_ID" 
                            DataSourceID="SqlDataSource1" CssClass="min-w-full bg-white border-collapse"
                            HeaderStyle-CssClass="bg-gradient-to-r from-teal-500 to-blue-500 text-white text-left"
                            RowStyle-CssClass="border-b hover:bg-blue-50" AlternatingRowStyle-CssClass="border-b bg-gray-50 hover:bg-blue-50"
                            CellPadding="8" GridLines="None" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle CssClass="border-b bg-gray-50 hover:bg-blue-50"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField DataField="TASK_ID" HeaderText="ID" ReadOnly="True" SortExpression="TASK_ID" ItemStyle-CssClass="px-4 py-2" />
                        <asp:BoundField DataField="TASK_NAME" HeaderText="Name" SortExpression="TASK_NAME" ItemStyle-CssClass="px-4 py-2" />
                        <asp:TemplateField HeaderText="Status" SortExpression="TASK_STATUS" ItemStyle-CssClass="px-4 py-2">
                            <ItemTemplate>
                                <asp:Label ID="TASK_STATUSLabel" runat="server" Text='<%# Eval("TASK_STATUS") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="TASK_STATUSDropDownList" runat="server" SelectedValue='<%# Bind("TASK_STATUS") %>'
                                                  CssClass="border rounded-md p-2 w-full focus:ring-2 focus:ring-teal-300 focus:border-teal-500">
                                    <asp:ListItem Text="Not Started" Value="Not Started"></asp:ListItem>
                                    <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                    <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Start Date" SortExpression="TASK_START_DATE" ItemStyle-CssClass="px-4 py-2">
                            <ItemTemplate>
                                <asp:Label ID="TASK_START_DATELabel" runat="server" Text='<%# Eval("TASK_START_DATE", "{0:MM/dd/yyyy}") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TASK_START_DATETextBox" runat="server" Text='<%# Bind("TASK_START_DATE", "{0:yyyy-MM-ddTHH:mm}") %>'
                                            TextMode="DateTimeLocal" CssClass="border rounded-md p-2 w-full focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Due Date" SortExpression="TASK_DUE_DATE" ItemStyle-CssClass="px-4 py-2">
                            <ItemTemplate>
                                <asp:Label ID="TASK_DUE_DATELabel" runat="server" Text='<%# Eval("TASK_DUE_DATE", "{0:MM/dd/yyyy}") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TASK_DUE_DATETextBox" runat="server" Text='<%# Bind("TASK_DUE_DATE", "{0:yyyy-MM-ddTHH:mm}") %>'
                                            TextMode="DateTimeLocal" CssClass="border rounded-md p-2 w-full focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                            </EditItemTemplate>
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
                                    OnClientClick="return confirm('Are you sure you want to delete this task?');">
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
                    <HeaderStyle CssClass="bg-gradient-to-r from-teal-500 to-blue-500 text-black text-left" />
                    <RowStyle CssClass="border-b hover:bg-blue-50" />
                </asp:GridView>
            </div>
        </div>
        
        <!-- SQL Data Source for GridView -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
                          DeleteCommand='DELETE FROM "TASK" WHERE "TASK_ID" = :TASK_ID' 
                          InsertCommand='INSERT INTO "TASK" ("TASK_ID", "TASK_NAME", "TASK_STATUS", "TASK_START_DATE", "TASK_DUE_DATE") VALUES (:TASK_ID, :TASK_NAME, :TASK_STATUS, :TASK_START_DATE, :TASK_DUE_DATE)' 
                          ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
                          SelectCommand='SELECT * FROM "TASK"' 
                          UpdateCommand='UPDATE "TASK" SET "TASK_NAME" = :TASK_NAME, "TASK_STATUS" = :TASK_STATUS, "TASK_START_DATE" = :TASK_START_DATE, "TASK_DUE_DATE" = :TASK_DUE_DATE WHERE "TASK_ID" = :TASK_ID'
                          OnDeleted="SqlDataSource1_Deleted">
            <DeleteParameters>
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
                <asp:Parameter Name="TASK_NAME" Type="String" />
                <asp:Parameter Name="TASK_STATUS" Type="String" />
                <asp:Parameter Name="TASK_START_DATE" Type="DateTime" />
                <asp:Parameter Name="TASK_DUE_DATE" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TASK_NAME" Type="String" />
                <asp:Parameter Name="TASK_STATUS" Type="String" />
                <asp:Parameter Name="TASK_START_DATE" Type="DateTime" />
                <asp:Parameter Name="TASK_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <!-- SQL Data Source for FormView -->
        <asp:SqlDataSource ID="SqlDataSourceFormView" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
                          DeleteCommand='DELETE FROM "TASK" WHERE "TASK_ID" = :TASK_ID' 
                          InsertCommand='INSERT INTO "TASK" ("TASK_ID", "TASK_NAME", "TASK_STATUS", "TASK_START_DATE", "TASK_DUE_DATE") VALUES (:TASK_ID, :TASK_NAME, :TASK_STATUS, :TASK_START_DATE, :TASK_DUE_DATE)' 
                          ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
                          SelectCommand='SELECT * FROM "TASK" WHERE "TASK_ID" = :TASK_ID'
                          UpdateCommand='UPDATE "TASK" SET "TASK_NAME" = :TASK_NAME, "TASK_STATUS" = :TASK_STATUS, "TASK_START_DATE" = :TASK_START_DATE, "TASK_DUE_DATE" = :TASK_DUE_DATE WHERE "TASK_ID" = :TASK_ID'
                          OnDeleted="SqlDataSourceFormView_Deleted">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="TASK_ID" PropertyName="SelectedValue" Type="Decimal" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
                <asp:Parameter Name="TASK_NAME" Type="String" />
                <asp:Parameter Name="TASK_STATUS" Type="String" />
                <asp:Parameter Name="TASK_START_DATE" Type="DateTime" />
                <asp:Parameter Name="TASK_DUE_DATE" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TASK_NAME" Type="String" />
                <asp:Parameter Name="TASK_STATUS" Type="String" />
                <asp:Parameter Name="TASK_START_DATE" Type="DateTime" />
                <asp:Parameter Name="TASK_DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>