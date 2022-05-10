<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="medicinecompany.aspx.cs" Inherits="Medicine.medicinecompany" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="w3-row">
<div class="w3-col s3"><br /></div>
<div   class="w3-col s6 w3-center w3-padding w3-card-4 w3-centered w3-white w3-round-large w3-text-black" style="border-width:medium;border-style:double;border-color:Black">

<center>
<h2 class=""><b><u>Enter Medicines Company</u></b></h2>
  <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label><br />
    <asp:Label ID="lblcompanyname" CssClass="w3-large" runat="server" Text="Company Name"></asp:Label>
    <asp:TextBox CssClass="w3-input w3-border w3-sand w3-round" ID="txtcompanyname" runat="server"></asp:TextBox>
     <asp:Label ID="lblcomment" CssClass="w3-large"  runat="server" Text="Comment"></asp:Label>
    <asp:TextBox CssClass="w3-input w3-sand w3-round w3-border" TextMode="MultiLine" ID="txtcomment" runat="server"></asp:TextBox><br />
    </center>
     <asp:Button ID="buttonsubmit"
            class=" w3-round-xxlarge w3-btn w3-purple" runat="server" 
        Text="Submit" onclick="buttonsubmit_Click" />
        <asp:Button ID="buttonreset" 
            class=" w3-round-xxlarge w3-btn w3-purple" runat="server" 
        Text="Reset" onclick="buttonreset_Click"   />


</div>
</div>
<br /><br />
<div class="w3-row w3-mobile">
<div class="w3-col s2"><br /></div>
<div  class=" w3-col s8 w3-mobile w3-centered">
    <asp:GridView ID="GridView1" style="width:100%" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" DataKeyNames="companyno" DataSourceID="SqlDataSource1" 
        GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
           
            <asp:BoundField DataField="companyno" HeaderText="companyno" 
                SortExpression="companyno" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="companyname" HeaderText="companyname" 
                SortExpression="companyname" />
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

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:sql6490744ConnectionString %>" 
        
        SelectCommand="SELECT companyno, companyname, comment FROM medicinecompany WHERE (companyno &gt;= 13) ORDER BY companyno" ProviderName="<%$ ConnectionStrings:sql6490744ConnectionString.ProviderName %>">
    </asp:SqlDataSource>

</div>
</div>

</asp:Content>
