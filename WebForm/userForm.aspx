<%@ Page Language="C#" MasterPageFile="~/layout/Site1.master" AutoEventWireup="true" CodeBehind="userForm.aspx.cs" Inherits="DataCoursework.userForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>User Management</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-white rounded-lg shadow-md p-6">
        <h2 class="text-xl font-semibold text-teal-700 mb-6">User Management</h2>
        
        <!-- Form View for User Details -->
        <div class="mb-8 bg-gradient-to-r from-blue-50 to-teal-50 p-4 rounded-lg border border-teal-100">
            <h3 class="text-lg font-medium text-blue-700 mb-4">User Details</h3>
            <asp:FormView ID="FormView2" runat="server" DataKeyNames="USER_ID" DataSourceID="SqlDataSourceFormView" 
                          CssClass="w-full max-w-lg" AllowPaging="False">
                <EditItemTemplate>
                    <div class="grid grid-cols-1 gap-4">
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">User ID:</label>
                            <asp:Label ID="USER_IDLabel1" runat="server" Text='<%# Eval("USER_ID") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Name:</label>
                            <asp:TextBox ID="USER_NAMETextBox" runat="server" Text='<%# Bind("USER_NAME") %>' 
                                        CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Email:</label>
                            <asp:TextBox ID="USER_EMAILTextBox" runat="server" Text='<%# Bind("USER_EMAIL") %>' 
                                        CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Contact:</label>
                            <asp:TextBox ID="CONTACTTextBox" runat="server" Text='<%# Bind("CONTACT") %>' 
                                        CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">User Type:</label>
                            <asp:DropDownList ID="USER_TYPEDropDownList" runat="server" SelectedValue='<%# Bind("USER_TYPE") %>'
                                              CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500">
                                <asp:ListItem Text="Developer" Value="Developer"></asp:ListItem>
                                <asp:ListItem Text="Tester" Value="Tester"></asp:ListItem>
                                <asp:ListItem Text="Designer" Value="Designer"></asp:ListItem>
                                <asp:ListItem Text="Manager" Value="Manager"></asp:ListItem>
                                <asp:ListItem Text="Data Scientist" Value="Data Scientist"></asp:ListItem>
                            </asp:DropDownList>
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
                            <label class="w-32 font-medium text-gray-700">User ID:</label>
                            <asp:TextBox ID="USER_IDTextBox" runat="server" Text='<%# Bind("USER_ID") %>' 
                                        CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Name:</label>
                            <asp:TextBox ID="USER_NAMETextBox" runat="server" Text='<%# Bind("USER_NAME") %>' 
                                        CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Email:</label>
                            <asp:TextBox ID="USER_EMAILTextBox" runat="server" Text='<%# Bind("USER_EMAIL") %>' 
                                        CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Contact:</label>
                            <asp:TextBox ID="CONTACTTextBox" runat="server" Text='<%# Bind("CONTACT") %>' 
                                        CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">User Type:</label>
                            <asp:DropDownList ID="USER_TYPEDropDownList" runat="server" SelectedValue='<%# Bind("USER_TYPE") %>'
                                              CssClass="border rounded-md p-2 flex-1 focus:ring-2 focus:ring-teal-300 focus:border-teal-500">
                                <asp:ListItem Text="Developer" Value="Developer"></asp:ListItem>
                                <asp:ListItem Text="Tester" Value="Tester"></asp:ListItem>
                                <asp:ListItem Text="Designer" Value="Designer"></asp:ListItem>
                                <asp:ListItem Text="Manager" Value="Manager"></asp:ListItem>
                                <asp:ListItem Text="Data Scientist" Value="Data Scientist"></asp:ListItem>
                            </asp:DropDownList>
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
                            <label class="w-32 font-medium text-gray-700">User ID:</label>
                            <asp:Label ID="USER_IDLabel" runat="server" Text='<%# Eval("USER_ID") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Name:</label>
                            <asp:Label ID="USER_NAMELabel" runat="server" Text='<%# Bind("USER_NAME") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Email:</label>
                            <asp:Label ID="USER_EMAILLabel" runat="server" Text='<%# Bind("USER_EMAIL") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">Contact:</label>
                            <asp:Label ID="CONTACTLabel" runat="server" Text='<%# Bind("CONTACT") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex items-center">
                            <label class="w-32 font-medium text-gray-700">User Type:</label>
                            <asp:Label ID="USER_TYPELabel" runat="server" Text='<%# Bind("USER_TYPE") %>' CssClass="text-gray-900" />
                        </div>
                        <div class="flex space-x-2 mt-4">
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" 
                                          CssClass="bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded-md">
                                Edit
                            </asp:LinkButton>
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" 
                                          CssClass="bg-red-600 hover:bg-red-700 text-white py-2 px-4 rounded-md"
                                          OnClientClick="return confirm('Are you sure you want to delete this user?');">
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
                    <p class="text-gray-600">No user selected. Please select a user from the list below.</p>
                </EmptyDataTemplate>
            </asp:FormView>
        </div>
        
        <!-- Grid View for User List -->
        <div>
            <h3 class="text-lg font-medium text-blue-700 mb-4">All Users</h3>
            <div class="overflow-x-auto">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USER_ID" 
                              DataSourceID="SqlDataSource1" CssClass="min-w-full bg-white border-collapse"
                              HeaderStyle-CssClass="bg-gradient-to-r from-teal-500 to-blue-500 text-white text-left"
                              RowStyle-CssClass="border-b hover:bg-blue-50" AlternatingRowStyle-CssClass="border-b bg-gray-50 hover:bg-blue-50"
                              CellPadding="8" GridLines="None" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle CssClass="border-b bg-gray-50 hover:bg-blue-50"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField DataField="USER_ID" HeaderText="ID" ReadOnly="True" SortExpression="USER_ID" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" >
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="USER_NAME" HeaderText="Name" SortExpression="USER_NAME" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" >
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="USER_EMAIL" HeaderText="Email" SortExpression="USER_EMAIL" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" >
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="CONTACT" HeaderText="Contact" SortExpression="CONTACT" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700" >
                            <HeaderStyle CssClass="bg-gray-50 p-4 font-semibold text-gray-700"></HeaderStyle>
                            <ItemStyle CssClass="p-4"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="User Type" SortExpression="USER_TYPE" ItemStyle-CssClass="p-4" HeaderStyle-CssClass="bg-gray-50 p-4 font-semibold text-gray-700">
                            <ItemTemplate>
                                <asp:Label ID="USER_TYPELabel" runat="server" Text='<%# Eval("USER_TYPE") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="USER_TYPEDropDownList" runat="server" SelectedValue='<%# Bind("USER_TYPE") %>'
                                                  CssClass="border rounded-md p-2 w-full focus:ring-2 focus:ring-teal-300 focus:border-teal-500">
                                    <asp:ListItem Text="Developer" Value="Developer"></asp:ListItem>
                                    <asp:ListItem Text="Tester" Value="Tester"></asp:ListItem>
                                    <asp:ListItem Text="Designer" Value="Designer"></asp:ListItem>
                                    <asp:ListItem Text="Manager" Value="Manager"></asp:ListItem>
                                    <asp:ListItem Text="Data Scientist" Value="Data Scientist"></asp:ListItem>
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
                                    OnClientClick="return confirm('Are you sure you want to delete this user?');">
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
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
            SelectCommand='SELECT * FROM "User"'
            DeleteCommand='DELETE FROM "User" WHERE "USER_ID" = :original_USER_ID AND (("USER_NAME" = :original_USER_NAME) OR ("USER_NAME" IS NULL AND :original_USER_NAME IS NULL)) AND (("USER_EMAIL" = :original_USER_EMAIL) OR ("USER_EMAIL" IS NULL AND :original_USER_EMAIL IS NULL)) AND (("CONTACT" = :original_CONTACT) OR ("CONTACT" IS NULL AND :original_CONTACT IS NULL)) AND (("USER_TYPE" = :original_USER_TYPE) OR ("USER_TYPE" IS NULL AND :original_USER_TYPE IS NULL))'
            InsertCommand='INSERT INTO "User" ("USER_ID", "USER_NAME", "USER_EMAIL", "CONTACT", "USER_TYPE") VALUES (:USER_ID, :USER_NAME, :USER_EMAIL, :CONTACT, :USER_TYPE)'
            UpdateCommand='UPDATE "User" SET "USER_NAME" = :USER_NAME, "USER_EMAIL" = :USER_EMAIL, "CONTACT" = :CONTACT, "USER_TYPE" = :USER_TYPE WHERE "USER_ID" = :original_USER_ID AND (("USER_NAME" = :original_USER_NAME) OR ("USER_NAME" IS NULL AND :original_USER_NAME IS NULL)) AND (("USER_EMAIL" = :original_USER_EMAIL) OR ("USER_EMAIL" IS NULL AND :original_USER_EMAIL IS NULL)) AND (("CONTACT" = :original_CONTACT) OR ("CONTACT" IS NULL AND :original_CONTACT IS NULL)) AND (("USER_TYPE" = :original_USER_TYPE) OR ("USER_TYPE" IS NULL AND :original_USER_TYPE IS NULL))'
            OldValuesParameterFormatString="original_{0}">
            <DeleteParameters>
                <asp:Parameter Name="original_USER_ID" Type="Decimal" />
                <asp:Parameter Name="original_USER_NAME" Type="String" />
                <asp:Parameter Name="original_USER_EMAIL" Type="String" />
                <asp:Parameter Name="original_CONTACT" Type="String" />
                <asp:Parameter Name="original_USER_TYPE" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="USER_ID" Type="Decimal" />
                <asp:Parameter Name="USER_NAME" Type="String" />
                <asp:Parameter Name="USER_EMAIL" Type="String" />
                <asp:Parameter Name="CONTACT" Type="String" />
                <asp:Parameter Name="USER_TYPE" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="USER_NAME" Type="String" />
                <asp:Parameter Name="USER_EMAIL" Type="String" />
                <asp:Parameter Name="CONTACT" Type="String" />
                <asp:Parameter Name="USER_TYPE" Type="String" />
                <asp:Parameter Name="original_USER_ID" Type="Decimal" />
                <asp:Parameter Name="original_USER_NAME" Type="String" />
                <asp:Parameter Name="original_USER_EMAIL" Type="String" />
                <asp:Parameter Name="original_CONTACT" Type="String" />
                <asp:Parameter Name="original_USER_TYPE" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <!-- SQL Data Source for FormView -->
        <asp:SqlDataSource ID="SqlDataSourceFormView" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
            SelectCommand='SELECT * FROM "User" WHERE "USER_ID" = :USER_ID'
            DeleteCommand='DELETE FROM "User" WHERE "USER_ID" = :original_USER_ID AND (("USER_NAME" = :original_USER_NAME) OR ("USER_NAME" IS NULL AND :original_USER_NAME IS NULL)) AND (("USER_EMAIL" = :original_USER_EMAIL) OR ("USER_EMAIL" IS NULL AND :original_USER_EMAIL IS NULL)) AND (("CONTACT" = :original_CONTACT) OR ("CONTACT" IS NULL AND :original_CONTACT IS NULL)) AND (("USER_TYPE" = :original_USER_TYPE) OR ("USER_TYPE" IS NULL AND :original_USER_TYPE IS NULL))'
            InsertCommand='INSERT INTO "User" ("USER_ID", "USER_NAME", "USER_EMAIL", "CONTACT", "USER_TYPE") VALUES (:USER_ID, :USER_NAME, :USER_EMAIL, :CONTACT, :USER_TYPE)'
            UpdateCommand='UPDATE "User" SET "USER_NAME" = :USER_NAME, "USER_EMAIL" = :USER_EMAIL, "CONTACT" = :CONTACT, "USER_TYPE" = :USER_TYPE WHERE "USER_ID" = :original_USER_ID AND (("USER_NAME" = :original_USER_NAME) OR ("USER_NAME" IS NULL AND :original_USER_NAME IS NULL)) AND (("USER_EMAIL" = :original_USER_EMAIL) OR ("USER_EMAIL" IS NULL AND :original_USER_EMAIL IS NULL)) AND (("CONTACT" = :original_CONTACT) OR ("CONTACT" IS NULL AND :original_CONTACT IS NULL)) AND (("USER_TYPE" = :original_USER_TYPE) OR ("USER_TYPE" IS NULL AND :original_USER_TYPE IS NULL))'
            OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="USER_ID" PropertyName="SelectedValue" Type="Decimal" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="original_USER_ID" Type="Decimal" />
                <asp:Parameter Name="original_USER_NAME" Type="String" />
                <asp:Parameter Name="original_USER_EMAIL" Type="String" />
                <asp:Parameter Name="original_CONTACT" Type="String" />
                <asp:Parameter Name="original_USER_TYPE" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="USER_ID" Type="Decimal" />
                <asp:Parameter Name="USER_NAME" Type="String" />
                <asp:Parameter Name="USER_EMAIL" Type="String" />
                <asp:Parameter Name="CONTACT" Type="String" />
                <asp:Parameter Name="USER_TYPE" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="USER_NAME" Type="String" />
                <asp:Parameter Name="USER_EMAIL" Type="String" />
                <asp:Parameter Name="CONTACT" Type="String" />
                <asp:Parameter Name="USER_TYPE" Type="String" />
                <asp:Parameter Name="original_USER_ID" Type="Decimal" />
                <asp:Parameter Name="original_USER_NAME" Type="String" />
                <asp:Parameter Name="original_USER_EMAIL" Type="String" />
                <asp:Parameter Name="original_CONTACT" Type="String" />
                <asp:Parameter Name="original_USER_TYPE" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>