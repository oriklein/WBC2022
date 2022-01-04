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

//            if (document.getElementById("rdChampion").checked) {
//                document.getElementById("divSupport").style.display = "none";
//                return true;
//            }
//            if (document.getElementById("rdBenefactor").checked) {
//                document.getElementById("divSupport").style.display = "none";
//                return true;
//            }
//            if (document.getElementById("rdPatron").checked) {
//                document.getElementById("divSupport").style.display = "none";
//                return true;
//            }
//            if (document.getElementById("rdSponser").checked) {
//                document.getElementById("divSupport").style.display = "none";
//                return true;
//            }
//            if (document.getElementById("rdSupporter").checked) {
//                document.getElementById("divSupport").style.display = "block";
//                return true;
            //            }
            if (document.getElementById("selContributor").value == "0") {
                alert("Please select Contributor level");
                return false;
            }
            return true;
            
            //if(document.getElementById("txtOtherAmount").value!="")
            //return true;
           
            // alert("here");

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
<div class="row row-indent">
    <ul class="menu menu-progress menu-match">
        <li class="active">REGISTRATION FORM</li><li>PAYMENT</li><li>CONFIRMATION</li></ul>
    <h2>
        Step 1: Registration Form</h2>
<p>Please select your confirmation level for the Womens Bond Club 2015</p>
</div>
<%-- include actual code from page --%>
<form id="form1" name="forattendee" runat="server">
<div id="container1">
    <div id="main">
        <div class="section">
            <div class="row row-field">
                <label>
                    Contributor level</label>
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
                    Additional Tickets</label>
              <%--  <select class="field field-select large" onchange="totalValue(this)" id="selExtra"--%>
              <select class="field field-select large"  id="selExtra"
                    runat="server">
                    <option selected="selected" value="0">Select One</option>
                    <option value="1">1 Additional $2,000 </option>
                    <option value="2">2 Additional $4,000 </option>
                    <option value="3">3 Additional $6,000 </option>
                    <option value="4">4 Additional 8,000 </option>
                    <option value="5">5 Additional $10,000 </option>
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
              
                <asp:button id="btnSubmit" onclick="btnSubmit_Click" onclientclick="javascript:return required1();"
                    runat="server" text="Next" CssClass="bullet bullet-forward small right" />
            </div>
        </div>
    </div>
</div>
<%--<h1 id="ContriHdng" runat="server">
    CONTRIBUTORS – Please select your contribution level
