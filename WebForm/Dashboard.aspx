<%@ Page Language="C#" MasterPageFile="~/layout/Site1.master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="DataCoursework.WebForm.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Dashboard - LS Project Manager</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.3/dist/chart.umd.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mx-auto p-6">
        <h2 class="text-2xl font-bold text-gray-800 mb-6">Welcome to LS Project Manager</h2>
        
        <!-- Widgets Section -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">
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

        <!-- Task Status Overview (Bar Chart) -->
        <div class="bg-white p-6 rounded-lg shadow-md mb-6">
            <h3 class="text-lg font-semibold text-gray-700 mb-4">Task Status Overview</h3>
            <div class="w-full">
                <canvas id="taskStatusChart" height="100"></canvas>
            </div>
        </div>

        <!-- Project Status Distribution (Pie Chart) -->
        <div class="bg-white p-6 rounded-lg shadow-md">
            <h3 class="text-lg font-semibold text-gray-700 mb-4">Project Status Distribution</h3>
            <div class="w-full max-w-xs mx-auto">
                <canvas id="projectStatusChart" height="150"></canvas>
            </div>
        </div>

        <!-- Hidden SqlDataSource and Repeater for Task Status (Bar Chart) -->
        <asp:SqlDataSource ID="SqlDataSourceTaskStatus" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="Oracle.ManagedDataAccess.Client"
            SelectCommand='SELECT "TASK_STATUS", COUNT(*) AS "TASK_COUNT" FROM "USERTASK" GROUP BY "TASK_STATUS"' />
        <asp:Repeater ID="RepeaterTaskStatus" runat="server" DataSourceID="SqlDataSourceTaskStatus">
            <ItemTemplate>
                <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("TASK_STATUS") %>' Visible="false" />
                <asp:Label ID="lblCount" runat="server" Text='<%# Eval("TASK_COUNT") %>' Visible="false" />
            </ItemTemplate>
        </asp:Repeater>

        <!-- Hidden SqlDataSource and Repeater for Project Status (Pie Chart) -->
        <asp:SqlDataSource ID="SqlDataSourceProjectStatus" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="Oracle.ManagedDataAccess.Client"
            SelectCommand='SELECT "PROJECT_STATUS", COUNT(*) AS "PROJECT_COUNT" FROM "USERPROJECT" GROUP BY "PROJECT_STATUS"' />
        <asp:Repeater ID="RepeaterProjectStatus" runat="server" DataSourceID="SqlDataSourceProjectStatus">
            <ItemTemplate>
                <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("PROJECT_STATUS") %>' Visible="false" />
                <asp:Label ID="lblCount" runat="server" Text='<%# Eval("PROJECT_COUNT") %>' Visible="false" />
            </ItemTemplate>
        </asp:Repeater>

        <!-- JavaScript to render the charts -->
        <script type="text/javascript">
            document.addEventListener('DOMContentLoaded', function () {
                // Task Status Bar Chart
                if (typeof taskStatusData === 'undefined') {
                    taskStatusData = [];
                }
                var taskLabels = taskStatusData.map(item => item.status);
                var taskData = taskStatusData.map(item => item.count);

                var taskCtx = document.getElementById('taskStatusChart').getContext('2d');
                new Chart(taskCtx, {
                    type: 'bar',
                    data: {
                        labels: taskLabels,
                        datasets: [{
                            label: 'Number of Tasks',
                            data: taskData,
                            backgroundColor: [
                                'rgba(54, 162, 235, 0.6)',  
                                'rgba(255, 99, 132, 0.6)',  
                                'rgba(255, 206, 86, 0.6)',  
                                'rgba(75, 192, 192, 0.6)',  
                            ],
                            borderColor: [
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 99, 132, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true,
                                title: {
                                    display: true,
                                    text: 'Number of Tasks'
                                }
                            },
                            x: {
                                title: {
                                    display: true,
                                    text: 'Task Status'
                                }
                            }
                        },
                        plugins: {
                            legend: {
                                display: false
                            }
                        }
                    }
                });

                // Project Status Pie Chart
                if (typeof projectStatusData === 'undefined') {
                    projectStatusData = [];
                }
                var projectLabels = projectStatusData.map(item => item.status);
                var projectData = projectStatusData.map(item => item.count);

                var projectCtx = document.getElementById('projectStatusChart').getContext('2d');
                new Chart(projectCtx, {
                    type: 'pie',
                    data: {
                        labels: projectLabels,
                        datasets: [{
                            data: projectData,
                            backgroundColor: [
                                'rgba(54, 162, 235, 0.6)', 
                                'rgba(255, 99, 132, 0.6)',  
                                'rgba(255, 206, 86, 0.6)',  
                                'rgba(75, 192, 192, 0.6)', 
                            ],
                            borderColor: [
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 99, 132, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        plugins: {
                            legend: {
                                position: 'bottom'
                            }
                        }
                    }
                });
            });
        </script>
    </div>
</asp:Content>