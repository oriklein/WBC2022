

<%-- starting line below --%>
<%@ page language="C#" autoeventwireup="true" inherits="_Default" CodeFile="~/Default.aspx.cs"  %>
<% Response.WriteFile("inc.header2.aspx"); %>
<% Response.WriteFile("inc.header.body1.aspx"); %>
<% Response.WriteFile("inc.header.body2.aspx"); %>
<ul class="menu menu-progress menu-match"><li class="active">Donation Form</li><li>Review</li><li>Confirmation</li></ul>
    <form id="form1" runat="server" style=" margin:0px">
    <p style="text-align:center; font-size:18px; color:#28417C"> Womens Bond Club 2015 <br />
      Wednesday, May 8, 2014<br />
Doors Open: 11:00 AM<br />
Conference 12:00 PM – 6:00 PM  <br />
Reception to Follow<br />
<br />
Avery Fisher Hall at Lincoln Center
<br />
132 W. 65th Street (on the corner of Columbus Avenue) 
<br />
New York, NY 10023
</p><h1>Conference Pricing</h1>    
    <div style=" float:left; width:450px;">
<h1>2014 Contributor Packages [<a href="ContributorIndex.aspx">register now</a>]</h1>        
        
        &nbsp;&nbsp;Champion: $100,000 (65 seats)<br />
        &nbsp;&nbsp;Benefactor: $50,000  (32 seats)<br />
        &nbsp;&nbsp;Patron: $25,000  (15 seats)<br />
        &nbsp;&nbsp;Sponsor: $10,000  (6 seats)<br />
        &nbsp;&nbsp;Supporter: $5,000  (2 seats) $2,000 for each additional ticket</span><br />
        </div>
    <div style="float:right; width:450px;">    

<h1>Investment Professional  [<a href="index.aspx">register now</a>]</h1>
      &nbsp;&nbsp;$4,000 per registration <br />

<h1>Non-Investment or <br />
Non-Financial Professional [<a href="index.aspx">register now</a>]</h1>        
        <p>&nbsp;&nbsp;$1,500 per registration  <br /><br>
     </p>
      
</div><br>
<br>
<br>
<div style="margin-top:135px">There are a limited number of student tickets available, please email <a href="mailto:info@sohnconference.org">info@sohnconference.org</a> for more information.<h1> More Information</h1>
      <p><strong>Charitable portion of tickets and contributions are tax deductible</strong></p>
      <p>
        A select amount of tickets for the Champion, Benefactor, Patron and Sponsor levels are allocated for preferred seating. <br />
        <br />
        <!---Special contributors registered by <b>May 9th, 2012</b> will be noted in the conference program.--->
        <h1>Contact us: </h1>
                Should you have any questions regarding registration or contributor levels please call 212-677-3173 ext 233 or send an email to  <a href="mailto:info@sohnconference.org">info@sohnconference.org</a> </p></div>
    </form>

<%-- end page content --%>
<%-- Include Footer --%>
<% Response.WriteFile("inc.footer.aspx"); %>