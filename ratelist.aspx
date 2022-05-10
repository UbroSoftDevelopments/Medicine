<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ratelist.aspx.cs" Inherits="Medicine.ratelist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br />
<div class="w3-row w3-mobile">
<div class="w3-col s2">
<br />
</div>
<div class="w3-col s8 w3-centered">
<center>
<div class="w3-bar s8 w3-centered w3-amber w3-large w3-text-deep-purple">  Margins Per Product </div>
</center>
    <asp:GridView style="width:100%" ID="GridView1" runat="server" 
        AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="productno" 
        DataSourceID="SqlDataSource1" GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
          
                <asp:TemplateField HeaderText="Product Name">
                <ItemTemplate>
                <%# ProductUtilities.GetProductNameByProductNo(Convert.ToInt32(Eval("productno")))%>
                </ItemTemplate>
                </asp:TemplateField>
           <asp:TemplateField HeaderText="Product Type">
           <ItemTemplate>
           <%# ProductUtilities.GetProductPackingFromProductNo(Convert.ToInt32(Eval("productno"))) %>
           </ItemTemplate>
           
           </asp:TemplateField>
            
           
            <asp:BoundField DataField="purchaserate" HeaderText="Purchase Rate" 
                SortExpression="purchaserate" />
            <asp:BoundField DataField="rateforsale" HeaderText="Selling Rate" 
                SortExpression="rateforsale" />
                <asp:TemplateField HeaderText="Margin Rupees">
                <ItemTemplate>
                <%# Utilities.getMargin(Convert.ToDouble( Eval("purchaserate")),Convert.ToDouble(Eval("rateforsale"))) %>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Margin Percentage">
                <ItemTemplate>
                <%# Utilities.getMarginPercentage(Convert.ToDouble(Eval("purchaserate")),Convert.ToDouble(Eval("rateforsale"))) %>
                </ItemTemplate>
                </asp:TemplateField>
                        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:sql6490744ConnectionString %>" 
        SelectCommand="SELECT * FROM productbatch ORDER BY purchaserate">
    </asp:SqlDataSource>
</div>
</div>
<br /><br /><br /><br /><br /><br />

</asp:Content>
