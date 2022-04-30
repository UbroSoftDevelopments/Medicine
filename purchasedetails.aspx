<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="purchasedetails.aspx.cs" Inherits="Medicine.purchasedetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
  <div class="w3-modal-content w3-pale-yellow w3-card w3-round">
    <div class="w3-container">
      <span onclick="document.getElementById('ContentPlaceHolder1_id01').style.display='none'" 
      class="w3-button w3-display-topright">&times;</span>
      <center>
      <h2 class="w3-text-deep-purple">
      <u>Add Products</u>
      </h2>
          <asp:Label ID="lblalertmessage" runat="server" Text=""></asp:Label>
      </center>

      <center>
      <div class="w3-mobile w3-row">
    <div class="w3-col s6 w3-mobile w3-padding ">
    <p>
        <asp:Label ID="lblproductname"  CssClass="w3-large w3-text-blue"  runat="server" Text="Product Name"></asp:Label>
        <asp:TextBox CssClass="w3-border w3-input w3-round  " TabIndex="1"  ID="txtproductname" runat="server"></asp:TextBox>
      
         <asp:Label ID="lblpurchaserate"  CssClass="w3-large w3-text-blue"  runat="server" Text="Purchase Rate"></asp:Label>
        <asp:TextBox CssClass="w3-border w3-input w3-round  " TabIndex="3"  ID="txtpurchaserate" runat="server"></asp:TextBox>
       <asp:Label ID="lblproductcompany"  CssClass="w3-large w3-text-blue"  runat="server" Text="Product Company"></asp:Label>
        <asp:DropDownList ID="ddproductcompany" CssClass="w3-border w3-input w3-round  " TabIndex="5" runat="server" 
            DataSourceID="SqlDataSource3" DataTextField="companyname" 
            DataValueField="companyno" AppendDataBoundItems="true">
            <asp:ListItem Selected="True" Text="Select Company" Value="-1"></asp:ListItem>
        </asp:DropDownList>
      
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:medicineConnectionString %>" 
            SelectCommand="SELECT * FROM medicine.medicinecompany ORDER BY [companyno]">
        </asp:SqlDataSource>

    </p>
    </div>
      <div class="w3-col s6 w3-mobile w3-padding ">
      <p>
         <asp:Label ID="lblproducttype"  CssClass="w3-large w3-text-blue"  runat="server" Text="Product Type"></asp:Label>
        <asp:DropDownList CssClass="w3-border w3-input w3-round " TabIndex="2" 
              ID="ddproducttype" runat="server" DataSourceID="SqlDataSource1" 
              DataTextField="unit" DataValueField="sno" AppendDataBoundItems="true">
              <asp:ListItem Selected="True" Text="Select Product Type" Value="-1"></asp:ListItem>
        </asp:DropDownList>
          <asp:Label ID="lblsalerate"  CssClass="  w3-large w3-text-blue"  runat="server" Text="Mrp"></asp:Label>
        <asp:TextBox CssClass=" w3-border w3-input w3-round  " TabIndex="4"  ID="txtsalerate" runat="server"></asp:TextBox>
      


         <asp:Label ID="lblcomment"  CssClass="w3-large w3-text-blue"  runat="server" Text="Batch No."></asp:Label>
         <asp:TextBox CssClass="w3-border w3-input w3-round " TabIndex="6"  ID="txtbatchno" runat="server"></asp:TextBox>


          <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
              ConnectionString="<%$ ConnectionStrings:medicineConnectionString %>" 
              SelectCommand="SELECT * FROM medicine.unit ORDER BY [sno]">
          </asp:SqlDataSource>
      </p>
      </div>
      </div>

          <asp:Button ID="Button2"  class=" w3-round-xxlarge w3-btn w3-purple" 
        runat="server" Text="ADD" onclick="btaddnew_Click"  />
        <asp:Button ID="Button3"  class=" w3-round-xxlarge w3-btn w3-purple" 
        runat="server" Text="Reset" onclick="reset_Click"    />
      </center>


      </div>
      </div>
</asp:Panel>
  </div>
 
<div class="w3-row ">
<div class="w3-col s1"><br /></div>
<div   class="w3-col s10 w3-center w3-padding w3-card-4 w3-centered w3-white w3-round-large" style="border-width:medium;border-style:solid;border-color:Black">

