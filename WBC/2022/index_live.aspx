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

<h1 style="text-align:center">
    <font style="font-size:20px">Women’s Bond Club Merit Award Dinner <br />
    Online Commitment Form<br /></font>
    <hr class="style-two">
            American Museum of Natural History<br />
             Central Park West & 79th St.<br />
            New York, NY, 10024<br />
Tuesday, May 2, 2017<br />6pm Cocktails | 7pm Dinner</h1><br />
<p>For more information on the Women’s Bond Club or the Merit Award Dinner, please <a href="http://womensbondclub.com/events/annual-awards/" target="_blank">click here</a></p>

</div>
</div>
</div>
<div class="section">
<div class="col">
<div class="article">
<h1 class="invert">Corporate Member Firms</h1>
<p>If you currently hold a membership with the Women’s Bond Club, you are guaranteed one table. </p>
<a class="bullet bullet-forward small right" href="contributorindex_mb.aspx">To confirm this table or make an additional purchase, please click here</a>
</div>

<div class="article">
<h1 class="invert">Individual Members or Non-Corporate<br /> Member Firms</h1>
<p>If you are an individual member of WBC and wish to buy tickets or do not have a membership with WBC and wish to purchase a table or ticket.</p>

<a class="bullet bullet-forward small right" href="ContributorIndex_nmb.aspx">To purchase a table or ticket, please click here</a>
</div>


</div>
</div>


<%-- end page content --%>
<%-- Include Footer --%>
<% Response.WriteFile("inc.footer.aspx"); %>