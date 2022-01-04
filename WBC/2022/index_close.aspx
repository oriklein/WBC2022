<%-- starting line below --%>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index_new" %>

<% Response.WriteFile("inc.header2.aspx"); %>
<%-- include page specific header items --%>
<script language="javascript" type="text/javascript">
    function validate() {
        if (document.getElementById("rdSingleTckt").checked || document.getElementById("rdSposor").checked || document.getElementById("rdDonate").checked) {

            return true;
        } else {
            alert("Please select Attendee type.");
            return false;
        }
    }
</script>
<%-- include header end / body start until content --%>
<% Response.WriteFile("inc.header.body1.aspx"); %>
<% Response.WriteFile("inc.header.body2.aspx"); %>
<%-- include actual code from page --%>






<div class="section">
<div class="col col-100">
<div class="article">

<img class="img img-100" alt="" />
<h1 style="text-align:center; font-size:20px;">2014 Gotham City Gala<br />
Pier Sixty at Chelsea Piers, New York City <br />
Wednesday, November 12, 2014 6 – 9 p.m.</h1>
<div>
  <div><br />
<br />
<br />
Thank you for your interest in the 2014 Gotham City Gala. We regret to inform you that on-line registration for the event has now closed.<u></u><u></u></div>
  <div>
    <div><u></u> <u></u></div>
  </div>
  <div>
    <div>Should you wish to be added to our wait list, please contact Ally Earnley at <a href="mailto:gothamcitygala@sequence-events.com" target="_blank">gothamcitygala@sequence-events.com</a> [(646) 336-6800 x104] or Jay Patrick @ Enterprise, <a href="mailto:jpatrick@enterprisecommunity.org" target="_blank">jpatrick@enterprisecommunity.org</a> [(212) 284-7187]. <u></u><u></u></div>
  </div>
  <div>
    <div><u></u> <u></u></div>
  </div>
  <div>
    <div>If you would like to donate to the Gotham City Gala, please visit <a href="https://donatenow.networkforgood.org/1443287" target="_blank">https://donatenow.networkforgood.org/1443287</a></div>
  </div>
</div>
<br />
<p>&nbsp;</p>

</div>
</div>
</div>
<div class="section">
<div class="col"></div>
</div>


<%-- end page content --%>
<%-- Include Footer --%>
<% Response.WriteFile("inc.footer.aspx"); %>