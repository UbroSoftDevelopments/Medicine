<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="productname.aspx.cs" Inherits="Medicine.productname" %>
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
  <div class="w3-modal-content w3-round-large w3-sand w3-border-black w3-card w3-round">
    <div class="w3-container w3-round-large w3-border-red w3-border">
        <span onclick="document.getElementById('ContentPlaceHolder1_id01').style.display='none'" class="w3-button w3-display-topright">&times;</span>
        <center>
            <h2 class="w3-red">Alert!!!</h2>
            <asp:Label ID="lblmrpdetails" runat="server" CssClass="w3-large w3-text-red" Font-Bold="true" Text=""></asp:Label><br /><br />
            <asp:Button ID="btignore" runat="server" Text="Ignore" OnClick="btsave_Click" CssClass="w3-large w3-button glossButton w3-teal w3-round-large" />
            <asp:HyperLink ID="hymrpdetails" CssClass="w3-large w3-button glossButton w3-teal w3-round-large" runat="server">View Details</asp:HyperLink>
        </center>
        <br />
    </div>
  </div>
</asp:Panel>
  </div>

  <center>
   <asp:Label ID="lblproductquantity" CssClass="w3-xlarge w3-text-red" Font-Bold="true" runat="server" Text=""></asp:Label>
   </center>
<div class="w3-row">
<div class="w3-col s1"><br /></div>
<div class="w3-col s10 w3-center w3-padding w3-card-4 w3-centered w3-round-large w3-mobile w3-white" style="border-width:medium;border-style:double;border-color:Maroon">
    <h2><b><u>Product Entry</u></b></h2>
    <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
    <div class="w3-row w3-mobile">
    <div class="w3-col s3"><br /></div>
    <div class="w3-col s6 w3-padding w3-large">
        <asp:RadioButtonList ID="rdproductconfirm" runat="server" AutoPostBack="true" 
            Font-Bold="true" RepeatDirection="Horizontal" 
            onselectedindexchanged="rdproductconfirm_SelectedIndexChanged">
        <asp:ListItem Selected ="True" Text="New Product&nbsp;&nbsp;&nbsp;&nbsp;" Value="new"></asp:ListItem>
        <asp:ListItem Text="&nbsp;&nbsp;Existing Product" Value="existing"></asp:ListItem>
        </asp:RadioButtonList>
        </div>
    </div>
  
    <div class="w3-mobile w3-row" id="newproductdiv" runat="server" visible="false">
    <div class="w3-col s4 w3-mobile w3-padding ">
        <asp:Label ID="lblproductname"  CssClass="w3-large w3-text-blue"  runat="server" Text="Product Name"></asp:Label>
        <asp:TextBox CssClass="w3-border w3-input w3-round w3-sand " placeholder="Enter Product/Medicine Name"  ID="txtproductname" runat="server"></asp:TextBox>
    </div>
    <div class="w3-col s4 w3-padding">
      <asp:Label ID="lblproductcompany"  CssClass="w3-large w3-text-blue"  runat="server" Text="Product Company"></asp:Label>
        <asp:DropDownList ID="ddproductcompany" CssClass="w3-border w3-input w3-round w3-sand " runat="server" 
            DataSourceID="SqlDataSource2" DataTextField="companyname" AppendDataBoundItems="true" 
            DataValueField="companyno">
            <asp:ListItem Selected="True" Text="--Select Company Name--" Value="-1"></asp:ListItem>
        </asp:DropDownList>
       
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:medicineConnectionString %>" 
            SelectCommand="SELECT * FROM medicine.medicinecompany ORDER BY [companyno]">
        </asp:SqlDataSource>
        
       </div>
       <div class="w3-col s4 w3-padding">
        <asp:Label ID="lblproducttype"  CssClass="w3-large w3-text-blue"  runat="server" Text="Product Type"></asp:Label>
        <asp:DropDownList CssClass="w3-border w3-input w3-round w3-sand " 
              ID="ddproducttype" runat="server" DataSourceID="SqlDataSource1" AppendDataBoundItems="true" 
              DataTextField="unit" DataValueField="sno">
              <asp:ListItem Selected="True" Text="--Select Product Type--" Value="-1"></asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
              ConnectionString="<%$ ConnectionStrings:medicineConnectionString %>" 
              SelectCommand="SELECT * FROM medicine.unit ORDER BY [sno]">
          </asp:SqlDataSource>
       </div>
      </div>
      <div class="w3-row w3-mobile" id="existingproductdiv" runat="server" visible="false">
      <div class="w3-col s4"><br /></div>
      <div class="w3-col s4 w3-padding">
          <asp:DropDownList ID="ddproduct" runat="server" AppendDataBoundItems="true"  
              CssClass="w3-border w3-input w3-round w3-sand " DataSourceID="SqlDataSource6" 
              DataTextField="productname" DataValueField="productno">
              <asp:ListItem Selected="True"  Text="--Select Product Name--" Value="-1"></asp:ListItem>
              </asp:DropDownList>
          <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
           ConnectionString="<%$ ConnectionStrings:medicineConnectionString %>" 
              SelectCommand="SELECT * FROM medicine.products ORDER BY [productname]">
          </asp:SqlDataSource>
      </div>
      <div class="w3-col s4"><br /></div> 
      </div>
      <div id="ratesdiv" runat="server" visible="false">
       <div class="w3-row w3-mobile">
       <div class="w3-col s4 w3-padding">
        <asp:Label ID="lblpurchaserate"  CssClass="w3-large w3-text-blue"  runat="server" Text="Purchase Rate"></asp:Label>
        <asp:TextBox CssClass="w3-border w3-input w3-round w3-sand " placeholder="Enter Purchase Rate"  ID="txtpurchaserate" runat="server"></asp:TextBox>
       </div>
       <div class="w3-col s4 w3-padding">
       <asp:Label ID="lblsalerate"  CssClass="  w3-large w3-text-blue"  runat="server" Text="Mrp"></asp:Label>
        <asp:TextBox CssClass=" w3-border w3-input w3-round w3-sand " placeholder="Enter Mrp Or Rate For Sale"  ID="txtsalerate" runat="server"></asp:TextBox>
      
       </div>
       <div class="w3-col s4 w3-padding">
         <asp:Label ID="lblbatch"  CssClass="w3-large w3-text-blue"  runat="server" Text="Batch No."></asp:Label>
         <asp:TextBox CssClass="w3-border w3-input w3-round w3-sand " placeholder="Enter Batch No." ID="txtbatchno" runat="server"></asp:TextBox>
        </div>
       </div>
      


     <div class="w3-row w3-mobile">
     <center>
      <asp:Button ID="btsave"  class=" w3-round-xxlarge w3-btn w3-purple" 
        runat="server" Text="Save" onclick="btsave_Click"   />
        <asp:Button ID="btreset"  class=" w3-round-xxlarge w3-btn w3-purple" 
        runat="server" Text="Reset" onclick="btreset_Click"   />
     </center>
     </div>
     </div>
      </div>

         
      


      </div>
      <div class="w3-col s1"><br /></div>
     
      <br />
