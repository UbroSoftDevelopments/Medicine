<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="selectreceipt.aspx.cs" Inherits="Medicine.selectreceipt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="w3-row">
  <div class="w3-col s1 w3-mobile">&nbsp;</div>
  <div class="w3-col s10 w3-padding w3-center w3-mobile">
      <asp:GridView ID="GridView1" CssClass="w3-table-all w3-center w3-centered" 
          Width="100%" runat="server" AutoGenerateColumns="False" BackColor="White" 
          BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
          DataKeyNames="receiptno" DataSourceID="SqlDataSource1" GridLines="Vertical">
          <AlternatingRowStyle BackColor="#DCDCDC" />
          <Columns>
           
                  <asp:TemplateField HeaderText="Receipt No.">
                   <ItemTemplate>
                    RRGLC<%#Eval("receiptno") %>
                   </ItemTemplate>
                  </asp:TemplateField>
              <asp:BoundField DataField="customername" HeaderText="Customer Name" 
                  SortExpression="customername" />
                  <asp:TemplateField HeaderText="Date Of Bill">
                   <ItemTemplate>
                    <%#DateUtilities.dateFormat(Convert.ToDateTime(Eval("dateofpurchase"))) %>
                   </ItemTemplate>
                  </asp:TemplateField>
              
              <asp:BoundField DataField="address" HeaderText="Address" 
                  SortExpression="address" />
              <asp:BoundField DataField="mobileno" HeaderText="Mobileno" 
                  SortExpression="mobileno" />
             <asp:TemplateField HeaderText="Click To Print">
                   <ItemTemplate>
                    <a href="printreceipt.aspx?receiptno=<%#Eval("receiptno") %>">Print</a>
                   </ItemTemplate>
                  </asp:TemplateField>
          </Columns>
          <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
          <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
          <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
          <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
          <SortedAscendingCellStyle BackColor="#F1F1F1" />
          <SortedAscendingHeaderStyle BackColor="#0000A9" />
          <SortedDescendingCellStyle BackColor="#CAC9C9" />
          <SortedDescendingHeaderStyle BackColor="#000065" />
      </asp:GridView>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:sql6490744ConnectionString %>" 
          SelectCommand="SELECT * FROM customerdetails ORDER BY receiptno DESC">
      </asp:SqlDataSource>
  </div>
  <div class="w3-col s1 w3-mobile">&nbsp;</div>
 </div>
</asp:Content>