<center>

 
   
 <asp:Label ID="lblmessage" CssClass="w3-large w3-text-blue" runat="server" Text=""></asp:Label>

 
 
 


<div class="w3-row w3-mobile">

<center>

   
    <asp:Label ID="txtname"  ReadOnly="true" CssClass="w3-xlarge" runat="server"></asp:Label><br />
    
      <asp:Label ID="txtaddress" ReadOnly="true" CssClass="w3-large" runat="server"></asp:Label>
       <asp:Label ID="txtstate" ReadOnly="true" CssClass="w3-round w3-large" runat="server"></asp:Label>
        <asp:Label ID="txtcountry" ReadOnly="true" CssClass="w3-round w3-large" runat="server"></asp:Label><br />
         <asp:Label ID="txtmobileno" ReadOnly="true" CssClass="w3-round" runat="server"></asp:Label>
      
   </center>
   <br /> 
  
   <div class="w3-row">
   <div class="w3-col s6">
    <asp:Label ID="lblbillno" CssClass="w3-large w3-left w3-text-blue" runat="server" Text="Customer Bill No:-"></asp:Label>
  <asp:TextBox ID="txtcustomerbillno" CssClass="w3-round w3-left w3-border" runat="server"></asp:TextBox>
  </div>
  <div class="w3-col s2"><br /></div>
  <div class="w3-col s4">
   <asp:Label ID="lbldate" CssClass=" w3-large w3-text-blue w3-justify"  runat="server" Text="Date:-"></asp:Label>
  
 <asp:TextBox ID="txtdate" CssClass="w3-round w3-right w3-border" runat="server"></asp:TextBox>

 </div>
   </div>
 <br />
  <div class="w3-mobile w3-gray w3-circle" style="height:3px"></div>
</div>
<center>
<u><b style="font-size:x-large">Product Details</b></u>
 
<div class="w3-row w3-mobile">
<div class="w3-col s1"><br /><br /> 
    <asp:Button ID="Button1" Width="75px"  class=" w3-round-xxlarge w3-button w3-purple" 
        runat="server" Text="Add " onclick="Button1_Click"  /> &nbsp &nbsp</div>
<div class="w3-col s3 w3-margin">

 <asp:Label ID="lblmedicinename" CssClass="w3-large w3-text-blue" runat="server" Text="Product Name"></asp:Label>

         
 <br />
    <asp:DropDownList ID="ddproductno" AppendDataBoundItems="true" 
        CssClass="w3-round  w3-border w3-input w3-large" runat="server" 
        DataSourceID="SqlDataSource2" DataTextField="productname" DataValueField="productno" 
           AutoPostBack="true"
        >
        <asp:ListItem Selected="True" Text="--Select Medicine--" Value="-1"></asp:ListItem>
    </asp:DropDownList> 
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:medicineConnectionString %>" 
        SelectCommand="SELECT * FROM medicine.products ORDER BY [productno]">
    </asp:SqlDataSource>
    </div>
    
    <div class="w3-col s3 w3-margin">
     <asp:Label ID="lblbatchno" CssClass="w3-large w3-text-blue" runat="server" Text="Batch No"></asp:Label><br />
        <asp:DropDownList ID="ddbatchno" 
            CssClass="w3-round  w3-border w3-input w3-large" runat="server" AutoPostBack="true"
            DataSourceID="SqlDataSource5" DataTextField="batchno" DataValueField="batchno" 
            onselectedindexchanged="ddbatchno_SelectedIndexChanged" OnDataBound="batchSelectedDefault">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:medicineConnectionString %>" 
            SelectCommand="SELECT * FROM medicine.productbatch WHERE ([productno] = @productno)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddproductno" Name="productno" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
     <div class="w3-col s3 w3-margin">
      <asp:Label ID="lblmrp" CssClass="w3-large w3-text-blue" runat="server" Text="Mrp"></asp:Label><br />
    <asp:TextBox ID="txtPureRate" CssClass="w3-round  w3-border w3-input" ReadOnly="true" runat="server"></asp:TextBox>
       </div>