</h1>
<div style="margin-left: 140px">
    <div class="row" style="padding-top: 8px;" id="divChampion" runat="server">
        <div class="cl">
            &nbsp;</div>
        <label class="radiolabel" style="width: 80px; color: rgb(70, 85, 110);" id="lblChampion"
            runat="server">
            Champion
        </label>
        <input name="yes-contact-me2" class="check" id="rdChampion" runat="server" onclick="javascript:Uncheck('rdChampion');"
            type="radio" style="margin-left: 10px" />
        <span class="radiolabel" id="spChampion" runat="server" style="margin: 0 20px  0 10px;
            color: rgb(70, 85, 110);"></span>
        <label class="radiolabel" style="margin-right: 20px; color: rgb(70, 85, 110);" id="lbl2Champion"
            visible="false" runat="server">
            Champion
        </label>
        <div class="cl">
            &nbsp;</div>
    </div>
    <div class="row" style="padding-top: 8px;" id="divBenefactor" runat="server">
        <div class="cl">
            &nbsp;</div>
        <label class="radiolabel" style="width: 80px; color: rgb(70, 85, 110);" runat="server"
            id="lblBenefactor">
            Benefactor
        </label>
        <input name="yes-contact-me2" class="check" id="rdBenefactor" onclick="javascript:Uncheck('rdBenefactor');"
            runat="server" type="radio" style="margin-left: 10px" />
        <span class="radiolabel" id="spBenefactor" runat="server" style="margin: 0 20px  0 10px;
            color: rgb(70, 85, 110);"></span>
        <label class="radiolabel" style="margin-right: 20px; color: rgb(70, 85, 110);" runat="server"
            id="lbl2Benefactor" visible="false">
            Benefactor
        </label>
        <div class="cl">
            &nbsp;</div>
    </div>
    <div class="row" style="padding-top: 8px;" id="divPatron" runat="server">
        <div class="cl">
            &nbsp;</div>
        <label class="radiolabel" style="width: 80px; color: rgb(70, 85, 110);" id="lblPatron"
            runat="server">
            Patron
        </label>
        <input name="yes-contact-me2" class="check" runat="server" onclick="javascript:Uncheck('rdPatron');"
            id="rdPatron" type="radio" style="margin-left: 10px" />
        <span class="radiolabel" id="spPatron" runat="server" style="margin: 0 20px  0 10px;
            color: rgb(70, 85, 110);"></span>
        <label class="radiolabel" style="margin-right: 20px; color: rgb(70, 85, 110);" id="lbl2Patron"
            runat="server" visible="false">
            Patron
        </label>
        <div class="cl">
            &nbsp;</div>
    </div>
    <div class="row" style="padding-top: 8px;" id="divSponsor" runat="server">
        <div class="cl">
            &nbsp;</div>
        <label class="radiolabel" style="width: 80px; color: rgb(70, 85, 110);" id="lblSponsor"
            runat="server">
            Sponsor
        </label>
        <input name="yes-contact-me2" class="check" runat="server" onclick="javascript:Uncheck('rdSponser');"
            id="rdSponser" type="radio" style="margin-left: 10px" />
        <span class="radiolabel" id="spSponsor" runat="server" style="margin: 0 20px  0 10px;
            color: rgb(70, 85, 110);"></span>
        <label class="radiolabel" style="margin-right: 20px; color: rgb(70, 85, 110);" id="lbl2Sponsor"
            runat="server" visible="false">
            Sponsor
        </label>
        <div class="cl">
            &nbsp;</div>
    </div>
    <div class="row" style="padding-top: 8px;" id="divSupporter" runat="server">
        <div class="cl">
            &nbsp;</div>
        <label class="radiolabel" style="width: 80px; color: rgb(70, 85, 110);" id="lblSupporter"
            runat="server">
            Supporter
        </label>
        <input name="yes-contact-me2" class="check" id="rdSupporter" onclick="javascript:Uncheck('rdSupporter');"
            runat="server" type="radio" style="margin-left: 10px" />
        <span class="radiolabel" id="spSupporter" runat="server" style="margin: 0 20px  0 10px;
            color: rgb(70, 85, 110);"></span>
        <label class="radiolabel" style="margin-right: 20px; color: rgb(70, 85, 110);" id="lbl2Supporter"
            runat="server" visible="false">
            Supporter
        </label>
        <div id="divSupport" runat="server" style="display: none; margin-top: 10px; margin-left: 111px;">
            <select onchange="totalValue(this)" id="ddSupport" runat="server">
                <option selected="selected" value="0">Select Additional Supporter Tickets </option>
                <option value="1">1 Additional $2,000 </option>
                <option value="2">2 Additional $4,000 </option>
                <option value="3">3 Additional $6,000 </option>
                <option value="4">4 Additional 8,000 </option>
                <option value="5">5 Additional $10,000 </option>
            </select>
            <h3>
                <span id="spanTotal">Total : $5,000</span></h3>
            &nbsp;</div>
    </div>
    <h2 class="orange" style="margin-left: 240px" id="AdminHdng" runat="server">
        CONTRIBUTORS – Please enter Price and no.of tickets
    </h2>
    <div class="rbg" id="divAdminPrice" visible="false" runat="server">
        <label class="slabeln" style="color: #fff;">
            <span class="req1a">*&nbsp;</span>Admin Price Override:</label>
        <input id="txtAdminPrice" runat="server" class="midfield1" maxlength="12" type="text" />
        <div class="cl">
            &nbsp;</div>
        <br />
    </div>
    <div class="rbg" id="divNoTickets" visible="false" runat="server">
        <label class="slabeln" style="color: #fff; margin: 0px 47px 0px 0px;">
            <span class="req1a">*&nbsp;</span>No.of Tickets:</label>
        <input id="txtAdminTicktets" runat="server" class="midfield1" maxlength="12" type="text" />
        <div class="cl">
            &nbsp;</div>
    </div>
    <!--        <div class="row" >
          <label class="slabel" style="width: 120px; ">Other Amount</label>
          <div style="margin-right:125px;">
          <input name="StreetAddress6"  style="width:150px;  margin-right:125px;"   class="field bigfield" runat="server" onchange="javascript:Uncheck('txtOtherAmount');" id="txtOtherAmount" type="text" />
          </div>
          </div>-->
    <div style="width: 500px; height: 30px;">
    </div>
    <div class="cl" style="margin: 0 0 0 70px; height: 100px; width: 200px;">
        &nbsp;
        <asp:button id="btnSubmit" onclick="btnSubmit_Click" onclientclick="javascript:return required1();"
            runat="server" text="Next" cssclass="button" />
    </div>
</div>--%>
<br />
<div id="divAdmin" class="mrgnLf" runat="server">
    <a href="BO/BoIndex.aspx">BO Home</a>&nbsp;&nbsp; |&nbsp;&nbsp;
    <asp:linkbutton id="LinkButton1" runat="server" onclick="lnkLogOut_Click">Logout</asp:linkbutton>
</div>
</form>
<% Response.WriteFile("inc.footer.aspx"); %>