<div class="w3-row w3-mobile">
<div class="w3-col s1"><br /></div>
<div class="w3-col s10 w3-centered">
    <asp:GridView style="width:100%" ID="GridView1" runat="server" 
        AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="sno,productno1" 
        DataSourceID="SqlDataSource3" GridLines="Horizontal" 
       
        >
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
           
            
           
            <asp:BoundField DataField="sno" HeaderText="sno" InsertVisible="False" ReadOnly="True" SortExpression="sno" />
            <asp:BoundField DataField="productno" HeaderText="productno" SortExpression="productno" />
            <asp:BoundField DataField="batchno" HeaderText="batchno" SortExpression="batchno" />
            <asp:BoundField DataField="purchaserate" HeaderText="purchaserate" SortExpression="purchaserate" />
            <asp:BoundField DataField="rateforsale" HeaderText="rateforsale" SortExpression="rateforsale" />
            <asp:BoundField DataField="productno1" HeaderText="productno1" InsertVisible="False" ReadOnly="True" SortExpression="productno1" />
            <asp:BoundField DataField="productname" HeaderText="productname" SortExpression="productname" />
            <asp:BoundField DataField="typeno" HeaderText="typeno" SortExpression="typeno" />
            <asp:BoundField DataField="companyno" HeaderText="companyno" SortExpression="companyno" />
            <asp:BoundField DataField="comment" HeaderText="comment" SortExpression="comment" />
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
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:medicineConnectionString %>" 
        SelectCommand="SELECT * FROM medicine.productbatch INNER JOIN medicine.products ON medicine.products.productno = medicine.productbatch.productno ORDER BY medicine.products.productname">
    </asp:SqlDataSource>
    </div>
    </div>

<br /><br /><br />





    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:medicineConnectionString %>" 
        SelectCommand="SELECT * FROM medicine.medicinecompany WHERE ([companyno] < @companyno) ORDER BY [companyno]">
        <SelectParameters>
            <asp:Parameter DefaultValue="3" Name="companyno" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>





    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
        ConnectionString="<%$ ConnectionStrings:medicineConnectionString %>" 
        SelectCommand="SELECT * FROM medicine.medicinetype WHERE ([sno] < @sno) ORDER BY [sno]">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="sno" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>
