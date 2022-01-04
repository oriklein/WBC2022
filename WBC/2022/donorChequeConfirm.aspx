<%@ Page Language="C#" AutoEventWireup="true" Inherits="donorChequeConfirm" CodeFile="donorChequeConfirm.aspx.cs" %>

<% Response.WriteFile("inc.header2.aspx"); %>
<% Response.WriteFile("inc.header.body1.aspx"); %>
<% Response.WriteFile("inc.header.body2.aspx"); %>
<form id="form1" name="forattendee" runat="server">
<div id="main">
    <div class="section">
        <div class="col col-100 center">
            <ul class="menu menu-progress menu-match">
                <li>Donation Form</li><li>Payment</li><li class="active">Confirmation</li></ul>
         
            <h2>
                Confirmation Number:
                <asp:label id="lblConfirm" runat="server"></asp:label>
            </h2>
            <h2>
                Donationtion Amount:
                <asp:label id="lblCost" runat="server"></asp:label>
            </h2>
             
            <h2>
                Payment Details</h2>
            <p class="large">
                <asp:label id="lblStatus" runat="server"></asp:label>
            </p>
            <h2>
                    PAYMENT INFORMATION</h2>
                <p class="large">
                    If you are paying by check, please make checks payable to Enterprise Community Partners,
                    Inc. Please note your confirmation number above on the check.<br />
                    <br />
                    All checks must be mailed to:<br />
                    Sequence Events<br />
                    Attn: Gotham City Gala<br />
                    108 West 39th St., Suite 604<br />
                    New York, NY 10018<br />
                    <br />
                    Questions? Contact Sequence Events at
                    <br />
                    <a href="mailto:gothamcitygala@enterprisecommunity.org">gothamcitygala@enterprisecommunity.org</a> or call (646) 336-6800 x104.
                </p>
        </div>
    </div>
</div>

</form>
<% Response.WriteFile("inc.footer.aspx"); %>