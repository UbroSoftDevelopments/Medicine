<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="printreceipt.aspx.cs" Inherits="Medicine.printreceipt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Print</title>
    <link rel="Stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <link rel="stylesheet" type="text/css" href="http://cdn.webrupee.com/font"/>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"/>

    <script type="text/javascript">
        function printpage() {
            var printButton = document.getElementById("printForm");
            printButton.style.visibility = 'hidden';
            window.print()
            printButton.style.visibility = 'visible';
        }
    </script>
    <style type="text/css">
    .invoice-box {
        max-width: 800px;
        margin: auto;
        padding: 10px;
        font-size: 15px;
        line-height: 24px;
        font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
        color: #333;
    }
    
    .invoice-box table {
        width: 100%;
        line-height: inherit;
        text-align: left;
    }
    
    .invoice-box table td {
        padding: 5px;
        vertical-align: top;
    }
    
    .invoice-box table tr td:nth-child(2) {
        text-align: right;
    }
    
    .invoice-box table tr.top table td {
        padding-bottom: 20px;
    }
    
    .invoice-box table tr.top table td.title {
        font-size: 40px;
        line-height: 40px;
        color: #333;
    }
    
    .invoice-box table tr.information table td {
        padding-bottom: 40px;
    }
    
    .invoice-box table tr.heading td {
        background: #eee;
        border-bottom: 1px solid #ddd;
        font-weight: bold;
    }
    
    .invoice-box table tr.details td {
        padding-bottom: 20px;
    }
    
    .invoice-box table tr.item td{
        border-bottom: 1px solid #eee;
    }
    
    .invoice-box table tr.item.last td {
        border-bottom: none;
    }
    
    .invoice-box table tr.total td:nth-child(2) {
        border-top: 2px solid #eee;
        font-weight: bold;
    }
    
    @media only screen and (max-width: 600px) {
        .invoice-box table tr.top table td {
            width: 100%;
            display: block;
            text-align: center;
        }
        
        .invoice-box table tr.information table td {
            width: 100%;
            display: block;
            text-align: center;
        }
    }
    
    /** RTL **/
    .rtl {
        direction: rtl;
        font-family: Tahoma, 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
    }
    
    .rtl table {
        text-align: right;
    }
    
    .rtl table tr td:nth-child(2) {
        text-align: left;
    }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div class="w3-center invoice-box w3-center">
