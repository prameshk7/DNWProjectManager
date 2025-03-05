<%@ Page Language="C#" MasterPageFile="~/Layout/Site1.master" AutoEventWireup="true" CodeBehind="taskSubtaskForm.aspx.cs" Inherits="DataCoursework.taskSubtaskForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Task Subtasks</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-white rounded-lg shadow-md p-6">
        <h2 class="text-xl font-semibold text-teal-700 mb-6">Task Subtasks Management</h2>
        
        <!-- Form View for Task Subtask Details -->
        <div class="mb-8 bg-gradient-to-r from-blue-50 to-teal-50 p-4 rounded-lg border border-teal-100">
            <h3 class="text-lg font-medium text-blue-700 mb-4">Task Subtask Details</h3>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="TASK_ID,SUBTASK_ID" DataSourceID="SqlDataSource1" 
                          CssClass="w-full max-w-lg">
                <EditItemTemplate>
                    <div class="grid grid-cols-1 gap-4">
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Task ID:</label>
                            <asp:Label ID="TASK_IDLabel1" runat="server" Text='<%# Eval("TASK_ID") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Subtask ID:</label>
                            <asp:Label ID="SUBTASK_IDLabel1" runat="server" Text='<%# Eval("SUBTASK_ID") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex space-x-2 mt-4">
                            <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" Text="Update" 
                                          CssClass="bg-green-600 hover:bg-green-700 text-white py-2 px-4 rounded-md">
                                Update
                            </asp:LinkButton>
                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CommandName="Cancel" Text="Cancel" 
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
                            <label class="w-32 font-medium text-gray-700">Subtask ID:</label>
                            <asp:TextBox ID="SUBTASK_IDTextBox" runat="server" Text='<%# Bind("SUBTASK_ID") %>' 
                                        CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                        </div>
                        <div class="flex space-x-2 mt-4">
                            <asp:LinkButton ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" 
                                          CssClass="bg-green-600 hover:bg-green-700 text-white py-2 px-4 rounded-md">
                                Insert
                            </asp:LinkButton>
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CommandName="Cancel" Text="Cancel" 
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
                            <label class="w-32 font-medium text-gray-700">Subtask ID:</label>
                            <asp:Label ID="SUBTASK_IDLabel" runat="server" Text='<%# Eval("SUBTASK_ID") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex space-x-2 mt-4">
                            <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="Edit" 
                                          CssClass="bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded-md">
                                Edit
                            </asp:LinkButton>
                            <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" 
                                          CssClass="bg-red-600 hover:bg-red-700 text-white py-2 px-4 rounded-md"
                                          OnClientClick="return confirm('Are you sure you want to delete this task-subtask association?');">
                                Delete
                            </asp:LinkButton>
                            <asp:LinkButton ID="NewButton" runat="server" CommandName="New" Text="New" 
                                          CssClass="bg-green-600 hover:bg-green-700 text-white py-2 px-4 rounded-md">
                                New
                            </asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:FormView>
        </div>
        
        <!-- Grid View for Task Subtask List -->
        <div>
            <h3 class="text-lg font-medium text-blue-700 mb-4">All Task Subtasks</h3>
            <div class="overflow-x-auto">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TASK_ID,SUBTASK_ID" 
                            DataSourceID="SqlDataSource1" CssClass="min-w-full bg-white border-collapse"
                            HeaderStyle-CssClass="bg-gradient-to-r from-teal-500 to-blue-500 text-black text-left"
                            RowStyle-CssClass="border-b hover:bg-blue-50" AlternatingRowStyle-CssClass="border-b bg-gray-50 hover:bg-blue-50"
                            CellPadding="8" GridLines="None" AllowSorting="True">
                    <Columns>
                        <asp:BoundField DataField="TASK_ID" HeaderText="Task ID" ReadOnly="True" SortExpression="TASK_ID" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" />
                        <asp:BoundField DataField="SUBTASK_ID" HeaderText="Subtask ID" ReadOnly="True" SortExpression="SUBTASK_ID" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" />
    <asp:TemplateField HeaderText="Action" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" ItemStyle-CssClass="p-4">
    <ItemTemplate>
        <asp:LinkButton ID="SelectButton" runat="server" CommandName="Select" Text="Select"
            CssClass="bg-green-500 hover:bg-green-600 text-white py-1 px-3 rounded-md text-sm mr-1">
        </asp:LinkButton>
        <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete"
            CssClass="bg-red-500 hover:bg-red-600 text-white py-1 px-3 rounded-md text-sm"
            OnClientClick="return confirm('Are you sure you want to delete this Task and subtask?');">
        </asp:LinkButton>
    </ItemTemplate>
</asp:TemplateField>               
                        </Columns>
                </asp:GridView>
            </div>
        </div>
        
        <!-- SQL Data Source -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT * FROM TASKSUBTASK"
            DeleteCommand="DELETE FROM TASKSUBTASK WHERE TASK_ID = :original_TASK_ID AND SUBTASK_ID = :original_SUBTASK_ID"
            InsertCommand="INSERT INTO TASKSUBTASK (TASK_ID, SUBTASK_ID) VALUES (:TASK_ID, :SUBTASK_ID)"
            ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">
            <DeleteParameters>
                <asp:Parameter Name="original_TASK_ID" Type="Decimal" />
                <asp:Parameter Name="original_SUBTASK_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
                <asp:Parameter Name="SUBTASK_ID" Type="Decimal" />
            </InsertParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>