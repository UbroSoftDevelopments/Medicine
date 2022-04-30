<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="countersale.aspx.cs" Inherits="Medicine.countersale" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="w3-row">

<div class="w3-col s12 w3-center w3-padding w3-card-4 w3-centered w3-white w3-round-large" style="border-width:medium;border-style:double;border-color:Black">

<u><b style="font-size:x-large">Sale Details</b></u><br />
<asp:Label ID="lblmessage" CssClass="w3-large w3-text-blue" runat="server" Text=""></asp:Label>
<div class="w3-row w3-mobile">
<div class="w3-col s3 w3-mobile"><br /></div>
<div class="w3-col s3 w3-padding w3-mobile">
<asp:Label ID="Label1" CssClass="w3-large" runat="server" Text="IP No."></asp:Label>
    <asp:TextBox ID="txtipno" CssClass="w3-round w3-sand w3-border w3-input w3-border-black"  runat="server"></asp:TextBox>
</div>
<div class="w3-col s1 w3-padding w3-mobile">
<br />
    <asp:Button ID="btcheckip" class=" w3-round-xxlarge w3-btn w3-purple" 
        runat="server" Text="Search Patient" onclick="btcheckip_Click" />
</div>
</div>
<div class="w3-row w3-mobile">
   <div class="w3-col s3 w3-padding">
    <asp:Label ID="lblname" CssClass="w3-large" runat="server" Text="Name"></asp:Label><br />
    <asp:TextBox ID="txtname" CssClass="w3-round w3-sand w3-border w3-input w3-border-black"  runat="server"></asp:TextBox><br />
    </div>
    <div class="w3-col s3 w3-padding">
 <asp:Label ID="lbldate" CssClass=" w3-large" runat="server" Text="Date"></asp:Label><br />
 <asp:TextBox ID="txtdate" AutoComplete="off" CssClass="w3-round  w3-sand w3-center w3-border w3-input w3-border-black"  runat="server"></asp:TextBox><br />
  </div>
    <div class="w3-col s3 w3-padding">
     <asp:Label ID="lbladdress" CssClass="w3-large" runat="server" Text="Address"></asp:Label><br />
    <asp:TextBox ID="txtaddress" CssClass="w3-round w3-sand w3-border w3-input w3-border-black" runat="server"></asp:TextBox><br />
 </div>
  <div class="w3-col s3 w3-padding">
   <asp:Label ID="lblmobileno" CssClass="w3-large" runat="server" Text="Mobileno"></asp:Label>
    <asp:TextBox ID="txtmobileno" CssClass="w3-round w3-sand w3-border w3-input w3-border-black" runat="server"></asp:TextBox>
   </div>
   </div>
<div class="w3-row">
<div class="w3-col s6 w3-padding">
<asp:Label ID="lblmedicinename" CssClass="w3-large w3-center" runat="server" Text=" Medicine Name"></asp:Label>
    <asp:DropDownList ID="ddmedicinename" Font-Bold="true" CssClass="w3-input w3-round w3-border w3-sand w3-border-black" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="productname"  OnSelectedIndexChanged="ddmedicinename_SelectedIndexChanged" AutoPostBack="true"  
        DataValueField="sno"  OnDataBound="medicineSelectedDefault">
    </asp:DropDownList>
   </div>
   <div class="w3-col s3 w3-padding">
    <asp:Label ID="lblstripinsidebox" CssClass="w3-large" runat="server" Text=" Number Of Strip"></asp:Label>
    <asp:TextBox ID="txtstripinsidebox" CssClass="w3-round w3-sand w3-border w3-input w3-border-black" runat="server"></asp:TextBox>
   </div>
   <div class="w3-col s3 w3-padding">
   <asp:Label ID="lblmedicineinsidestrip" CssClass="w3-large" runat="server" Text="Medicine Inside Strip"></asp:Label>
    <asp:TextBox ID="txtmedicineinsidestrip" ReadOnly="true" CssClass="w3-round w3-sand w3-border w3-border-black w3-input" runat="server"></asp:TextBox>
   </div>
</div>
<div class="w3-row">
<div class="w3-col s3 w3-padding"><br /></div>
<div class="w3-col s3 w3-padding ">
<asp:Label ID="lblreff" CssClass="w3-large" runat="server" Text="Referred From"></asp:Label>
<asp:TextBox ID="txtreff" CssClass="w3-round w3-sand w3-border w3-input w3-border-black" runat="server"></asp:TextBox>
</div>
<div class="w3-col s3 w3-padding">
 <asp:Label ID="lblextra" CssClass="w3-large" runat="server" Text="Extra Medicine"></asp:Label>
 <asp:TextBox ID="txtextra" CssClass="w3-round w3-sand w3-border w3-input w3-border-black" runat="server"></asp:TextBox>
 </div>
