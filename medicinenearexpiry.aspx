<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="medicinenearexpiry.aspx.cs" Inherits="Medicine.medicinenearexpiry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
<div class="w3-row w3-mobile">
<div class="w3-col s3"><br /></div>
<div class="w3-col s6 w3-card-4 w3-centered w3-light-gray w3-round-large" style="border-width:medium;border-style:solid;border-color:Black">
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
 <br /> 
 <div class="w3-row">

 <div class="w3-col s12 w3-centered">
 <asp:GridView ID="gvMedicine" style="width:100%" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="sno" DataSourceID="SqlDataSource1" BackColor="White"
        BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        GridLines="Horizontal">
     <AlternatingRowStyle BackColor="#F7F7F7" />
     <Columns>
       
        
             <asp:TemplateField HeaderText="Product Name">
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

           <asp:BoundField DataField="DaysForExpiry" HeaderText="DaysForExpiry" 
               ReadOnly="True" SortExpression="DaysForExpiry" />
          
            

              <asp:TemplateField HeaderText="Total Quantity In Stock ">
             <ItemTemplate>
             <%# StockUtilities.GetTotalStockByPnoAndBatchNo(Convert.ToInt32(Eval("productno")),""+Eval("batchno")) %>
             </ItemTemplate>
             
             </asp:TemplateField>
       <asp:TemplateField HeaderText="Medicine Type ">
             <ItemTemplate>
             <%# ProductUtilities.GetUnitName(Convert.ToInt32(Eval("unit"))) %>
             </ItemTemplate>
             
             </asp:TemplateField>
           <asp:BoundField DataField="hsn" HeaderText="Hsn No." SortExpression="Hsn No." />
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
        ConnectionString="<%$ ConnectionStrings:medicineConnectionString %>" 
        
        
        
        SelectCommand="SELECT sno, productno, batchno, mrp, rateafterdiscount, mfgdate, expirydate, DATEDIFF(day, GETDATE(), expirydate) AS DaysForExpiry, boxno, stripinsidebox, medicineinsidestrip, unit, hsn, rackno FROM medicine.medicinestock WHERE (productno IN (SELECT productno FROM medicine.products WHERE (productname LIKE '%' + @name + '%'))) AND (DATEDIFF(day, GETDATE(), expirydate) <= 60)">
        <SelectParameters>
           
            <asp:ControlParameter ControlID="Txtname" DefaultValue="%" Name="name" 
                PropertyName="Text" />
           
        </SelectParameters>
    </asp:SqlDataSource>
    <br /><br /><br />
<div class="w3-row w3-mobile">
<div class="w3-col s3"><br /></div>
<div class="w3-col s6 w3-card-4 w3-centered w3-light-gray w3-round-large" style="border-width:medium;border-style:solid;border-color:Black">
<center>
   
    
    <asp:Label CssClass="w3-text-deep-purple w3-margin-top w3-center w3-large" ID="Label1" runat="server" Text="Enter Medicine Name"></asp:Label><br />
   <div class="w3-row">
   <div class="w3-col s2"><br /></div>
   <div class="w3-col w3-margin-top s8">
    <asp:TextBox CssClass=" w3-round w3-center w3-col w3-card " ID="TextBox1" placeholder="Enter Name Of Medicine" runat="server"></asp:TextBox>
   
   </div>
   
   </div>
   <br />
    <asp:Button ID="Button1"  class=" w3-round-xxlarge w3-btn w3-purple" 
        runat="server" Text="Search" onclick="btselect_Click"  />
   <br /> <br /> <br />

</center>
</div>

</div>
 <br /> 
 <div class="w3-row">

 <div class="w3-col s12 w3-centered">
 <asp:GridView ID="GridView1" style="width:100%" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="sno" DataSourceID="SqlDataSource1" BackColor="White"
        BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        GridLines="Horizontal">
     <AlternatingRowStyle BackColor="#F7F7F7" />
     <Columns>
       
        
             <asp:TemplateField HeaderText="Product Name">
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

           <asp:BoundField DataField="DaysForExpiry" HeaderText="DaysForExpiry" 
               ReadOnly="True" SortExpression="DaysForExpiry" />
          
            

              <asp:TemplateField HeaderText="Total Quantity In Stock ">
             <ItemTemplate>
             <%# StockUtilities.GetTotalStockByPnoAndBatchNo(Convert.ToInt32(Eval("productno")),""+Eval("batchno")) %>
             </ItemTemplate>
             
             </asp:TemplateField>
       <asp:TemplateField HeaderText="Medicine Type ">
             <ItemTemplate>
             <%# ProductUtilities.GetUnitName(Convert.ToInt32(Eval("unit"))) %>
             </ItemTemplate>
             
             </asp:TemplateField>
           <asp:BoundField DataField="hsn" HeaderText="Hsn No." SortExpression="Hsn No." />
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
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:medicineConnectionString %>" 
        
        
        
        SelectCommand="SELECT sno, productno, batchno, mrp, rateafterdiscount, mfgdate, expirydate, DATEDIFF(day, GETDATE(), expirydate) AS DaysForExpiry, boxno, stripinsidebox, medicineinsidestrip, unit, hsn, rackno FROM medicine.medicinestock WHERE (productno IN (SELECT productno FROM medicine.products WHERE (productname LIKE '%' + @name + '%'))) AND (DATEDIFF(day, GETDATE(), expirydate) <= 60)">
        <SelectParameters>
           
            <asp:ControlParameter ControlID="Txtname" DefaultValue="%" Name="name" 
                PropertyName="Text" />
           
        </SelectParameters>
    </asp:SqlDataSource>
    <br /><br />
</asp:Content>