<div class="w3-row">
<div class="w3-col s1"><br /></div>
<div class="w3-col s3 w3-margin">
 <asp:Label ID="lblmfgdate" CssClass="w3-large w3-text-blue" runat="server" Text="Manufacturing Date"></asp:Label>
    <asp:TextBox ID="txtmfgdate" CssClass="w3-round w3-border w3-input" runat="server"></asp:TextBox>
    </div>
<div class="w3-col s3 w3-margin">
 <asp:Label ID="lblexpiry" CssClass="w3-large w3-text-blue" runat="server" Text="Expiry Date"></asp:Label>
    <asp:TextBox ID="txtexpiry" CssClass="w3-round w3-border w3-input" runat="server"></asp:TextBox>
</div>
<div class="w3-col s3 w3-margin">
 <asp:Label ID="lblhsn" CssClass="w3-large w3-text-blue" runat="server" Text="Hsn No"></asp:Label>
    <asp:TextBox ID="txthsnno" CssClass="w3-round w3-border w3-input" runat="server"></asp:TextBox>
   

</div>


</div>
<div class="w3-row ">
<div class="w3-col s1"><br /></div>
<div class="w3-col s3 w3-margin">
      <asp:Label ID="lblrackno" CssClass="w3-large w3-text-blue" runat="server" Text="Rack No"></asp:Label>
    <asp:TextBox ID="txtrackno" CssClass="w3-round w3-border w3-input" runat="server"></asp:TextBox>


</div>
<div class="w3-col s3 w3-margin">
  <asp:Label ID="lblunit" CssClass="w3-large w3-text-blue" runat="server" Text="Unit"></asp:Label>
    <asp:DropDownList ID="ddUnits" CssClass="w3-round  w3-border w3-input" 
        runat="server" DataSourceID="SqlDataSource1" 
        DataTextField="unit" DataValueField="sno" 
        onselectedindexchanged="ddUnits_SelectedIndexChanged" AutoPostBack="true">
    </asp:DropDownList>



</div>
<div class="w3-col s3 w3-margin">
  <asp:Label ID="lblboxno" CssClass="w3-large w3-text-blue" runat="server" Text="No Of Boxes"></asp:Label>
    <asp:TextBox ID="txtboxno" CssClass="w3-round w3-border w3-input" runat="server"></asp:TextBox>


</div>

</div>
<div class="w3-row ">
<div class="w3-col s1"><br /></div>
<div class="w3-col s3 w3-margin">
<asp:Label ID="lblstripinsidebox" CssClass="w3-large w3-text-blue" runat="server" Text="Pices In Box"></asp:Label>
    <asp:TextBox ID="txtnoofstripinsidebox" 
        CssClass="w3-round  w3-border w3-input" runat="server"></asp:TextBox>
           
           </div>
<div  class="w3-col s3 w3-margin ">
 <asp:Label Visible="false" ID="lblmedicineno" CssClass="w3-large w3-text-blue" runat="server" Text="No.Of Medicine In Strip "></asp:Label>
    <asp:TextBox ID="txtqtyinsidestrip" Visible="false" 
        CssClass="w3-round w3-border w3-input" Text="1" runat="server"></asp:TextBox>
  

</div>
<div class="w3-col s3 w3-margin">

<asp:Label ID="lblpurerate" CssClass=" w3-hide w3-large w3-text-blue" runat="server" Text="Rate For Sale"></asp:Label>
    <asp:TextBox ID="abc" CssClass=" w3-hide w3-round  w3-border w3-input" ReadOnly="true" 
        runat="server"></asp:TextBox>

</div>

</div>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:medicineConnectionString %>" 
        SelectCommand="SELECT * FROM medicine.unit WHERE sno>=1 ORDER BY [sno]">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="sno" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


</div>



 </center>
 


    <asp:Button ID="btadd"  class=" w3-round-xxlarge w3-btn w3-purple" 
        runat="server" Text="Add Items" onclick="btadd_Click"  />
           <asp:Button ID="btreset"  class=" w3-round-xxlarge w3-btn w3-purple" 
        runat="server" Text="Reset" onclick="btreset_Click"   />
        </center>
        </div>
