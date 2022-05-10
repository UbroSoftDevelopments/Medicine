<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="unitentry.aspx.cs" Inherits="Medicine.unitentry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       
<div class="w3-row">
<div class="w3-col s3"><br /></div>
<div   class="w3-col s6 w3-center w3-padding w3-card-4 w3-centered w3-white" style="border-width:medium;border-style:double;border-color:Teal">
<h2 class=""><b><u>Enter Product Type/Unit</u></b></h2>
  <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
  <div class="w3-row w3-mobile">
  <div class="w3-col s2"><br /></div>
  <div class="w3-col s8 w3-padding">
   <asp:TextBox CssClass="w3-input w3-border w3-round w3-border-black" placeholder="Enter Unit Ex.Spray,Mg etc.." ID="txttype" runat="server"></asp:TextBox>
  </div>
  <div class="w3-col s2"><br /></div>
  </div>
  <div class="w3-row w3-center">
   
     <asp:Button ID="buttonsubmit"
            class=" w3-round-xxlarge w3-btn w3-teal" runat="server" 
        Text="Submit" onclick="buttonsubmit_Click"  />
        <asp:Button ID="buttonreset" 
            class=" w3-round-xxlarge w3-btn w3-teal" runat="server" 
        Text="Reset" onclick="buttonreset_Click"  />
        <br />
        </div>
    </div>
 </div>
 <br />
 <div class="w3-row">
 <div class="w3-col s3"><br /></div>
 <div class="w3-col s6 w3-center w3-centered w3-card-4">
     <asp:GridView style="width:100%" ID="GridView1" runat="server" 
         AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" 
         BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="sno" 
         DataSourceID="SqlDataSource1" GridLines="Horizontal" 
         onrowupdated="GridView1_RowUpdated">
         <AlternatingRowStyle BackColor="#F7F7F7" />
         <Columns>
             
             <asp:CommandField ShowEditButton="True" />
             
             <asp:BoundField DataField="unit" HeaderText="unit" SortExpression="unit" />
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
         SelectCommand="SELECT * FROM unit ORDER BY unit"
         UpdateCommand="UPDATE unit set unit=@unit where sno=@sno"
         ></asp:SqlDataSource>
 
 </div>
 
 </div>
    <br /><br /><br /><br /><br />
</asp:Content>
