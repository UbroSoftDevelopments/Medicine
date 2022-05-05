<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DebitPayment.aspx.cs" Inherits="Medicine.DebitPayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="w3-row ">
<div class="w3-col s1"><br /></div>
<div   class="w3-col s10 w3-center w3-padding w3-card-4 w3-centered w3-white" style="border-width:medium;border-style:solid;border-color:Black">

<center>
<h2 class="w3-light-blue">Firm Payments</h2>
<asp:Label ID="lblmessage" CssClass="w3-large w3-text-blue" runat="server" Text=""></asp:Label>
<div class="w3-row w3-mobile">

<center>
<asp:Label ID="txtname"  ReadOnly="true" CssClass="w3-xlarge" runat="server"></asp:Label><br />
<asp:Label ID="txtaddress" ReadOnly="true" CssClass="w3-large" runat="server"></asp:Label>
<asp:Label ID="txtstate" ReadOnly="true" CssClass="w3-round w3-large" runat="server"></asp:Label>
<asp:Label ID="txtcountry" ReadOnly="true" CssClass="w3-round w3-large" runat="server"></asp:Label><br />
<asp:Label ID="txtmobileno" ReadOnly="true" CssClass="w3-round" runat="server"></asp:Label>
 </center>
 </div>
 <div class="w3-row">
   <div class="w3-col s4 w3-padding">
   <asp:Label ID="lbldate" CssClass=" w3-large w3-text-blue"  runat="server" Text="Date"></asp:Label>
   <asp:TextBox ID="txtdate" CssClass="w3-round w3-left w3-border w3-input w3-sand" runat="server"></asp:TextBox>
  </div>
  <div class="w3-col s4 w3-padding">
   <asp:Label ID="lblamount" CssClass="w3-large w3-text-blue  " runat="server" Text="Amount"></asp:Label>
   <asp:TextBox CssClass="w3-round w3-border w3-input w3-large w3-sand " ID="txtamount" runat="server"></asp:TextBox>
  </div>
  <div class="w3-col s4 w3-padding">
   <asp:Label ID="lblcomment"  CssClass="w3-large w3-text-blue"  runat="server" Text="Comment"></asp:Label>
   <asp:TextBox TextMode="MultiLine" CssClass="w3-border w3-input w3-round w3-sand " ID="txtcomment" runat="server"></asp:TextBox>
 </div>
   </div>
   
    <br />
     <div class="w3-row w3-mobile">
        <asp:Button ID="btsave"  class=" w3-round-xxlarge w3-btn w3-purple" 
        runat="server" Text="Done" onclick="btsave_Click"   />
        <asp:Button ID="btreset"  class=" w3-round-xxlarge w3-btn w3-purple" 
        runat="server" Text="Reset" onclick="btreset_Click"   />
        <br /><br />
   </div>
    </div>
        </div>
    <br />
    <div class="w3-row w3-mobile">
   <div class="s1 w3-col">
   <br />
   </div>
   <div class="w3-col s10 w3-centered">
       <asp:GridView style="width:100%" ID="GridView1" runat="server" 
           AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" 
           BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="sno" 
           DataSourceID="SqlDataSource1" GridLines="Horizontal">
           <AlternatingRowStyle BackColor="#F7F7F7" />
           <Columns>
               <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
               <asp:TemplateField HeaderText="Date">
              <ItemTemplate>
               <%# DateUtilities.dateFormat(Eval("date")) %>
              
              </ItemTemplate>
              
              </asp:TemplateField>
               <asp:BoundField DataField="amount" HeaderText="Amount" 
                   SortExpression="amount" />
               <asp:BoundField DataField="comment" HeaderText="Comment" 
                   SortExpression="comment" />
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
           ConnectionString="<%$ ConnectionStrings:medicineConnectionString %>" 
           SelectCommand="SELECT * FROM medicine.debitpayment WHERE ([firmno] = @firmno) ORDER BY [date]"
             UpdateCommand="update medicine.debitpayment set amount=@amount, comment=@comment where sno=@sno"
        DeleteCommand="delete from medicine.debitpayment where sno=@sno"
           
           >
           <SelectParameters>
               <asp:QueryStringParameter Name="firmno" QueryStringField="sno" Type="Int32" />
           </SelectParameters>
       </asp:SqlDataSource>
   
   
   </div>
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
    <br /><br /><br />
</asp:Content>
