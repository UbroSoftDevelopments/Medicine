<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ledgeramount.aspx.cs" Inherits="Medicine.ledgeramount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="w3-row ">
<div class="w3-col s1"><br /></div>
<div   class="w3-col s10 w3-center w3-padding w3-card-4 w3-centered w3-border">

<center>
<h2 class="w3-light-blue">Firm Details</h2>
 
   
 <asp:Label ID="lblmessage" CssClass="w3-large w3-text-blue" runat="server" Text=""></asp:Label>

<div class="w3-row w3-mobile">

<center>
   
    <asp:Label ID="txtname"  ReadOnly="true" CssClass="w3-xlarge" runat="server"></asp:Label><br />
    
      <asp:Label ID="txtaddress" ReadOnly="true" CssClass="w3-large" runat="server"></asp:Label>
       <asp:Label ID="txtstate" ReadOnly="true" CssClass="w3-round w3-large" runat="server"></asp:Label>
        <asp:Label ID="txtcountry" ReadOnly="true" CssClass="w3-round w3-large" runat="server"></asp:Label><br />
         <asp:Label ID="txtmobileno" ReadOnly="true" CssClass="w3-round" runat="server"></asp:Label>
      
   </center>
   <br /> <br />
   <div class="w3-row w3-mobile">
   <div class="w3-col s1"><br /></div>
   <div class="w3-col s10 w3-centered">
   <div class="w3-bar w3-col s12 w3-large  s10">
   <center>
  
       <asp:Label style="width:100%" ID="lblcreadit" runat="server" Text=""></asp:Label>
       </center>
   </div>
   <asp:GridView ID="GridView1" style="width:100%" runat="server" AutoGenerateColumns="False" 
           BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
           CellPadding="3" DataKeyNames="sno" DataSourceID="SqlDataSource1" 
           GridLines="Horizontal">
       <AlternatingRowStyle BackColor="#F7F7F7" />
       <Columns>
           <asp:BoundField DataField="customerbillno" HeaderText="Customer Bill No." 
               SortExpression="customerbillno" />
          <asp:TemplateField HeaderText="Date Of Bill Entry">
          <ItemTemplate>
          <%# DateUtilities.dateFormat(Eval("date")) %>
          </ItemTemplate>
          
          </asp:TemplateField>
          

            <asp:BoundField DataField="amount" HeaderText="Amount" 
               SortExpression="amount" />
          
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

    <div class="w3-row w3-animate-zoom w3-aqua w3-large w3-text-red">
    <div class="w3-col s8"><br /></div>
    
       <asp:Label  ID="lblcreaditamount" runat="server" Text=""></asp:Label>
       </div>
       
   </div>

   
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
           ConnectionString="<%$ ConnectionStrings:medicineConnectionString %>" 
           SelectCommand="SELECT * FROM medicine.firmamount WHERE ([firmno] = @firmno) ORDER BY [date]">
           <SelectParameters>
               <asp:QueryStringParameter Name="firmno" QueryStringField="sno" Type="Int32" />
           </SelectParameters>
       </asp:SqlDataSource>
   
   </div>
   <br /><br /><br />
    <div class="w3-bar w3-col s12 w3-large  s10">
   <center>
  
       <asp:Label style="width:100%" ID="lblDebit" runat="server" Text=""></asp:Label>
       </center>
   </div>
   <div class="w3-row">
     <div class="w3-col s1"><br /></div>
       <div class="w3-col s10">
       <asp:GridView ID="GridView2" style="width:100%" runat="server" AutoGenerateColumns="False" 
           BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
           CellPadding="3" DataKeyNames="sno" DataSourceID="SqlDataSource2" 
           GridLines="Horizontal">
           <AlternatingRowStyle BackColor="#F7F7F7" />
           <Columns>
            <asp:TemplateField HeaderText="Date Of Bill Entry">
          <ItemTemplate>
          <%# DateUtilities.dateFormat(Eval("date")) %>
          </ItemTemplate>
          
          </asp:TemplateField>
          
                 <asp:BoundField DataField="comment" HeaderText="Mode Of Payement" 
                   SortExpression="comment" />
             
               <asp:BoundField DataField="amount" HeaderText="Amount" 
                   SortExpression="amount" />
            
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
       <div class="w3-row w3-animate-zoom w3-amber w3-large w3-text-deep-purple">
    <div class="w3-col s8"><br /></div>
    
       <asp:Label  ID="lbldebitamount" runat="server" Text=""></asp:Label>
       </div>
       
   </div>


       </div>
       </div>

   
       <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
           ConnectionString="<%$ ConnectionStrings:medicineConnectionString %>" 
           SelectCommand="SELECT * FROM medicine.debitpayment WHERE ([firmno] = @firmno) ORDER BY [date]">
           <SelectParameters>
               <asp:QueryStringParameter Name="firmno" QueryStringField="sno" Type="Int32" />
           </SelectParameters>
       </asp:SqlDataSource>
       <br />
        <div class="w3-bar w3-col s12 w3-large">
   <center>
  
       <asp:Label style="width:100%" ID="lblbalance" runat="server" Text=""></asp:Label>
       <div class="w3-row">
       
       <div class="w3-col s12 w3-border-bottom w3-border-black "></div>
       </div>

       <div class="w3-row">
       <div class="w3-col s6"><br /></div>
       <div class="w3-col s6">
           <asp:Label ID="lblbalancecreadit" runat="server" Text=""></asp:Label><br />
           <asp:Label ID="lblbalancedebit" runat="server" Text=""></asp:Label><br />
           <asp:Label ID="lbltotalbalance" runat="server" Text=""></asp:Label>

       </div>
       
       </div>
       <br />  <br />
      </center>
   </div>
   </div>
   </center>
   </div>
   </div>
   
</asp:Content>
