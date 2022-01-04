<%@ Page Language="C#" AutoEventWireup="true" Inherits="Confirm_Code" CodeFile="Confirm_Code.aspx.cs" %>

<% Response.WriteFile("inc.header2.aspx"); %>
<% Response.WriteFile("inc.header.body1.aspx"); %>
<% Response.WriteFile("inc.header.body2.aspx"); %>
<%-- include actual code from page --%>
<form id="form1" name="forattendee" runat="server">
<div id="dvCreditCard" runat="server">
    <div id="main">
        <div class="section">
            <div class="col col-100 center">
                <ul class="menu menu-progress menu-match">
                    <li>Registration Form</li><li>Payment</li><li class="active">Confirmation</li></ul>
                <h2>
                    Step 3: Payment Information</h2>
                <p class="large">
                    Thank you for Registering for the 2014 Investment Conference</p>
                <p class="large">
                    Please print this confirmation page for your records.</p>
                <h2>
                    Confirmation Number:
                    <asp:label id="lblConfirm" runat="server"></asp:label>
                </h2>
                                <h2>
                    CONTRIBUTOR CODE:
                    <asp:label id="lblPromoCode" runat="server"></asp:label>
                </h2><!--
                <h2>
                    Total Due:
                    <asp:label id="lblDue" runat="server"></asp:label>
                </h2>-->
                <h2>
                    Event Details:</h2>
                <p class="large">
                    Monday, May 5, 2014<br />
                    <br />
                    Next Wave<br />
                    Registration: 8:45 AM<br />
                    Program Begins: 9:30 AM<br />
                    <br />
                    Main Sohn Conference<br />
                    Registration: 11:00 AM<br />
                    Conference 12:00 PM - 6:00 PM<br />
                    Reception to Follow<br />
                    <br />
                    Avery Fisher Hall at Lincoln Center<br />
                    132 W. 65th Street (on the corner of Columbus Avenue)
                    <br />
                    New York, NY 10023
                </p>
                <h2>
                    Registration Details</h2>
                <p class="large">
                    <asp:label id="lblAttendees" runat="server"></asp:label>
                </p>
                <%-- <h2>
                    Payment Details</h2>
                <p class="large">
                    <asp:label id="lblStatus" runat="server"></asp:label>
                </p>--%>
                <!----
                                <h2>
                    Check Payment Detail<span class="lower"></h2>
                <p id="pchkPayment" runat="server" class="large">
                    Please make checks payable to Ira Sohn Conference Foundation, Inc. and reference
                    your confirmation number on the check. Checks should be mailed to:
                    <blockquote>
                        Sohn Conference Foundation<br />
                        c/o Suzanne Aiello<br />
                        626 RXR Plaza<br />
                        Uniondale, NY 11556
                    </blockquote>
                    <br />
                    <br />
                    If you are paying via wire transfer please wire your donation to:<br />
                    <br />
                    <blockquote>
                        Bank Name: JPMorgan Private Bank - DE<br />
                        ABA # 021 000 021<br />
                        Bank Address: 500 Stanton - Christiana Road, Newark, DE 19713<br />
                        ABA # 021 000 021<br />
                        For further credit to Account Number - 2681194005<br />
                        <br />
                        Account title: IRA SOHN CONFERENCE FOUNDATION, Inc.
                    </blockquote>
                    A tax deduction receipt will be sent to you immediately following the conference.<br />
                    All but $65.00 per ticket purchased is tax deductible as a charitable contribution
                    to The Sohn Foundation.<br />
                ----->

                    <br />
                    Should you have any questions, please visit the conference website at <a href="www.sohnconference.com">
                        www.sohnconference.com</a> or contact us at <a href="mailto:info@sohnconference.org">
                            info@sohnconference.org</a>.<br />
                    <br />
                    Please print this confirmation page for your records</p>
            </div>
        </div>
    </div>
</div>
<%--<div id="dvCreditCard" runat="server" class="row row-field" >
    <%--- email start ---%>
<%--<div id="confirm">
      <div>
        <h2 style="text-align:center"> Thank you for registering for the<br />
          2014 Sohn Investment Conference</h2>
      </div>
      <h3>Confirmation Number:
        <asp:label id="lblConfirm" runat="server"></asp:label>
      </h3>
      <h3>Event Details:</h3>
      <p style="font-weight: normal;"> Wednesday, May 8, 2014<br />
        Registration 11:15 AM<br />
        Conference 12:00 PM - 6:00 PM<br />
        Reception to Follow<br />
        <br />
        Avery Fisher Hall at Lincoln Center<br />
        132 W. 65th Street (on the corner of Columbus Avenue) <br />
        New York, NY 10023 </p>
      <h3>Registration & Billing Details:</h3>
      <p style="font-weight: normal;">
        <asp:label id="lblStatus" runat="server"></asp:label>
      </p>
       <p align="left">
        <asp:Label ID="lblAttendees" runat="server"></asp:Label>
      </p>
      <h3>Check Payments:</h3>
      <p style="font-weight: normal;"> Please make checks payable to Ira Sohn Conference Foundation, Inc. and reference your confirmation number on the check.  Checks should be mailed to:
      <blockquote>Sohn Conference Foundation<br />
        c/o Suzanne Aiello<br />
        626 RXR Plaza<br />
        Uniondale, NY 11556 </blockquote>
      If you are paying via wire transfer please wire your donation to:
      <blockquote>Bank Name: JPMorgan Private Bank - DE<br />
        ABA # 021 000 021<br />
        Bank Address: 500 Stanton - Christiana Road, Newark, DE 19713<br />
        ABA # 021 000 021<br />
        For further credit to Account Number - 2681194005<br />
        <br />
        Account title: IRA SOHN CONFERENCE FOUNDATION, Inc. </blockquote>
      A tax deduction receipt will be sent to you immediately following the conference.<br />
      <br />
      Should you have any questions, please visit the conference website at <a href="www.sohnconference.com"> www.sohnconference.com</a> or contact us at <a href="mailto:info@irasohnconference.com"> info@sohnconference.org</a>.<br />
      <br />
      Please print this confirmation page for your records
      </p>
      <p align="left" style="font-weight: normal;" id="viewingroomtexttag" runat="server" visible="false"  >
        <%---<span style="font-size: 15px; font-weight: normal;"><b>Please note that the Viewing
                                    Room is located in Jazz at Lincoln Center, with a live feed from theater. You will
                                    have complete access to the post-program cocktail reception. </b></span>---%>
<%--  </p>
      <br id="vrbr1"  runat="server" visible="false"   />
      <br id="vrbr2" runat="server"  visible="false"  />
     
      <%--- <p align="center" style="font-weight: normal;">
                                <a href="https://reg.sohnconference.com/default.aspx" runat="server" id="hrF">Go Home</a></p>---%>
<%--  </div>--%>
<%--- email end 
  </div>
  <br />--%>
<div class="row row-button">
    <a href="https://reg.sohnconference.com/default.aspx" class="bullet bullet-back small left"
        runat="server" id="hrF">Back to Conference Page</a>
</div>
<div id="divAdmin" class="mrgnLf" runat="server">
    <a href="https://reg.sohnconference.com/BO/BoIndex.aspx">BO Home</a>&nbsp;&nbsp;
    |&nbsp;&nbsp;
    <asp:linkbutton id="LinkButton1" runat="server" onclick="lnkLogOut_Click">Logout</asp:linkbutton>
</div>
</form>
<% Response.WriteFile("inc.footer.aspx"); %>
