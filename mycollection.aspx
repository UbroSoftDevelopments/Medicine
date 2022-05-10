<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="mycollection.aspx.cs" Inherits="Medicine.mycollection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="w3-row">
    <div class="w3-col s2">&nbsp;</div>
    <div class="w3-col s8 w3-pale-green w3-padding">
        <center>
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label><br />
            <div class="w3-padding-small">
                <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="w3-border w3-border-deep-orange w3-sand w3-padding-small w3-round" placeholder="Select Date"></asp:TextBox>
                <asp:Button ID="btnRefresh" OnClick="doRefresh" runat="server" Text="Refresh" CssClass=" w3-button w3-teal w3-round-large" />
            </div>
            <% if( Medicine.DataManager.LoginManager.IsAdminLoggedIn(Session)){ %>
                <div class="w3-padding-small">
                    <b>Select User</b>
                    <asp:DropDownList AutoPostBack="True" ID="drpUsers" runat="server" 
                    CssClass="w3-border w3-border-deep-purple w3-light-gray w3-padding-small w3-round" 
                    DataSourceID="SqlDataSource3" DataTextField="userid" DataValueField="userno" onselectedindexchanged="drpUsers_SelectedIndexChanged"></asp:DropDownList><br />
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                        ConnectionString="<%$ ConnectionStrings:sql6490744ConnectionString %>" 
                        SelectCommand="SELECT * FROM siteusers WHERE ([status] = @status) ORDER BY [userid]">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="active" Name="status" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            <% } %>
            <asp:Label ID="lblTotal" Font-Bold="true" runat="server" Text=""></asp:Label><br />
        </center>
        <asp:HiddenField ID="todayDate" runat="server" />
        <asp:HiddenField ID="user" runat="server" />
        <div>
       
            <asp:GridView ID="grdPays" OnRowDataBound="onRowBound" OnDataBound="setTotal" runat="server" 
                CssClass="w3-table-all" AutoGenerateColumns="False" 
                DataKeyNames="sno" DataSourceID="SqlDataSource1" ShowFooter="True">
                <EmptyDataTemplate>
                    <div class="w3-padding w3-pale-blue w3-round-large w3-card-4 w3-border w3-border-blue w3-text-blue w3-large">
                        <b>Sorry No Records Found !!!</b>
                    </div>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField HeaderText="Date Of Payment">
                     <ItemTemplate>
                      <%#DateUtilities.dateFormat(Convert.ToDateTime(Eval("dateofpayment")))%>
                     </ItemTemplate>
                    </asp:TemplateField>
                   
                    <asp:BoundField DataField="amount" HeaderText="Amount" 
                        SortExpression="amount" />
                    <asp:BoundField DataField="receiptno" HeaderText="Receipt No" 
                        SortExpression="receiptno" />
                        <asp:TemplateField HeaderText="User Name">
                         <ItemTemplate>
                          <%# Medicine.DataManager.LoginManager.GetUsernamByUserNo(Convert.ToInt32(Eval("currentuser")))%>
                         </ItemTemplate>
                        </asp:TemplateField>
                    
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:sql6490744ConnectionString %>" 
                
                SelectCommand="SELECT * FROM paymentfrommedicine WHERE ((currentuser = @currentuser) AND ([dateofpayment] = @dateofpayment))">
                <SelectParameters>
                    <asp:ControlParameter Name="currentuser" ControlID="user" Type="Int32" PropertyName="Value" />
                    <asp:ControlParameter Name="dateofpayment" ControlID="todayDate" Type="DateTime" PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <br />
    </div>
    <div class="w3-col s2">&nbsp;</div>
</div>
<br />
</asp:Content>
