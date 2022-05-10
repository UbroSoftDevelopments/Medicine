<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="storename.aspx.cs" Inherits="Medicine.storename" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="w3-row">
<div class="w3-col s1"><br /></div>
<div  class="w3-col s10 w3-center w3-padding w3-card-4 w3-centered w3-round-large w3-white" style="border-width:medium;border-style:solid">
<h2 class=""><b><u>Enter Medical Store Name</u></b></h2>
<asp:Label ID="lblmessage" runat="server" Text=""></asp:Label><br />
<div class="w3-row w3-mobile">
<div class="w3-col s4 w3-padding">
 <asp:Label ID="lblcompanyname" CssClass="w3-large" runat="server" Text="Firm Name"></asp:Label>
    <asp:TextBox CssClass="w3-input w3-border w3-round w3-border-black" ID="txtcompanyname" placeholder="Enter Firm Or Agency Name" runat="server"></asp:TextBox>
</div>
<div class="w3-col s4 w3-padding">   
    <asp:Label ID="lbladdress" CssClass="w3-large" runat="server" Text="Address"></asp:Label>
    <asp:TextBox CssClass="w3-input w3-border w3-round w3-border-black" placeholder="Enter Address" ID="txtaddress" runat="server"></asp:TextBox>
    </div>
<div class="w3-col s4 w3-padding">
    <asp:Label ID="lblmobileno" CssClass="w3-large" runat="server" Text="Mobile No."></asp:Label>
    <asp:TextBox CssClass="w3-input w3-border w3-round w3-border-black" placeholder="Enter Mobile No." ID="txtmobileno" runat="server"></asp:TextBox>
    </div>
</div>
<div class="w3-row w3-mobile">
<div class="w3-col s4 w3-padding">
    <asp:Label ID="lblstate" CssClass="w3-large" runat="server" Text="State"></asp:Label>
    <asp:TextBox CssClass="w3-input w3-border w3-round w3-border-black" placeholder="Enter State" ID="txtstate" runat="server"></asp:TextBox>
</div>
<div class="w3-col s4 w3-padding">
 <asp:Label ID="lblcountry" CssClass="w3-large" runat="server" Text="Country"></asp:Label>
  <asp:TextBox CssClass="w3-input w3-border w3-round w3-border-black" ID="txtcountry" placeholder="Enter Country" runat="server"></asp:TextBox>
</div>
<div class="w3-col s4 w3-padding">
<asp:Label ID="lblcomment" CssClass="w3-large"  runat="server" Text="Comment"></asp:Label>
<asp:TextBox CssClass="w3-input w3-round w3-border w3-border-black" TextMode="MultiLine" placeholder="About Firm(Optional)" ID="txtcomment" runat="server"></asp:TextBox><br />
</div>
</div>
<div class="w3-row w3-mobile">
<center>
 <asp:Button ID="buttonsubmit"
            class=" w3-round-xxlarge w3-btn w3-teal" runat="server" 
        Text="Submit" onclick="buttonsubmit_Click"  />
        <asp:Button ID="buttonreset" 
            class=" w3-round-xxlarge w3-btn w3-teal" runat="server" 
        Text="Reset" onclick="buttonreset_Click"    />
</center>
</div>
</div>
<div class="w3-col s1"><br /></div>
</div>
<br /><br />
<div class="w3-row w3-mobile">
<div class="w3-col s2"><br /></div>
<div  class=" w3-col s8 w3-mobile w3-centered">
    <asp:GridView ID="GridView1" style="width:100%" runat="server" 
        AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="sno" 
        DataSourceID="SqlDataSource1" GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
           
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
           
            <asp:BoundField DataField="firmname" HeaderText="Firmname" 
                SortExpression="firmname" />
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
        ConnectionString="<%$ ConnectionStrings:sql6490744ConnectionString %>" 
        SelectCommand="SELECT * FROM medicalstores ORDER BY sno"
        UpdateCommand="update medicalstores set firmname=@firmname,comment=@comment where sno=@sno"
        DeleteCommand="delete medicalstores where sno=@sno">
    </asp:SqlDataSource>

</div>
</div>

</asp:Content>
