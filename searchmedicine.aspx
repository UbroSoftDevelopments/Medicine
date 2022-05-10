<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="searchmedicine.aspx.cs" Inherits="Medicine.searchmedicine" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  .visibleclass
  {
      display:block;
  }
   .invisibleclass
  {
      display:none;
  }
  </style>
</head>
<body>

<div class="container">
 
    
 
<asp:Panel id="id01" cssClass="w3-modal " runat="server">
  <div class="w3-modal-content w3-green w3-card w3-round">
    <div class="w3-container">
      <span onclick="document.getElementById('ContentPlaceHolder1_id01').style.display='none'" 
      class="w3-button w3-display-topright">&times;</span>
      <center>
      <h2 class="w3-text-red">
      Alert!!
      </h2>
      </center>
      <p>There Are Few Medicines Which are Going To Expire Soon...</p>
      <center>
      <a href="medicinenearexpiry.aspx" class=" w3-round w3-button w3-deep-purple w3-card">Check Medicines</a>
      </center>
    </div>
  </div>
</asp:Panel>
  </div>




<br /><br />
<div class="w3-row w3-mobile">
<div class="w3-col s3"><br /></div>
<div class="w3-col s6 w3-card-4 w3-centered">
<center>
   
    
    <asp:Label CssClass="w3-text-deep-purple w3-margin-top w3-center w3-large" ID="lblname" runat="server" Text="Enter Medicine Name"></asp:Label><br />
   <div class="w3-row">
   <div class="w3-col s2"><br /></div>
   <div class="w3-col w3-margin-top s8">
    <asp:TextBox CssClass=" w3-round w3-center w3-col w3-card " ID="Txtname" placeholder="Enter Name Of Medicine" runat="server"></asp:TextBox>
   
   </div>
   
   </div>
   <br />
    <asp:Button ID="btselect"  class=" w3-round-xxlarge w3-btn w3-purple" 
        runat="server" Text="Search" onclick="btselect_Click"  />
   <br /> <br /> <br />

</center>
</div>

</div>
 <br /> <br /> <br /> 
 <div class="w3-row">
 <div class="w3-col s1"><br /></div>
 <div class="w3-col s10 w3-centered">
 <asp:GridView ID="gvMedicine" style="width:100%" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="sno" DataSourceID="SqlDataSource1" BackColor="White" 
        BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        GridLines="Horizontal" onrowdatabound="gvMedicine_RowDataBound">
     <AlternatingRowStyle BackColor="#F7F7F7" />
     <Columns>
           <asp:BoundField DataField="sno" HeaderText="S No." 
             SortExpression="batchno" ItemStyle-CssClass="w3-hide" HeaderStyle-CssClass="w3-hide" />
             <asp:TemplateField HeaderText="Name">
             <ItemTemplate>
             <%# ProductUtilities.GetProductNameByProductNo(Convert.ToInt32(Eval("productno"))) %>
             </ItemTemplate>
             </asp:TemplateField>
         <asp:BoundField DataField="batchno" HeaderText="Batch No." 
             SortExpression="batchno" />
         <asp:BoundField DataField="mrp" HeaderText="Mrp" SortExpression="mrp" />
         <asp:BoundField DataField="rateafterdiscount" HeaderText="Rate After Discount" 
             SortExpression="rateafterdiscount" />
             <asp:TemplateField HeaderText="Manufacturing Date">
             <ItemTemplate>
             <%# DateUtilities.dateFormat(Eval("mfgdate")) %>
             </ItemTemplate>
             
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Expiry Date">
             <ItemTemplate>
             <%# DateUtilities.dateFormat(Eval("expirydate")) %>
             </ItemTemplate>
             
             </asp:TemplateField>

             
             

              <asp:TemplateField HeaderText="Total Quantity In Stock ">
             <ItemTemplate>
             <%# StockUtilities.GetTotalStockByPnoAndBatchNo(Convert.ToInt32(Eval("productno")),""+(Eval("batchno"))) %>
             </ItemTemplate>
             
             </asp:TemplateField>

  <asp:TemplateField HeaderText="Medicine Type ">
             <ItemTemplate>
             <%# ProductUtilities.GetUnitName(Convert.ToInt32(Eval("unit"))) %>
             </ItemTemplate>
             
             </asp:TemplateField>


        
         <asp:BoundField DataField="hsn" HeaderText="Hsn No." SortExpression="hsn" />
         <asp:BoundField DataField="rackno" HeaderText="Rack No." 
             SortExpression="rackno" />
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
</div>
 </div>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:sql6490744ConnectionString %>" 
        SelectCommand="SELECT sno, productno, batchno, mrp, rateafterdiscount, mfgdate, expirydate, boxno, stripinsidebox, medicineinsidestrip, unit, hsn, rackno FROM medicinestock WHERE (productno IN (SELECT TOP (100) PERCENT productno FROM products WHERE (productname LIKE '%' + @name + '%') ORDER BY productname))">
        <SelectParameters>
            <asp:ControlParameter ControlID="Txtname" DefaultValue="%" Name="name" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