<br />
<div class="w3-row">
<div class="w3-col s12">
    <asp:GridView style="width:100%" CssClass="w3-centered" ID="GridView1" 
        runat="server" CellPadding="4" 
        ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" 
        DataKeyNames="sno" DataSourceID="SqlDataSource6">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
         
            <asp:CommandField ShowDeleteButton="True" />
         
            <asp:BoundField DataField="billno" HeaderText="Bill No" 
                SortExpression="billno" />
               <asp:TemplateField HeaderText="Product Name">
            <ItemTemplate>
            <%#ProductUtilities.GetProductNameByProductNo(Convert.ToInt32(Eval("productno"))) %>
            </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product Quantity">
            <ItemTemplate>
            <%#ProductUtilities.GetTotalMedicineQuantity(Convert.ToInt32(Eval("boxno")),Convert.ToInt32(Eval("stripinsidebox")),Convert.ToInt32(Eval("medicineinsidestrip"))) %>
            </ItemTemplate>
            </asp:TemplateField>
           
            <asp:BoundField DataField="unit" HeaderText="Unit" SortExpression="unit" />
            <asp:BoundField DataField="batchno" HeaderText="Batch No" 
                SortExpression="batchno" />
            <asp:BoundField DataField="hsnno" HeaderText="HSN No." SortExpression="hsnno" />
            <asp:BoundField DataField="mrp" HeaderText="Mrp" SortExpression="mrp" />
            <asp:TemplateField HeaderText="MFG Date">
            <ItemTemplate>
            <%#DateUtilities.dateFormat(Convert.ToDateTime(Eval("mfgdate"))) %>
            </ItemTemplate>
            </asp:TemplateField>
              <asp:TemplateField HeaderText="Expiry Date">
            <ItemTemplate>
            <%#DateUtilities.dateFormat(Convert.ToDateTime(Eval("expirydate"))) %>
            </ItemTemplate>
            </asp:TemplateField>
           
            <asp:BoundField DataField="rackno" HeaderText="Rackno" 
                SortExpression="rackno" />
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
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
        ConnectionString="<%$ ConnectionStrings:medicineConnectionString %>" 
        SelectCommand="SELECT * FROM medicine.purchasecart ORDER BY [sno]"
        DeleteCommand="Delete from medicine.purchasecart where sno=@sno">
    </asp:SqlDataSource>
    </div>
    </div>
    <br /><br />
    <center>
     <asp:Button ID="btsave" CssClass=" w3-round-xxlarge w3-btn w3-purple" runat="server" Text="Save" onclick="btsave_Click"  />
     <asp:Button ID="Button4" CssClass=" w3-round-xxlarge w3-btn w3-purple" runat="server" onclick="Button4_Click" Text="Clear" />
        </center>
 <br />
   </div>

       

        
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
                          yearRange: '1950:2050',
                          dateFormat: 'dd-M-yy',
                          defaultDate: 'currentdate'
                      });
                  });

              });
    </script>
         <script type="text/javascript">
             $(function () {
                 $(function () {
                     var currentYear = (new Date).getFullYear();
                     var currentMonth = (new Date).getMonth() + 1;
                     var currentDay = (new Date).getDate();
                     $("#datepicker").datepicker({ minDate: new Date((currentYear - 1), 12, 1), dateFormat: 'dd/mm/yy', maxDate: new Date(currentYear, 11, 31) });

                     $("#ContentPlaceHolder1_txtmfgdate").datepicker({
                        changeMonth: true,
                         changeYear: true,
                         yearRange: '1950:2050',
                         dateFormat: 'dd-M-yy',
                         defaultDate: 'currentdate'
                     });
                 });

             });
    </script>


    
         <script type="text/javascript">
             $(function () {
                 $(function () {
                     var currentYear = (new Date).getFullYear();
                     var currentMonth = (new Date).getMonth() + 1;
                     var currentDay = (new Date).getDate();
                     $("#datepicker").datepicker({ minDate: new Date((currentYear - 1), 12, 1), dateFormat: 'dd/mm/yy', maxDate: new Date(currentYear, 11, 31) });

                     $("#ContentPlaceHolder1_txtexpiry").datepicker({

                         changeMonth: true,
                         changeYear: true,
                         yearRange: '1950:2050',
                         dateFormat: 'dd-M-yy',
                         defaultDate: 'currentdate'
                     });
                 });

             });
         </script>
    
       
</asp:Content>
