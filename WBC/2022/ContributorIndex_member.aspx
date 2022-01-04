<%@ Page Language="C#" AutoEventWireup="true" Inherits="MWF_ContributorIndex" CodeFile="ContributorIndex.aspx.cs" %>

<% Response.WriteFile("inc.header2.aspx"); %>
<link id="sidebar" href="Jscript/Sidebar.js" />

<script language="javascript">
    var x = "";
    function Uncheck(x) {
        if (x != "rdChampion")
            document.getElementById("rdChampion").checked = false;

        if (x != "rdBenefactor")
            document.getElementById("rdBenefactor").checked = false;
        if (x != "rdPatron")
            document.getElementById("rdPatron").checked = false;
        if (x != "rdSponser")
            document.getElementById("rdSponser").checked = false;
        if (x != "rdSupporter")
            document.getElementById("rdSupporter").checked = false;
        if (x == "rdSupporter")
            document.getElementById("divSupport").style.display = "block";
        else
            document.getElementById("divSupport").style.display = "none";
        //if(x!="txtOtherAmount")
        //document.getElementById("txtOtherAmount").value="";

    }

    function IsNumeric(sText) {
        var ValidChars = "0123456789.";
        var IsNumber = true;
        var Char;


        for (i = 0; i < sText.length && IsNumber == true; i++) {
            Char = sText.charAt(i);
            if (ValidChars.indexOf(Char) == -1) {
                IsNumber = false;
            }
        }
        return IsNumber;

    }

    function required1() {

        //if (!document.getElementById("divAdminPrice").style.visibility=="visible")
        var isadmin = '<%=admin%>';
       
        if (isadmin == "no") {


            if (document.getElementById("selContributor").value == "0") {
                alert("Please select Contributor level");
                return false;
            }
            return true;
            
          

        }
        else {
            if (document.getElementById("selContributor").value == "0") {
                alert("Please select Contributor level");
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
    var cost = 0;
    function totalValue(ddValue) {
        if (ddValue.value != "0") {
            document.getElementById("trExtra").style.display = "block";
            document.getElementById("tdTckts").innerHTML = "Additional Tickets: " + ddValue.value + "tickets";
            document.getElementById("tdETCost").innerHTML = "$" + (ddValue.value * 2000).toString().replace(/(\d+)(\d{3})/, '$1' + ',' + '$2');

            document.getElementById("tdTotal").innerHTML = "Total Cost:   $" + (cost + (ddValue.value * 2000)).toString().replace(/(\d+)(\d{3})/, '$1' + ',' + '$2'); ;

        }
        else {
            document.getElementById("trExtra").style.display = "none";
            document.getElementById("tdTotal").innerHTML = "Total Cost:   $" + (cost).toString().replace(/(\d+)(\d{3})/, '$1' + ',' + '$2'); ;

        }

    }
    function contriValue(ddvalue) {
        document.getElementById("selExtra").value = "0";
        document.getElementById("trExtra").style.display = "none";
        if (document.getElementById("selContributor").value == "0") {
            document.getElementById("divTotal").style.display = "none";
        }
        else {

            document.getElementById("divTotal").style.display = "block";
            var contriLevel = document.getElementById("selContributor").value;
            if (contriLevel == "Champion") {
                document.getElementById("tdLevel").innerHTML = "Champion(65 tickets)";
                document.getElementById("tdCost").innerHTML = "$100,000";
                cost = 100000;
            }
            if (contriLevel == "Benefactor") {
                document.getElementById("tdLevel").innerHTML = "Benefactor(35 tickets)";
                document.getElementById("tdCost").innerHTML = "$50,000";
                cost = 50000;
            }
            if (contriLevel == "Patron") {
                document.getElementById("tdLevel").innerHTML = "Patron(15 tickets)";
                document.getElementById("tdCost").innerHTML = "$25,000";
                cost = 25000;
            }
            if (contriLevel == "Sponsor") {
                document.getElementById("tdLevel").innerHTML = "Sponsor(6 tickets)";
                document.getElementById("tdCost").innerHTML = "$10,000";
                cost = 10000;
            }
            if (contriLevel == "Supporter") {
                document.getElementById("tdLevel").innerHTML = "Supporter(2 tickets)";
                document.getElementById("tdCost").innerHTML = "$5,000";
                cost = 5000;
            }
            document.getElementById("tdTotal").innerHTML = "Total Cost:   $" + cost.toString().replace(/(\d+)(\d{3})/, '$1' + ',' + '$2');
        }

    }
    function numbersonly(myfield, e, dec) {
        var key;
        var keychar;

        if (window.event)
            key = window.event.keyCode;

        else if (e)
            key = e.which;
        else
            return true;
        keychar = String.fromCharCode(key);

        // control keys
        if ((key == null) || (key == 0) || (key == 8) ||
            (key == 9) || (key == 13) || (key == 27))
            return true;

        // numbers
        else if ((("0123456789").indexOf(keychar) > -1))
            return true;

        // decimal point jump
        else if (dec && (keychar == ".")) {
            myfield.form.elements[dec].focus();
            return false;
        }
        else
            return false;
    }
</script>

<% Response.WriteFile("inc.header.body1.aspx"); %>
<% Response.WriteFile("inc.header.body2.aspx"); %>

<div class="section">
<div class="col">
<div class="article">
<h1 class="invert">Corporate Member Firms Registration</h1>
</div>
</div>
</div>




<%-- include actual code from page --%>
<form id="form1" name="forattendee" runat="server">
<div id="container1">
    <div id="main">
        <div class="section">
        <div class="row">
  <h3 align="left">What should we say here?</h3>
</div>
            <div class="row row-field">
                <label>Member Firm Table</label>
             <%--   <select class="field field-select large" onchange="contriValue(this)" id="selContributor"--%>
  
               <select class="field field-select large" style="margin-top:20px">
             <option>Table for 10 included in WBC Membership</option>
                        </select>
            </div>
             <div class="row row-field">
                <label>Full Page Ad in MAD Event Journal</label>
             <%--   <select class="field field-select large" onchange="contriValue(this)" id="selContributor"--%>
  
               <select class="field field-select large" style="margin-top:20px">
             <option>Included in WBC Membership</option>
                        </select>
            </div>
               
            
    
           <div class="row row-field"><h3 align="left">For additional purchases, please select from the following:</h3>
        <div class="row">
                <label>Additional Full Table(s):</label>
             <%--   <select class="field field-select large" onchange="contriValue(this)" id="selContributor"--%>
             <select class="field field-select large" style="margin-top:20px">
             <option>Select Quantity</option>
             <option>1</option>
             <option>2</option>
             <option>3</option>
             <option>4</option>
<option>5</option>
<option>6</option>
<option>7</option>
<option>8</option>
<option>9</option>
<option>10</option>

             </select>
            </div>
            
                   <div class="row row-field">
                <label>Additional 1/2 table:</label>
             <%--   <select class="field field-select large" onchange="contriValue(this)" id="selContributor"--%>
             <select class="field field-select large" style="margin-top:20px">
             <option>Select Quantity</option>
             <option>1</option>

             </select>
            </div>
                   <div class="row row-field">
                <label>Additional Ticket(s):</label>
             <%--   <select class="field field-select large" onchange="contriValue(this)" id="selContributor"--%>
             <select class="field field-select large" style="margin-top:20px">
             <option>Select Quantity</option>
              <option>1</option>
             <option>2</option>
             <option>3</option>
             <option>4</option>
             </select>
            </div>
                   <div class="row row-field">
                <label>Additional Full Page Ad in MAD Event Journal:</label>
             <%--   <select class="field field-select large" onchange="contriValue(this)" id="selContributor"--%>
             <select class="field field-select large" style="margin-top:20px">
             <option>Select Quantity</option>
                <option>1</option>
         

             </select>
            </div>
                  
                            <div class="row row-field">
                <label>Additional 1/2 Page Ad in MAD Event Journal:</label>
             <%--   <select class="field field-select large" onchange="contriValue(this)" id="selContributor"--%>
             <select class="field field-select large" style="margin-top:20px">
             <option>Select Quantity</option>
             <option>1</option>
             </select>
            </div>
                     <div class="row row-field"><h2>Disregard below this</h2><br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
</div>
        
            <div class="row row-field">
                <label><span class="req">*</span>Select Type</label>
             <%--   <select class="field field-select large" onchange="contriValue(this)" id="selContributor"--%>
              <select class="field field-select large"  id="selContributor"
                    runat="server">
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
                   Purchase a Journal Ad for MAD</label>
              <%--  <select class="field field-select large" onchange="totalValue(this)" id="selExtra"--%>
              <select class="field field-select large"  id="selMad"
                    runat="server">
                    <option selected="selected" value="0">Select One</option>
                    <option value="1">Full Page Ad in MAD Event Journal ($250)</option>
                    <option value="2">Half Page Ad in MAD Event Journal ($150)</option>
                  <option value="3">Member, Ad already included </option>
                </select>
            </div>
            <%-- <div class="row row-field">
                <label>
                    Purchase a Journal Ad for MAD</label>
              <%--  <select class="field field-select large" onchange="totalValue(this)" id="selExtra"
              <select class="field field-select large"  id="Select1"
                    runat="server">
                    <option selected="selected" value="0">Select One</option>
                    <option value="1">Member</option>
                    <option value="2">Ad already included</option>
                  
                </select>
            </div>--%>
            <div runat="server" visible="false" class="row row-field">
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
            <div id="divTotal" style="display:none;" class="row row-indent">
                <br />
                <br />
                <table width="100%" align="left">
                    <tr>
                        <td style="width: 250px" align="left" id="tdLevel">
                        </td>
                        <td align="left" style="padding-left: 59px;" id="tdCost">
                        </td>
                    </tr>
                    <tr id="trExtra" style="display: none;">
                        <td style="width: 250px;" id="tdTckts">
                        </td>
                        <td align="left" style="padding-left: 59px;" id="tdETCost">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 250px;" />
                        <td align="left" id="tdTotal">
                        </td>
                    </tr>
                </table>
            </div>
          <div class="row row-button">
                <asp:button id="btnSubmit" onclick="btnSubmit_Click" CssClass="bullet bullet-forward small right" onclientclick="javascript:return required1();"
                    runat="server" text="NEXT"  />
            </div>
        </div>
    </div>
</div>

<br />
<div id="divAdmin" class="mrgnLf" runat="server">
    <a href="BO/BoIndex.aspx">BO Home</a>&nbsp;&nbsp; |&nbsp;&nbsp;
    <asp:linkbutton id="LinkButton1" runat="server" onclick="lnkLogOut_Click">Logout</asp:linkbutton>
</div>
</form>
<% Response.WriteFile("inc.footer.aspx"); %>