<div class="w3-col s3 w3-padding"><br /></div>
</div>
<br />
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:medicineConnectionString %>" 
        SelectCommand="SELECT medicine.products.productname + ', Batch: ' + medicine.medicinestock.batchno + ', Expiry Date: ' + FORMAT(medicine.medicinestock.expirydate, 'dd-MMM-yyyy', 'en-US') AS productname, medicine.medicinestock.mfgdate, medicine.medicinestock.expirydate, medicine.medicinestock.boxno, medicine.medicinestock.stripinsidebox, medicine.medicinestock.medicineinsidestrip, medicine.medicinestock.unit, medicine.medicinestock.hsn, medicine.medicinestock.rackno, medicine.medicinestock.productno, medicine.medicinestock.sno FROM medicine.medicinestock INNER JOIN medicine.products ON medicine.medicinestock.productno = medicine.products.productno ORDER BY medicine.products.productno, medicine.medicinestock.expirydate">
    </asp:SqlDataSource>
    <div class="w3-row">
    <center>
    <asp:Button ID="btadd"  class=" w3-round-xxlarge w3-btn w3-purple" 
        runat="server" Text="Add To Bill" onclick="btadd_Click" />
        </center>
        </div>
        </div>
        <div class="w3-row">
         <div class="w3-col s6 w3-padding w3-center">
             <asp:Label ID="lbltotalmedicine" CssClass="w3-large w3-text-red" Font-Bold="true" runat="server" Text=""></asp:Label> 
         </div>
          <div class="w3-col s6 w3-padding w3-center">
             <asp:Label ID="lbltotalamount" CssClass="w3-large w3-text-red" Font-Bold="true" runat="server" Text=""></asp:Label> 
         </div>
        </div>
        <div class="w3-row w3-mobile w3-centered">
       
    <asp:GridView ID="GridView1" style="width:100%" runat="server" BackColor="White" 
        BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        GridLines="Horizontal" AutoGenerateColumns="False" DataKeyNames="sno" 
                DataSourceID="SqlDataSource2" ondatabound="GridView1_DataBound">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
           <asp:TemplateField HeaderText="Medicine Name">
            <ItemTemplate>
             <%# ProductUtilities.GetMedicineNameByStockSno(Convert.ToInt32(Eval("medicineno")))%>
            </ItemTemplate>
           </asp:TemplateField>
          
            <asp:BoundField DataField="stripinsidebox" HeaderText="stripInside Box" 
                SortExpression="stripinsidebox" />
            <asp:BoundField DataField="medicineinsidestrip" 
                HeaderText="MedicineInside Strip" SortExpression="medicineinsidestrip" />
            <asp:BoundField DataField="extra" HeaderText="Extra Medicine" SortExpression="extra" />
            <asp:BoundField DataField="price" HeaderText="Price(Per Piece)" SortExpression="price" />
            <asp:TemplateField HeaderText="Quantity">
             <ItemTemplate>
              <%# (Convert.ToInt32(Eval("stripinsidebox")) * Convert.ToInt32(Eval("medicineinsidestrip"))) + Convert.ToInt32(Eval("extra"))%>
             </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Amount">
            <ItemTemplate>
             <%# ((Convert.ToInt32(Eval("stripinsidebox")) * Convert.ToInt32(Eval("medicineinsidestrip"))) + Convert.ToInt32(Eval("extra")))*Convert.ToDouble(Eval("price"))%>
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
    
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:medicineConnectionString %>" 
                SelectCommand="SELECT * FROM medicine.countersalecart ORDER BY [sno] DESC"
                DeleteCommand="Delete from medicine.countersalecart where sno=@sno">
            </asp:SqlDataSource>
    
     </div>
<br />

<center>
 <asp:Button ID="btsave"  class=" w3-round-xxlarge w3-btn w3-purple w3-border w3-border-black" 
        runat="server" Text="Proceed To Pay" onclick="btsave_Click" Visible="false"/>
        <asp:Button ID="btclear"  class=" w3-round-xxlarge w3-btn w3-purple" 
        runat="server" Text="Clear Cart" onclick="btclear_Click"/>
        <asp:HyperLink ID="hypReceipt" CssClass="w3-purple w3-round w3-large w3-button w3-border w3-border-black" Visible="false"  runat="server">Discount</asp:HyperLink>
       
        </center>

</div>
<div class="w3-col s1"><br /></div>



<br />


 <script type="text/javascript">
     $(function () {
         $(function () {
             var currentYear = (new Date).getFullYear();
             var currentMonth = (new Date).getMonth() + 1;
             var currentDay = (new Date).getDate();
             $("#datepicker").datepicker({ minDate: new Date((currentYear - 1), 12, 1), dateFormat: 'dd/mm/yy', maxDate: new Date(currentYear, 11, 31) });

             $("#ContentPlaceHolder1_txtdate").datepicker({
             
                 changeMonth: true,
                 changeYear: true,
                 yearRange: '1950:currentYear',
                 dateFormat: 'dd-M-yy',
                 defaultDate: 'currentdate'
             });
         });

     });
 </script>

</asp:Content>
