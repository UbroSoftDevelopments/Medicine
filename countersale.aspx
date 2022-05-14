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
        ConnectionString="<%$ ConnectionStrings:sql6490744ConnectionString %>" 
        SelectCommand="SELECT products.productname + ', Batch: ' + medicinestock.batchno + ', Expiry Date: ' + FORMAT(medicinestock.expirydate, 'dd-MMM-yyyy', 'en-US') AS productname, medicinestock.mfgdate, medicinestock.expirydate, medicinestock.boxno, medicinestock.stripinsidebox, medicinestock.medicineinsidestrip, medicinestock.unit, medicinestock.hsn, medicinestock.rackno, medicinestock.productno, medicinestock.sno FROM medicinestock INNER JOIN products ON medicinestock.productno = products.productno ORDER BY products.productno, medicinestock.expirydate" ProviderName="<%$ ConnectionStrings:sql6490744ConnectionString.ProviderName %>">
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
          
            <asp:BoundField DataField="sno" HeaderText="sno" 
                SortExpression="sno" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="medicineno" 
                HeaderText="medicineno" SortExpression="medicineno" />
            <asp:BoundField DataField="stripinsidebox" HeaderText="stripinsidebox" SortExpression="stripinsidebox" />
            <asp:BoundField DataField="medicineinsidestrip" HeaderText="medicineinsidestrip" SortExpression="medicineinsidestrip" />
            <asp:BoundField DataField="extra" HeaderText="extra" SortExpression="extra" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:BoundField DataField="userno" HeaderText="userno" SortExpression="userno" />
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
                ConnectionString="<%$ ConnectionStrings:sql6490744ConnectionString %>" 
                SelectCommand="SELECT sno, medicineno, stripinsidebox, medicineinsidestrip, extra, price, userno FROM countersalecart ORDER BY sno DESC"
                DeleteCommand="Delete from countersalecart where sno=@sno" ProviderName="<%$ ConnectionStrings:sql6490744ConnectionString.ProviderName %>">
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
