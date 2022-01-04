<%-- starting line below --%>
<%@ page language="C#" autoeventwireup="true" inherits="AttendeeSummaryInfo" CodeFile="AttendeeSummaryInfo.aspx.cs"  %>
<% Response.WriteFile("inc.header2.aspx"); %>
<%-- include page specific header items --%>



<%-- include header end / body start until content --%>
<% Response.WriteFile("inc.header.body1.aspx"); %>
<%-- Change text below to refect the page the user is on will either be Attendee reservation --%>
<% Response.WriteFile("inc.header.body2.aspx"); %>
<%-- include actual code from page --%>
<div class="row row-indent">
    <ul class="menu menu-progress menu-match">
        <li>Registration Form</li><li class="active">Payment</li><li>Confirmation</li></ul>
    <h2>
        Step 2: Attendee Information</h2>
        <p>
        Please review the below information.</p><br /><br />
</div>
<%-- include actual code from page --%>
<form id="form1" name="forattendee" runat="server">

    
        <div id="dvUserInfo" class="row row-indent"  runat="server"> </div>    
     
        <div id="dvAttendees" class="row row-indent"  runat="server"> </div>
         <div class="row row-button">
      
            <asp:Button ID="btnEditAttendee" CssClass="bullet bullet-back small left" runat="server" Text="Edit Attendee"
                                                OnClick="btnEditAttendee_Click" />
           
            <asp:Button ID="btnPay" CssClass="bullet bullet-forward small right" runat="server" Text="Proceed to Payment"
                                                OnClick="btnPay_Click" />
          </div>
      
      <br />
      <div id="divAdmin" class="mrgnLf" runat="server"> <a href="BO/BoIndex.aspx">BO Home</a>&nbsp;&nbsp; |&nbsp;&nbsp;
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="lnkLogOut_Click">Logout</asp:LinkButton>
      </div>
</form>
<%-- end page content --%>
<%-- Include Footer --%>
<% Response.WriteFile("inc.footer.aspx"); %>
