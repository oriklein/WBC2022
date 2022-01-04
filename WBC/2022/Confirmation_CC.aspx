<%@ Page Language="C#" AutoEventWireup="true" Inherits="Confirmation_CC" CodeFile="Confirmation_CC.aspx.cs" %>

<% Response.WriteFile("inc.header2.aspx"); %>
<% Response.WriteFile("inc.header.body1.aspx"); %>
<% Response.WriteFile("inc.header.body2.aspx"); %>
<form id="form1" name="forattendee" runat="server">
<div id="main">
    <div class="section">
        <div class="col col-100 center">
            <ul class="menu menu-progress menu-match">
                <li>Registration Form</li><li>Payment</li><li class="active">Confirmation</li></ul>
                <h2>
        Step 3: Payment Information</h2>
            <div id="dvCreditCard" runat="server">
               
                <p class="large">
                    Please print this confirmation page for your records.</p>
                <h2>
                    Confirmation Number:
                    <asp:label id="lblConfirm" runat="server"></asp:label>
                </h2>
                <h2>	
                Total Amount:
                 <asp:label id="lblAmmount" runat="server"></asp:label>
                </h2>
                <h2>
                    Event Details:</h2>
                <p class="large">
                  11/12/14<br />
                    Pier Sixty at Chelsea Piers<br />
                    <br />
                    Pier 60<br />
                    23rd Street and West Side Highway<br />
                    New York, NY, 10011<br />
                    <br />
                    Cocktails at 6 P.M.<br />
                    Dinner at 7 P.M.<br />
                    Festive Attire
                </p>
                <h2>
                    Registration Details</h2>
                <p class="large">
                    <asp:label id="lblAttendees" runat="server"></asp:label>
                </p>
              <%--  <h2>
                    Payment Details</h2>
                <p class="large">
                    <asp:label id="lblStatus" runat="server"></asp:label>
                </p>--%>
           
           <p class="large" id="pchkPayment" runat="server">   
                    Please print this confirmation page for your records</p>
                
             
            </div>
        </div>
    </div>
</div>
<%--- email end ---%>
<div class="row row-button">
    <a href="http://www.sequence-events.com/wbc/2015/default.aspx" class="bullet bullet-back small left"
        runat="server" id="hrF">Back to Conference Page</a>
</div>
<div id="divAdmin" class="mrgnLf" runat="server">
    <a href="http://www.sequence-events.com/wbc/BO/BoIndex.aspx">BO Home</a>&nbsp;&nbsp; |&nbsp;&nbsp;
    <asp:linkbutton id="LinkButton1" runat="server" onclick="lnkLogOut_Click">Logout</asp:linkbutton>
</div>
</form>
<% Response.WriteFile("inc.footer.aspx"); %>
