<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Medicine.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="w3-row w3-container w3-padding w3-mobile w3-center w3-round  ">
 <div class="w3-col s4 w3-padding  w3-text-blue w3-mobile ">
  </div>
 <div style=" background: linear-gradient(to bottom right,  #99ccff 0%, #66ffff 100%) " class="w3-col s4 w3-padding w3-text-deep-purple w3-mobile w3-border  w3-round-medium">
 <h2><u>Login to Geetanjali Medical Store</u> </h2>
 <asp:Label ID="lblMessages" runat="server" />
 <br />
<b> <asp:Label class="w3-large w3-text-deep-purple" ID="lblname" runat="server" Text="Username"></asp:Label><br />
 <asp:TextBox class="w3-large w3-card w3-round " ID="txtUserName" runat="server" placeholder="UserId" /><br />
<br />
     <asp:Label class="w3-large w3-text-deep-purple" ID="lblpass" runat="server" Text="Password"></asp:Label><br />
     <asp:TextBox class="w3-large w3-card w3-round" ID="txtPassword" runat="server" placeholder="Password" TextMode="Password" />
</b>
<br />
<br />
<center>
<asp:Button CssClass="w3-button w3-round-xxlarge w3-deep-purple w3-margin" style="margin-left:25px;width:30%" ID="bttnLogin" runat="server" onclick="bttnLogin_Click" Text="Login" />
</center>
 </div>
 <div class="w3-col s4 w3-padding w3-text-blue w3-mobile">
 </div>
 </div>
</asp:Content>
