<%@ Page Language="C#" MasterPageFile="~/layout/Site1.master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="DataCoursework.WebForm.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Dashboard - LS Project Manager</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mx-auto p-6">
        <h2 class="text-2xl font-bold text-gray-800 mb-6">Welcome to LS Project Manager</h2>
        
        <!-- Widgets Section -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <!-- User Projects Widget -->
            <a href="<%=ResolveUrl("~/WebForm/userProjectCQ.aspx")%>" class="block bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition-shadow flex items-center">
                <div>
                    <h3 class="text-lg font-semibold text-gray-700">User Projects</h3>
                    <p class="text-gray-600 text-sm">Explore user details and their project assignments.</p>
                </div>
            </a>

            <!-- Project Milestones Widget -->
            <a href="<%=ResolveUrl("~/WebForm/ProjectMilestoneCQ.aspx")%>" class="block bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition-shadow flex items-center">
                <div>
                    <h3 class="text-lg font-semibold text-gray-700">Project Milestones</h3>
                    <p class="text-gray-600 text-sm">Track project progress and key milestones.</p>
                </div>
            </a>

            <!-- Top Performers Widget -->
            <a href="<%=ResolveUrl("~/WebForm/TopPerformerCQ.aspx")%>" class="block bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition-shadow flex items-center">
                <div>
                    <h3 class="text-lg font-semibold text-gray-700">Top Performers</h3>
                    <p class="text-gray-600 text-sm">Recognize top task completers in projects.</p>
                </div>
            </a>
        </div>

    </div>
</asp:Content>