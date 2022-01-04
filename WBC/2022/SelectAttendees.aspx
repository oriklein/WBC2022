<%-- starting line below --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.new.aspx.cs" Inherits="index_new" %>
<% Response.WriteFile("inc.header2.aspx"); %>
<%-- include page specific header items --%>
<script language="javascript" type="text/javascript">
    function validate() {
        var x = document.getElementById("ddlAttendeCount");
        if (x.options[x.selectedIndex].text == '- select option -') {
            alert("Please select No. of Tickets");
            return false;
        }
        else
            return true;
    }
    function required1() {

        //if (!document.getElementById("divAdminPrice").style.visibility=="visible")
        var isadmin = '<%=admin%>';

        if (isadmin == "no") {


            if (document.getElementById("selContributor").value == "0") {
                alert("Please select Sponsor level");
                return false;
            }
            return true;



        }
        else {
            if (document.getElementById("selContributor").value == "0") {
                alert("Please select Sponsor level");
                return false;
            }

            if (document.getElementById("txtAdminPrice").value == "") {
                alert("Please enter the Price");
                return false;
            }


            if (!IsNumeric(document.getElementById("txtAdminPrice").value)) {
                alert("Price  should be numeric");
                return false;
            }



            if (document.getElementById("txtAdminTicktets").value == "") {
                alert("Please enter the no.of tickets");
                return false;
            }


            if (!IsNumeric(document.getElementById("txtAdminTicktets").value)) {
                alert("Tickets should be numeric");
                return false;
            }


            return true;
        }
    }
    </script>
<%-- include header end / body start until content --%>
<% Response.WriteFile("inc.header.body1.aspx"); %>
<% Response.WriteFile("inc.header.body2.aspx"); %>
<%-- include actual code from page --%>
<form id="form1" class="cform" name="forattendee" runat="server">
<!--- begin Hide December 9, 2014 --->
<div style="display:none" class="article">
<h1 class="invert">TICKET PACKAGES</h1>
<h2>DELUXE TICKET PACKAGE $2,250</h2>
<ul><li>
Includes three tickets</li></ul>

<h2>PREMIUM TICKET PACKAGE $1,500</h2>
<ul><li>Includes two tickets</li></ul>


		<p>Please select a ticket package.</p>
<div  class="row row-field">
                <label>
                    <span class="req">*</span>Ticket Package</label>
             <%--   <select class="field field-select large" onchange="contriValue(this)" id="selContributor"--%>
              <select class="field field-select large"  id="selContributor"  runat="server">
                    <%--  <option selected="selected" value="0">Select Additional Supporter Tickets </option>
                    <option value="Champion">Champion: $100,000 (65 tickets)</option>
                    <option value="Benefactor">Benefactor: $50,000 (32 tickets) </option>
                    <option value="3">3 Additional $6,000 </option>
                    <option value="4">4 Additional 8,000 </option>
                    <option value="5">5 Additional $10,000 </option>--%>
                </select>
            </div>
            <div class="row row-field">
                <label>
                    Additional Tickets</label>
              <%--  <select class="field field-select large" onchange="totalValue(this)" id="selExtra"--%>
              <select class="field field-select large"  id="selExtra"
                    runat="server">
                    <option selected="selected" value="0">Select One</option>
                    <option value="1">1 Additional $800 </option>
                    <option value="2">2 Additional $1,600 </option>
                    <option value="3">3 Additional $2,400 </option>
                    <option value="4">4 Additional $3,200 </option>
                    <option value="5">5 Additional $4,000 </option>
                </select>
            </div>
            
             <div class="row row-field" id="divAdminPrice" visible="false" runat="server">
                    <label>
                       Admin Price Override:</label>
                    <input id="txtAdminPrice" runat="server" class="field field-text large" maxlength="12" type="text" />
                    
                </div>
                  <div class="row row-field" id="divNoTickets" visible="false" runat="server">
                    <label>
                      No.of Tickets:</label>
                    <input id="txtAdminTicktets" runat="server" class="field field-text large" maxlength="12" type="text" />
                  
                </div>
<div class="row row-button">
                <asp:button id="btnSubmit" onclick="btnSubmit_Click" CssClass="bullet bullet-forward large right" onclientclick="javascript:return required1();"
                    runat="server" text="NEXT"  />
            </div>
</div>
<!--- End HIDE December 9, 2014 --->
<div class="article">
<h1 class="invert">Single Tickets</h1>

<h2>Member Individual Ticket  :  $750</h2>

<h2>Non Member Individual Ticket : $1,100 </h2>

<ul><li>2 ticket maximum purchase limit</li><li>
$250 per seat is tax deductible 
</li></ul>


</div>

<div class="row">
							
							
							<p>Please select number of tickets to purchase. You will be able to select the ticket type on the next page. </p>
						</div>

						
						

	<div class="row row-field"><label><span class="req">*</span>Number of Tickets</label>
    <select name="SelRRegarding" class="field field-select large" runat="server" id="ddlAttendeCount">
            <option value="" selected="selected">- select option -</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <%--<option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>--%>
          </select></div>
          <div class="row row-field">
                <label>
                    Purchase an Ad in MAD</label>
              <%--  <select class="field field-select large" onchange="totalValue(this)" id="selExtra"--%>
              <select class="field field-select large"  id="selMad"
                    runat="server">
                    <option selected="selected" value="0">Select One</option>
                    <option value="1">Full Page Ad in MAD Event Journal ($250)</option>
                    <option value="2">Half Page Ad in MAD Event Journal ($150)</option>
                  
                </select>
            </div>
         <div class="row row-button">
            <asp:Button  ID="btnNext" OnClientClick="javascript:return validate()" CssClass="bullet bullet-forward large right" runat="server" Text="NEXT" OnClick="btnNext_Click" />
          </div>
     
        <div id="divAdmin" class="mrgnLf" runat="server"> <a href="BO/BoIndex.aspx">BO Home</a>&nbsp;&nbsp; |&nbsp;&nbsp;
          <asp:LinkButton ID="LinkButton1" runat="server" OnClick="lnkLogOut_Click">Logout</asp:LinkButton>
        </div>
</form>
<%-- end page content --%>
<%-- Include Footer --%>
<% Response.WriteFile("inc.footer.aspx"); %>