<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="mrpdetails.aspx.cs" Inherits="Medicine.mrpdetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="w3-row w3-mobile">

<div class="w3-col s12 w3-padding w3-center">
    <asp:GridView ID="GridView1" CssClass="w3-table-all w3-center w3-centered" 
        Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="sno" DataSourceID="SqlDataSource1" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
           <asp:TemplateField HeaderText="Product Name">
           <ItemTemplate>
           <%#ProductUtilities.GetProductNameByProductNo(Convert.ToInt32(Eval("productno"))) %>
           </ItemTemplate>
           </asp:TemplateField>
           
            <asp:BoundField DataField="batchno" HeaderText="Batch No." 
                SortExpression="batchno" />
            <asp:BoundField DataField="mrp" HeaderText="MRP" SortExpression="mrp" />
            <asp:TemplateField HeaderText="Expiry Date">
            <ItemTemplate>
            <%#DateUtilities.dateFormat(Convert.ToDateTime(Eval("expirydate"))) %>
            </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Packing Type">
            <ItemTemplate>
            <%#ProductUtilities.GetProductPackingFromProductNo(Convert.ToInt32(Eval("productno"))) %>
            </ItemTemplate>
            </asp:TemplateField>
           <asp:BoundField DataField="rackno" HeaderText="Rack No." 
                SortExpression="rackno" />
                <asp:TemplateField HeaderText="Firm Name">
                <ItemTemplate>
                <%#ProductUtilities.GetFirmNameFromBillNo(Convert.ToInt32(Eval("billno"))) %>
                </ItemTemplate>
                </asp:TemplateField>
           
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:medicineConnectionString %>" 
        SelectCommand="SELECT * FROM medicinestock WHERE (productno = @productno) ORDER BY mrp">
        <SelectParameters>
            <asp:QueryStringParameter Name="productno" QueryStringField="pno" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>

</div>
</asp:Content>
