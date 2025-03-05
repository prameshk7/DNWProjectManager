<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TESTFORM.aspx.cs" Inherits="DataCoursework.WebForm.TESTFORM" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PROJECT_ID,USER_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="PROJECT_ID" HeaderText="PROJECT_ID" ReadOnly="True" SortExpression="PROJECT_ID" />
                <asp:BoundField DataField="PROJECT_NAME" HeaderText="PROJECT_NAME" SortExpression="PROJECT_NAME" />
                <asp:BoundField DataField="PROJECT_STATUS" HeaderText="PROJECT_STATUS" SortExpression="PROJECT_STATUS" />
                <asp:BoundField DataField="PROJECT_START_DATE" HeaderText="PROJECT_START_DATE" SortExpression="PROJECT_START_DATE" />
                <asp:BoundField DataField="PROJECT_DUE_DATE" HeaderText="PROJECT_DUE_DATE" SortExpression="PROJECT_DUE_DATE" />
                <asp:BoundField DataField="USER_ID" HeaderText="USER_ID" ReadOnly="True" SortExpression="USER_ID" />
                <asp:BoundField DataField="USER_NAME" HeaderText="USER_NAME" SortExpression="USER_NAME" />
                <asp:BoundField DataField="USER_EMAIL" HeaderText="USER_EMAIL" SortExpression="USER_EMAIL" />
                <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
                <asp:BoundField DataField="USER_TYPE" HeaderText="USER_TYPE" SortExpression="USER_TYPE" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT u.USER_ID, u.USER_NAME, u.USER_EMAIL, u.CONTACT, u.USER_TYPE, p.PROJECT_ID, p.PROJECT_NAME, p.PROJECT_STATUS, p.PROJECT_START_DATE, p.PROJECT_DUE_DATE FROM &quot;User&quot; u, PROJECT p WHERE u.USER_ID = p.USER_ID AND (u.USER_ID = :user_id) ORDER BY p.PROJECT_START_DATE DESC">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="user_id" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="PROJECT_ID,MILESTONE_ID" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="PROJECT_ID" HeaderText="PROJECT_ID" ReadOnly="True" SortExpression="PROJECT_ID" />
                <asp:BoundField DataField="PROJECT_NAME" HeaderText="PROJECT_NAME" SortExpression="PROJECT_NAME" />
                <asp:BoundField DataField="PROJECT_STATUS" HeaderText="PROJECT_STATUS" SortExpression="PROJECT_STATUS" />
                <asp:BoundField DataField="PROJECT_START_DATE" HeaderText="PROJECT_START_DATE" SortExpression="PROJECT_START_DATE" />
                <asp:BoundField DataField="PROJECT_DUE_DATE" HeaderText="PROJECT_DUE_DATE" SortExpression="PROJECT_DUE_DATE" />
                <asp:BoundField DataField="MILESTONE_ID" HeaderText="MILESTONE_ID" ReadOnly="True" SortExpression="MILESTONE_ID" />
                <asp:BoundField DataField="MILESTONE_NAME" HeaderText="MILESTONE_NAME" SortExpression="MILESTONE_NAME" />
                <asp:BoundField DataField="MILESTONE_DUE_DATE" HeaderText="MILESTONE_DUE_DATE" SortExpression="MILESTONE_DUE_DATE" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT p.PROJECT_ID, p.PROJECT_NAME, p.PROJECT_STATUS, p.PROJECT_START_DATE, p.PROJECT_DUE_DATE, m.MILESTONE_ID, m.MILESTONE_NAME, m.MILESTONE_DUE_DATE FROM PROJECT p, MILESTONE m WHERE p.PROJECT_ID = m.PROJECT_ID AND (p.PROJECT_ID = :project_id) ORDER BY m.MILESTONE_DUE_DATE">
            <SelectParameters>
                <asp:Parameter DefaultValue="101" Name="project_id" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="USER_ID" DataSourceID="SqlDataSource3">
            <Columns>
                <asp:BoundField DataField="USER_ID" HeaderText="USER_ID" ReadOnly="True" SortExpression="USER_ID" />
                <asp:BoundField DataField="USER_NAME" HeaderText="USER_NAME" SortExpression="USER_NAME" />
                <asp:BoundField DataField="USER_EMAIL" HeaderText="USER_EMAIL" SortExpression="USER_EMAIL" />
                <asp:BoundField DataField="COMPLETED_TASKS" HeaderText="COMPLETED_TASKS" SortExpression="COMPLETED_TASKS" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;User&quot;.&quot;USER_ID&quot;, &quot;User&quot;.&quot;USER_NAME&quot;, &quot;User&quot;.&quot;USER_EMAIL&quot;, COUNT(TASK.&quot;TASK_ID&quot;) AS COMPLETED_TASKS
FROM &quot;User&quot;
JOIN PROJECT ON PROJECT.USER_ID = &quot;User&quot;.&quot;USER_ID&quot;
JOIN PROJECTTASK ON PROJECT.&quot;PROJECT_ID&quot; = PROJECTTASK.PROJECT_ID
JOIN TASK ON PROJECTTASK.TASK_ID = TASK.&quot;TASK_ID&quot;
WHERE TASK.&quot;TASK_STATUS&quot; = 'Completed'
GROUP BY &quot;User&quot;.&quot;USER_ID&quot;, &quot;User&quot;.&quot;USER_NAME&quot;, &quot;User&quot;.&quot;USER_EMAIL&quot;
ORDER BY COMPLETED_TASKS DESC"></asp:SqlDataSource>
    </form>
</body>
</html>
