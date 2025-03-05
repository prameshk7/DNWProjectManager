<%@ Page Language="C#" MasterPageFile="~/Layout/Site1.Master" AutoEventWireup="true" CodeBehind="projectTaskForm.aspx.cs" Inherits="DataCoursework.projectTaskForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-white rounded-lg shadow-md p-6">
        <h2 class="text-xl font-semibold text-teal-700 mb-6">Project Task Management</h2>
        
        <!-- Form View for Project Task Details -->
        <div class="mb-8 bg-gradient-to-r from-blue-50 to-teal-50 p-4 rounded-lg border border-teal-100">
            <h3 class="text-lg font-medium text-blue-700 mb-4">Project Task Details</h3>
            <asp:FormView ID="FormView2" runat="server" DataKeyNames="TASK_ID,PROJECT_ID" DataSourceID="SqlDataSource1"
                         CssClass="w-full max-w-lg">
                <EditItemTemplate>
                    <div class="grid grid-cols-1 gap-4">
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">TASK ID:</label>
                            <asp:Label ID="TASK_IDLabel1" runat="server" Text='<%# Eval("TASK_ID") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">PROJECT ID:</label>
                            <asp:Label ID="PROJECT_IDLabel1" runat="server" Text='<%# Eval("PROJECT_ID") %>' CssClass="text-gray-900" />
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
                            <label class="w-32 font-medium text-gray-700">TASK ID:</label>
                            <asp:TextBox ID="TASK_IDTextBox" runat="server" Text='<%# Bind("TASK_ID") %>' 
                                       CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">PROJECT ID:</label>
                            <asp:TextBox ID="PROJECT_IDTextBox" runat="server" Text='<%# Bind("PROJECT_ID") %>' 
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
                            <label class="w-32 font-medium text-gray-700">TASK ID:</label>
                            <asp:Label ID="TASK_IDLabel" runat="server" Text='<%# Eval("TASK_ID") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">PROJECT ID:</label>
                            <asp:Label ID="PROJECT_IDLabel" runat="server" Text='<%# Eval("PROJECT_ID") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex space-x-2 mt-4">
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" 
                                         CssClass="bg-red-600 hover:bg-red-700 text-white py-2 px-4 rounded-md"
                                         OnClientClick="return confirm('Are you sure you want to delete this project task?');">
                                Delete
                            </asp:LinkButton>
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" 
                                         CssClass="bg-green-600 hover:bg-green-700 text-white py-2 px-4 rounded-md">
                                New
                            </asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:FormView>
        </div>
        
        <!-- Grid View for Project Task List -->
        <div>
            <h3 class="text-lg font-medium text-blue-700 mb-4">All Project Tasks</h3>
            <div class="overflow-x-auto">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TASK_ID,PROJECT_ID" 
                            DataSourceID="SqlDataSource1" CssClass="min-w-full bg-white border-collapse"
                            HeaderStyle-CssClass="bg-gradient-to-r from-green-500 to-blue-500 text-white text-left"
                            RowStyle-CssClass="border-b hover:bg-blue-50" AlternatingRowStyle-CssClass="border-b bg-gray-50 hover:bg-blue-50"
                            CellPadding="8" GridLines="None" AllowSorting="True">
<AlternatingRowStyle CssClass="border-b bg-gray-50 hover:bg-blue-50"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField DataField="TASK_ID" HeaderText="Task ID" ReadOnly="True" SortExpression="TASK_ID" ItemStyle-CssClass="px-4 py-2" >
<ItemStyle CssClass="px-4 py-2"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="PROJECT_ID" HeaderText="Project ID" ReadOnly="True" SortExpression="PROJECT_ID" ItemStyle-CssClass="px-4 py-2" >
<ItemStyle CssClass="px-4 py-2"></ItemStyle>
                        </asp:BoundField>
    <asp:TemplateField HeaderText="Action" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" ItemStyle-CssClass="p-4">
    <ItemTemplate>
        <asp:LinkButton ID="SelectButton" runat="server" CommandName="Select" Text="Select"
            CssClass="bg-green-500 hover:bg-green-600 text-white py-1 px-3 rounded-md text-sm mr-1">
        </asp:LinkButton>
        <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete"
            CssClass="bg-red-500 hover:bg-red-600 text-white py-1 px-3 rounded-md text-sm"
            OnClientClick="return confirm('Are you sure you want to delete this project and task?');">
        </asp:LinkButton>
    </ItemTemplate>
</asp:TemplateField>
                    </Columns>

<HeaderStyle CssClass="bg-gradient-to-r from-teal-500 to-blue-500 text-black text-left"></HeaderStyle>

<RowStyle CssClass="border-b hover:bg-blue-50"></RowStyle>
                </asp:GridView>
            </div>
        </div>
        
        <!-- SQL Data Source -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" 
                          ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                          DeleteCommand="DELETE FROM &quot;PROJECTTASK&quot; WHERE &quot;TASK_ID&quot; = :original_TASK_ID AND &quot;PROJECT_ID&quot; = :original_PROJECT_ID" 
                          InsertCommand="INSERT INTO &quot;PROJECTTASK&quot; (&quot;TASK_ID&quot;, &quot;PROJECT_ID&quot;) VALUES (:TASK_ID, :PROJECT_ID)" 
                          OldValuesParameterFormatString="original_{0}" 
                          ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                          SelectCommand="SELECT * FROM &quot;PROJECTTASK&quot;">
            <DeleteParameters>
                <asp:Parameter Name="original_TASK_ID" Type="Decimal" />
                <asp:Parameter Name="original_PROJECT_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TASK_ID" Type="Decimal" />
                <asp:Parameter Name="PROJECT_ID" Type="Decimal" />
            </InsertParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>