<table cellspacing="0" style="line-height:5px" class="w3-center w3-table" width="100%" border="0">
    <tr class="top">
        <td style="border-bottom-width:1px; border-bottom-style:solid; line-height:20px">
            <div>
                <center>
                    <label class="w3-xlarge w3-center title"><b>GEETANJALI MEDICALS | गीतांजलि मेडिकल्स </b></label>
                    <br />
                    <label>Mirzapur - Varanasi Road, Milkipur, Uttar Pradesh 231305</label>
                    <br />
                    <label>9839980333, 7565000033<br />GSTIN:-09AAHCG0111A1ZF</label>
                </center>
            </div>
        </td>
    </tr>
    <tr>
        <td style="border-bottom-width:1px; border-bottom-style:solid">
            <table cellspacing="0" style="line-height:5px" width="100%" border="0">
                <tr>
                    <td colspan="6"><center><label class="w3-large w3-center"><u>Customers Details</u></label></center></td>
                </tr>
                <tr><td><b>Receipt No-:</b></td>
                    <td ><asp:label ID="lblreceiptNo" CssClass="w3-left" runat="server"/></td>
                    <td></td><td></td>
                    <td ><asp:Label  ID="lblentrydate" CssClass="w3-right" runat="server"><b>Date -:</b></asp:Label>     </td>
                    <td><asp:label ID="lbldateOfEntry" runat="server" CssClass="w3-left"/></td>
                </tr>
                <tr>
                    <td><b>Name-:</b></td>
                    <td colspan="2"><asp:label ID="lblname" CssClass="w3-left" runat="server"/></td>
                    <td></td>
                    <td class="w3-right"><b>Address -: </b></td>
                    <td ><asp:label ID="lbladdress" runat="server" CssClass="w3-left"/></td>
                </tr>
                <tr>
                    <td><b>Mobile No: </b></td>
                    <td><asp:label ID="lblmobileNumber" CssClass="w3-left" runat="server"/></td>
                    <td></td><td></td>
                    <td class="w3-right"><b>Reffered From -: </b></td>
                    <td ><asp:label ID="lblrefFrom" CssClass="w3-left" runat="server"/></td>
                </tr>
                <tr>
                    <td colspan="6"><center><b><u>Product Details</u></b></center></td>
                </tr>
                <tr>
                    <td colspan="6">
                        <table cellspacing="0" style="line-height:18px" class="w3-centered" width="100%" border="0">
                            <tr>
                                <td style="border-bottom-width:1px; border-bottom-style:solid; border-top-style:solid; border-top-width:1px" colspan="2"><b>Sno</b></td>
                                <td style="border-bottom-width:1px; border-bottom-style:solid; border-top-style:solid;border-top-width:1px" colspan="4"><b>Particular</b></td>
                                <td style="border-bottom-width:1px; border-bottom-style:solid; border-top-style:solid;border-top-width:1px"><b>Batch No.</b></td>
                                <td style="border-bottom-width:1px; border-bottom-style:solid; border-top-style:solid;border-top-width:1px"><b>Quantity</b></td>
                                <td style="border-bottom-width:1px; border-bottom-style:solid; border-top-style:solid;border-top-width:1px"><b>Expiry</b></td>
                                <td style="border-bottom-width:1px; border-bottom-style:solid; border-top-style:solid;border-top-width:1px"><b>MRP</b></td>
                                <td style="border-bottom-width:1px; border-bottom-style:solid; border-top-style:solid;border-top-width:1px"><b>Amount</b></td>
                            </tr>
                            <tr>
                                <td style="border-bottom-width:1px; border-bottom-style:solid" colspan="2"><asp:Label ID="lblsno" runat="server" CssClass="w3-center" Text=""></asp:Label></td>
                                <td style="border-bottom-width:1px; border-bottom-style:solid" colspan="4"> <asp:Label ID="lblparticular" CssClass="w3-center" runat="server" Text=""></asp:Label></td>
                                <td style="border-bottom-width:1px; border-bottom-style:solid"><asp:Label ID="lblbatchno" CssClass="w3-center" runat="server" Text=""></asp:Label></td>
                                <td style="border-bottom-width:1px; border-bottom-style:solid"><asp:Label ID="lblquantity" CssClass="w3-center" runat="server" Text=""></asp:Label></td>
                                <td style="border-bottom-width:1px; border-bottom-style:solid" align="left"><asp:Label ID="lblexpiry"  CssClass="w3-center" runat="server" Text=""></asp:Label></td>
                                <td style="border-bottom-width:1px; border-bottom-style:solid"><asp:Label ID="lblrateafterdiscount" CssClass="w3-center" runat="server" Text=""></asp:Label></td>
                                <td style="border-bottom-width:1px; border-bottom-style:solid"><asp:Label ID="lblamnt" CssClass="w3-center" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="border-bottom-width:1px; border-bottom-style:solid" colspan="9"></td>
                                <td style="border-bottom-width:1px; border-bottom-style:solid"><b>Total Value:-</b></td>
                                <td style="border-bottom-width:1px; border-bottom-style:solid"><asp:Label ID="lbltotalamount" runat="server" Text=""><b></b></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="9"></td>
                                <td><b>Discount Rupees</b></td>
                                <td><asp:label ID="lblamount" runat="server" CssClass="fa fa-inr"></asp:label></td>
                            </tr>
                            <tr>
                                <td colspan="9"></td>
                                <td><b>Net Amount</b></td>
                                <td><asp:label ID="lblround" runat="server" CssClass="fa fa-inr"></asp:label></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="1"><b>Amount In Words -: </b></td>
                    <td colspan="5"><asp:label ID="lblamtInWords" CssClass="w3-left" runat="server"></asp:label></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="6" style="line-height:20px; font-weight:bold">*Including of all Taxes(5%SGST & 5%CGST).<br />*ALL SUBJECT TO VARANASI JURISDICTION.</td>
    </tr>
    <!--Terms And Condition-->
</table>
<input type="button" value="Print" id="printForm" onclick="printpage()"/>
</div>
</form>
</body>
</html>
