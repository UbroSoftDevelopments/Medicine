<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="firmselection.aspx.cs" Inherits="Medicine.firmselection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<div class="w3-row w3-mobile">
<div class="w3-col s3"><br /></div>
<div   class="w3-col s6 w3-center w3-padding w3-mobile w3-card-4 w3-centered w3-white w3-round-large w3-card-4" style="border-width:medium;border-style:solid;border-color:Black">

<center>
<h2 class=""><b><u>Select Party Or Store Name</u></b></h2>
  <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label><br />
    <asp:Label ID="lblcompanyname" CssClass="w3-large w3-text-blue" runat="server" Text="Firm Name"></asp:Label>
    <asp:DropDownList CssClass="w3-input w3-sand w3-border w3-round w3-mobile" 
        ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" 
        DataTextField="firmname" DataValueField="sno" AppendDataBoundItems="true">
        <asp:ListItem Selected="True" Text="Select Firm Name" Value="-1"></asp:ListItem>
    </asp:DropDownList>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:medicineConnectionString %>" 
        SelectCommand="SELECT * FROM medicalstores ORDER BY firmname">
    </asp:SqlDataSource>
    <br /><br />
    <asp:Button ID="btselect"  class=" w3-round-xxlarge w3-btn w3-purple" 
        runat="server" Text="Select" onclick="btselect_Click"  />
    </center>
    </div>
    </div>
</asp:Content>
