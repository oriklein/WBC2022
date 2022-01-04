<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" EnableViewStateMac="false"  Inherits="AttendePayInfo" CodeFile="AttendePayInfo.aspx.cs" %>

<% Response.WriteFile("inc.header2.aspx"); %>
<link id="sidebar" href="Jscript/Sidebar.js" />

<script language="javascript" type="text/javascript" src="Jscript/CreditCard.js"></script>

<script language="javascript" type="text/javascript">
    function echeck(str) {

        var at = "@"
        var dot = "."
        var lat = str.indexOf(at)
        var lstr = str.length
        var ldot = str.indexOf(dot)
        if (str.indexOf(at) == -1) {
            return false
        }

        if (str.indexOf(at) == -1 || str.indexOf(at) == 0 || str.indexOf(at) == lstr) {
            return false
        }

        if (str.indexOf(dot) == -1 || str.indexOf(dot) == 0 || str.indexOf(dot) == lstr) {
            return false
        }

        if (str.indexOf(at, (lat + 1)) != -1) {
            return false
        }

        if (str.substring(lat - 1, lat) == dot || str.substring(lat + 1, lat + 2) == dot) {
            return false
        }

        if (str.indexOf(dot, (lat + 2)) == -1) {
            return false
        }

        if (str.indexOf(" ") != -1) {
            return false
        }

        return true
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

    function show_CreditCard() {
        var ddlCard = document.getElementById("ddlPayment");
        if (ddlCard.options[ddlCard.selectedIndex].text == "Credit Card") {
            document.getElementById("dvCreditCard").style.visibility = 'visible';
            document.getElementById("dvCheck").style.visibility = 'hidden';
        }
        else if (ddlCard.options[ddlCard.selectedIndex].text == "Check") {
            document.getElementById("dvCheck").style.visibility = 'visible';
            document.getElementById("dvCreditCard").style.visibility = 'hidden';
        }
    }

    // For Expiry Year - Raghav
    function validateExp() {
        var d1 = new Date();
        var month = document.getElementById("ddlExpirationMonth");
        //    alert(month.options[month.options.selectedIndex].innerText);
        var yearexp = document.getElementById("ddlExpirationDate");
        //    alert(d1.getMonth());
        //  alert(month.options[month.options.selectedIndex].innerText < d1.getMonth());
        if ((month.options[month.options.selectedIndex].innerText < d1.getMonth() + 1) && (yearexp.options[yearexp.options.selectedIndex].innerText == d1.getYear())) {
            alert("Your Credit Card Has Expired");
            month.focus();
            return false;
        }
    }
    function validate() {
        //validate
        //CreditCardValid();


        if (document.getElementById("ddlCreditCardType").options[document.getElementById("ddlCreditCardType").selectedIndex].text == "- select option -") {
            alert("Please Select the Credit Card Type");
            return false;
        }
        if (document.getElementById("txtCreditCardNo").value == "") {
            alert("Please Enter Credit Card Number");
            return false;
        }

        //Credit card Validation.    
        var cmb = document.getElementById("ddlCreditCardType");
        var txtCardType;
        if (document.all)
            txtCardType = cmb.options[cmb.options.selectedIndex].innerText;
        else
            txtCardType = cmb.options[cmb.options.selectedIndex].textContent;

        if (!checkCreditCard(document.getElementById("txtCreditCardNo").value, txtCardType)) {
            alert(ccErrors[ccErrorNo]);
            document.getElementById("txtCreditCardNo").focus();
            return false;
        }

        //End of Credit Card Validation code Added By Ravi Pulluri.

        if (document.getElementById("txtSecurityCode").value == "") {
            alert("Please enter the Security Code");
            return false;
        }
        else {
            if (!IsNumeric(document.getElementById("txtSecurityCode").value)) {
                alert("Security Code should be numeric");
                return false;
            }
        }



        var month = document.getElementById("ddlExpirationMonth");
        if (month.selectedIndex == 0) {
            alert("Please Select Credit Card Expiry Month ");
            month.focus();
            return false;
        }
        var year = document.getElementById("ddlExpirationDate");
        if (year.selectedIndex == 0) {
            alert("Please Select Credit Card Expiry Year");
            year.focus();
            return false;
        }



        var myDate = new Date();
        var year = document.getElementById("ddlExpirationDate");
        var y = year.options[year.options.selectedIndex].innerText;
        var month = document.getElementById("ddlExpirationMonth");
        var m = parseInt(month.options[month.options.selectedIndex].innerText) - 1;
        myDate.setFullYear(y, m, 01);
        var today = new Date();
        if (myDate.getYear() <= today.getYear()) {
            if (myDate.getMonth() < today.getMonth()) {
                alert("The Credit Card has Expired. Please try Again");
                return false;
            }

        }







        if (document.getElementById("txtFirstName1").value == "") {
            alert("Please enter First Name");
            return false;
        }

        if (document.getElementById("txtLastName1").value == "") {
            alert("Please enter Last Name");
            return false;
        }
        if (document.getElementById("txtCompnayName1").value == "") {
            alert("Please enter Company Name");
            return false;
        }

        if (document.getElementById("txtEmail1").value == "") {
            alert("Please enter Email-id");
            return false;
        }
        if (echeck(document.getElementById("txtEmail1").value) == false) {
            alert("Email-ID is incorrect.");
            return false;
        }


        if (document.getElementById("txtPhone1").value == "") {
            alert("Please enter Phone Number");
            return false;
        }

        if (document.getElementById("txtAddress1").value == "") {
            alert("Please enter Address");
            return false;
        }

        var country = document.getElementById("ddlCountry1");
        if (country.options[country.selectedIndex].text == "- select option -") {
            alert("Please select the Country");
            return false;
        }
        if (document.getElementById("txtCity1").value == "") {
            alert("Please enter City");
            return false;
        }
        if (country.options[country.selectedIndex].text != "Other") {
            var state1 = document.getElementById("ddlState1");
            if (state1.options[state1.selectedIndex].text == "Select State") {
                alert("Please select the State");
                return false;
            }
        }
        else {
            if (document.getElementById("txtState1").value == "") {
                alert("Please enter the State");
                return false;
            }
        }

        if (document.getElementById("txtZip1").value == "") {
            alert("Please enter Zipcode");
            return false;
        }
        return validateDonation1();
        //return true;

    }

    function validateDonation1() {
        //alert('here');
        //For Donation Text
        if (document.getElementById("rdIndividual1").checked || document.getElementById("rdOrganization1").checked || document.getElementById("rdOther1").checked) {
            if (document.getElementById("rdOther1").checked && document.getElementById("txtIndOrg1").value == "") {
                alert("Please enter individual/organization responsible.");
                return false;
            }
            if (document.getElementById("rdIndividual1").checked && document.getElementById("txtIndOrg1").value == "") {
                alert("Please enter individual responsible.");
                return false;
            }
            if (document.getElementById("rdOrganization1").checked && document.getElementById("txtIndOrg1").value == "") {
                alert("Please enter organization responsible.");
                return false;
            }
            return true;
        }
        else {
            alert("Please select one of the three options.");
            return false;
        }

    }


    function validateContributorCode(){
        if (document.getElementById("txtContributorCode").value == "") {
            alert("Please enter ContributorCode");
            return false;
        }        
    }
    function validateAttende2() {
        if (document.getElementById("txtFirstName2").value == "") {
            alert("Please enter First Name");
            return false;
        }

        if (document.getElementById("txtLastName2").value == "") {
            alert("Please enter Last Name");
            return false;
        }
        if (document.getElementById("txtCompany2").value == "") {
            alert("Please enter Company Name");
            return false;
        }
         var control = document.getElementById("selPart");
         if (control.options[control.selectedIndex].text == "Yes") {

             var year = document.getElementById("selYear");
            
             if (year.options[year.selectedIndex].text == "Select") {
                 alert("Please select Year");
                 return false;
             }
         }
        if (document.getElementById("txtEmail2").value == "") {
            alert("Please enter Email-id");
            return false;
        }
        if (echeck(document.getElementById("txtEmail2").value) == false) {
            alert("Email-ID is incorrect.");
            return false;
        }

        if (document.getElementById("txtPhone2").value == "") {
            alert("Please enter Phone Number");
            return false;
        }

        if (document.getElementById("txtAddress2").value == "") {
            alert("Please enter Address");
            return false;
        }

        var country = document.getElementById("ddlCountry2");
        if (country.options[country.selectedIndex].text == "- select option -") {
            alert("Please select the Country");
            return false;
        }
        if (document.getElementById("txtCity2").value == "") {
            alert("Please enter City");
            return false;
        }
        if (country.options[country.selectedIndex].text != "Other") {
            var state1 = document.getElementById("ddlState3");
            if (state1.options[state1.selectedIndex].text == "Select State") {
                alert("Please select the State");
                return false;
            }
        }
        else {
            if (document.getElementById("txtState2").value == "") {
                alert("Please enter the State");
                return false;
            }
        }
        if (document.getElementById("txtZip2").value == "") {
            alert("Please enter Zipcode");
            return false;
        }

        //return validateDonation();
        return true;
    }

    function validateDonation() {
        //For Donation Text
        if (document.getElementById("rdIndividual").checked || document.getElementById("rdOrganization").checked || document.getElementById("rdOther").checked) {
            if (document.getElementById("rdOther").checked && document.getElementById("txtIndOrg").value == "") {
                alert("Please enter individual/organization responsible.");
                return false;
            }
            if (document.getElementById("rdIndividual").checked && document.getElementById("txtIndOrg").value == "") {
                alert("Please enter individual responsible.");
                return false;
            }
            if (document.getElementById("rdOrganization").checked && document.getElementById("txtIndOrg").value == "") {
                alert("Please enter organization responsible.");
                return false;
            }
            return true;
        }
        else {
            alert("Please select one of the three options.");
            return false;
        }

    }

    function hide_billing() {
        if (document.getElementById("chkSame").checked)
            document.getElementById("dvBilling").style.visibility = 'hidden';
        else
            document.getElementById("dvBilling").style.visibility = 'visible';
    }

    var ddl = "";
    var dv = "";
    var txt = "";
    var country = "";
    function year_visible(ddl, dv) {
        
        var control = document.getElementById(ddl);
        if (control.options[control.selectedIndex].text == "No") {
            //    document.getElementById(dv).style.visibility='hidden';
            //    document.getElementById(txt).style.visibility='visible';
            //    document.getElementById(country).style.visibility='visible';
            document.getElementById(dv).style.display = 'none';
           
            // document.getElementById(country).style.display = 'block';
        }
        else {
            //    document.getElementById(dv).style.visibility='visible';
            //    document.getElementById(txt).style.visibility='hidden';
            //    document.getElementById(country).style.visibility='hidden';

            document.getElementById(dv).style.display = 'block';
          
            //document.getElementById(country).style.display = 'none';
        }
    }
    function state_visible(ddl, dv, txt) {
        var control = document.getElementById(ddl);
        if (control.options[control.selectedIndex].text == "Other") {
            //    document.getElementById(dv).style.visibility='hidden';
            //    document.getElementById(txt).style.visibility='visible';
            //    document.getElementById(country).style.visibility='visible';
            document.getElementById(dv).style.display = 'block';
            document.getElementById(txt).style.display = 'block';
            // document.getElementById(country).style.display = 'block';
        }
        else {
            //    document.getElementById(dv).style.visibility='visible';
            //    document.getElementById(txt).style.visibility='hidden';
            //    document.getElementById(country).style.visibility='hidden';

            document.getElementById(dv).style.display = 'none';
            document.getElementById(txt).style.display = 'none';
            //document.getElementById(country).style.display = 'none';
        }
    }
    function clearText(text) {
        if (document.getElementById(text).value == "Country") {
            document.getElementById(text).value = "";
        }
    }

    function restoretext(text) {
        if (document.getElementById(text).value == "") {
            document.getElementById(text).value = "Country";
        }
    }

    function CreditCardValid() {

        //alert("hi");

        var cmb = document.getElementById("ddlCreditCardType");
        var txtCardType;
        if (document.all)
            txtCardType = cmb.options[cmb.options.selectedIndex].innerText;
        else
            txtCardType = cmb.options[cmb.options.selectedIndex].textContent;

        if (!checkCreditCard(document.getElementById("txtCreditCardNo").value, txtCardType)) {
            alert(ccErrors[ccErrorNo]);
            document.getElementById("txtCreditCardNo").focus();
            return false;
        }

    }
    var ddlcountry = "";
    var country = "";
    var ddlstate = "";
    var state = "";
    function display(ddlcountry, country, ddlstate, state) {

        var dc = document.getElementById(ddlcountry);

        //alert(dc.options[dc.selectedIndex].text);
        if (dc.options[dc.selectedIndex].text == "Other") {
            document.getElementById(country).style.display = 'block';
            document.getElementById(ddlstate).style.display = 'none';
            document.getElementById(state).style.display = 'block';

            /*document.getElementById(country).style.backgorundcolor='green';*/

            //document.getElementById(state).style.marginLeft='15px';
            //document.getElementById(state).style.borderLeft='10px solid #FFF';
        }
        else {
            document.getElementById(country).style.display = 'none';
            document.getElementById(ddlstate).style.display = 'block';
            document.getElementById(state).style.display = 'none';
            //document.getElementById(ddlstate).style.marginleft='15px';
        }
    }

    function validateExpiry() {
        var myDate = new Date();
        var year = document.getElementById("ddlExpirationDate");
        var y = year.options[year.options.selectedIndex].innerText;
        var month = document.getElementById("ddlExpirationMonth");
        var m = parseInt(month.options[month.options.selectedIndex].innerText) - 1;
        myDate.setFullYear(y, m, 01);
        var today = new Date();
        if (myDate.getYear() <= today.getYear()) {
            if (myDate.getMonth() < today.getMonth()) {
                alert("The Credit Card has Expired. Please try Again");
                return false;
            }

        }
        return true;

    }


    function showIndOrgTxtBox(chk, chktype) {

        if (chk == 'YES' && chktype == 'Ind') {
            document.getElementById("divIndOrg").style.visibility = "visible";
            //document.getElementById("divIndOrg").style.display="block";
            document.getElementById("txtIndOrg").value = document.getElementById("txtFirstName2").value + " " + document.getElementById("txtLastName2").value;
        }

        if (chk == 'YES' && chktype == 'Org') {
            document.getElementById("divIndOrg").style.visibility = "visible";
            //document.getElementById("divIndOrg").style.display="block";
            document.getElementById("txtIndOrg").value = document.getElementById("txtCompany2").value;
        }
        if (chk == 'YES' && chktype == 'Other') {
            document.getElementById("divIndOrg").style.visibility = "visible";
            //document.getElementById("divIndOrg").style.display="block";
            document.getElementById("txtIndOrg").value = "";
        }


    }

    function showIndOrgTxtBox1(chk, chktype) {
        if (chk == 'YES' && chktype == 'Ind') {
            document.getElementById("divIndOrg1").style.visibility = "visible";
            //document.getElementById("divIndOrg1").style.display="block";
            document.getElementById("txtIndOrg1").value = document.getElementById("txtFirstName1").value + " " + document.getElementById("txtLastName1").value;
        }

        if (chk == 'YES' && chktype == 'Org') {
            document.getElementById("divIndOrg1").style.visibility = "visible";
            //document.getElementById("divIndOrg1").style.display="block";
            document.getElementById("txtIndOrg1").value = document.getElementById("txtCompnayName1").value;
        }
        if (chk == 'YES' && chktype == 'Other') {
            document.getElementById("divIndOrg1").style.visibility = "visible";
            //document.getElementById("divIndOrg1").style.display="block";
            document.getElementById("txtIndOrg1").value = "";
        }

    } 



</script>

<%-- include header end / body start until content --%>
<% Response.WriteFile("inc.header.body1.aspx"); %>
<% Response.WriteFile("inc.header.body2.aspx"); %>
<div class="row row-indent">
    <ul class="menu menu-progress menu-match">
        <li>Registration</li><li class="active">Details</li><li>Confirmation</li></ul>
    <h2>
      Details</h2>
    <p>
        *Required</p>
</div>
<%-- include actual code from page --%>
<form id="form1" name="forattendee" runat="server">
<div id="container1">
    <%--<div id="dvUserInfo" class="row" style="margin-left: 140px" runat="server"></div>--%>
    <div id="dvUserInfo" class="row row-indent" runat="server">
    </div>
    <!-- <h2 class="orange" style="margin-left:320px">Payment Information </h2> -->
    <div runat="server" visible="false" class="row row-field">
        <asp:label id="lblStatus" runat="server" forecolor="Red" visible="false"></asp:label>
        <label>
            <span class="req">*</span>I will pay by :</label>
        <asp:dropdownlist id="ddlCardType" runat="server" cssclass="field field-select" autopostback="true"
            width="300px" onselectedindexchanged="ddlCardType_SelectedIndexChanged">
                                        <asp:ListItem Value="0">-Select Payment Option-</asp:ListItem>
                                        <asp:ListItem Value="1">Pay By Credit Card</asp:ListItem>
                                        <asp:ListItem Value="2">Pay By Check or Wire Transfer</asp:ListItem>
                                       <%-- <asp:ListItem Value="3">I have a Contributor Code</asp:ListItem>--%>
                                    </asp:dropdownlist>
        <div class="cl">
            &nbsp;</div>
    </div>
    <div>
    </div>
    <asp:multiview id="paymentView" runat="server">
                                    <asp:View ID="view1" runat="server">
                                        &nbsp;&nbsp;</asp:View>
                                    <asp:View ID="View2" runat="server">
                                       
                                            <div class="row row-field">
                                              
                                                <h2>
                                                    Credit Card Information</h2>
                                            </div>
                                          
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Credit Card Type
                                                    </label>
                                                    <select name="SelRRegarding4" class="field field-select" runat="server" id="ddlCreditCardType">
                                                        <option selected="selected">- select option -</option>
                                                        <option value="Visa">Visa</option>
                                                        <option value="Master">Master Card</option>
                                                        <option value="Amex">American Express</option>
                                                    </select>
                                                 
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Credit Card Number</label>
                                                    <input name="StreetAddress4"  class="field field-text large" runat="server"
                                                        id="txtCreditCardNo" type="text" />
                                                   
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Security Code ( CVV )</label>
                                                    <input name="StreetAddress5" maxlength="4" class="field field-text xsmall" runat="server"
                                                        id="txtSecurityCode" type="text" />
                                                   
                                               
                                                    <label>
                                                        <span class="req">*</span>Expiration</label>
                                                    <select id="ddlExpirationMonth" runat="server" class="field field-select"
                                                        onchange="javascript:return validateExpiry();">
                                                        <option selected="selected" value="Select">-Select-</option>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5">5</option>
                                                        <option value="6">6</option>
                                                        <option value="7">7</option>
                                                        <option value="8">8</option>
                                                        <option value="9">9</option>
                                                        <option value="10">10</option>
                                                        <option value="11">11</option>
                                                        <option value="12">12</option>
                                                    </select>
                                                    <select runat="server" id="ddlExpirationDate" class="field field-select"
                                                        onchange="javascript:return validateExpiry();">
                                                        <option selected="selected" value="Select">-Select-</option>

                                                        <option value="2012">2012</option>
                                                        <option value="2013">2013</option>
                                                        <option value="2014">2014</option>
                                                        <option value="2015">2015</option>
                                                        <option value="2016">2016</option>
                                                        <option value="2017">2017</option>
                                                        <option value="2018">2018</option>
                                                        <option value="2019">2019</option>
                                                        <option value="2020">2020</option>
                                                        <option value="2022">2022</option>
                                                    </select>
                                                   
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req"></span>Send Email Receipt to</label>
                                                    <select name="SelRRegarding4" class="field field-select" runat="server"
                                                        id="ddlEmailSettings">
                                                        <option selected="selected">Attendee 1</option>
                                                        <option>All Attendees</option>
                                                        <option>Email Address below</option>
                                                    </select>
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <h1>Credit Holder Information</h1> 
                                                    </label>
                                                 
                                                   </div>
                                                    <div class="row row-field">
                                                      <label>
                                                       Same information as Attendee 1 :
                                                    </label>
                                                        <asp:CheckBox ID="chkSame"  class="field field-checkbox" AutoPostBack="true" OnCheckedChanged="chkSame_CheckedChanged"
                                                            runat="server" />
                                                  

                                                </div>
                                                 <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>WBC Contact</label>
                                                    <input name="StreetAddress" class="field field-text large"  runat="server"
                                                        id="txtWBC" type="text">
                                                   
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>First Name</label>
                                                    <input name="StreetAddress" class="field field-text large"  runat="server"
                                                        id="txtFirstName1" type="text">
                                                   
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Last Name</label>
                                                    <input name="StreetAddress" class="field field-text large" runat="server"
                                                        id="txtLastName1" type="text">
                                                  
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Company Name</label>
                                                    <input class="field field-text large" id="txtCompnayName1" runat="server"
                                                        type="text" />
                                                 
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        Title</label>
                                                    <input name="StreetAddress3" class="field field-text large" runat="server"
                                                        id="txtTitle1" type="text" />
                                                   
                                                        
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Email</label>
                                                    <input name="StreetAddress" class="field field-text large" runat="server" 
                                                        id="txtEmail1" type="text" />
                                                   
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Phone</label>
                                                    <input  class="field field-text small" id="txtPhone1"
                                                        runat="server" type="text" />
                                                    <label>
                                                        Ext</label>
                                                    <input  class="field field-text xsmall" id="txtExt1"  runat="server"
                                                        type="text" />
                                                
                                                </div>
                                  
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Address</label>
                                                    <input name="StreetAddress" class="field field-text large" runat="server" id="txtAddress1"
                                                        type="text" />
                                                
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        Address 2</label>
                                                    <input class="field field-text large" id="txtAddress12" maxlength="15" runat="server" type="text" />
                                                    
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Country</label>
                                                    <select  class="field field-select large" runat="server"
                                                        onchange="javascript: return state_visible('ddlCountry1','txtCountry1','ddlState1','txtState1')"
                                                        id="ddlCountry1">
                                                        <option value="USA" selected="selected">USA</option>
                                                        <option value="Other">Other</option>
                                                    </select>
                                                   
                                                        <input id="txtCountry1" runat="server" class="field field-text" 
                                                           type="text" value="Country" style="display: none;"
                                                            onfocus="clearText('txtCountry1')" onblur="restoretext('txtCountry1')" />
                                                  
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>City:</label>
                                                    <input  id="txtCity1" maxlength="30" runat="server" class="field field-text large"
                                                        type="text" />
                                                </div>
                                                <div class="row row-field">
                                                  
                                                        <label>
                                                            <span class="req">*</span>State:</label>                                                     
                                                            <select class="field field-select large" id="ddlState1" runat="server">
                                                                <option selected="selected">Select State</option>
                                                                <option>AL</option>
                                                                <option>AK</option>
                                                                <option>AZ</option>
                                                                <option>AR</option>
                                                                <option>CA</option>
                                                                <option>CO</option>
                                                                <option>CT</option>
                                                                <option>DC</option>
                                                                <option>DE</option>
                                                                <option>FL</option>
                                                                <option>GA</option>
                                                                <option>HI</option>
                                                                <option>ID</option>
                                                                <option>IL</option>
                                                                <option>IN</option>
                                                                <option>IA</option>
                                                                <option>KS</option>
                                                                <option>KY</option>
                                                                <option>LA</option>
                                                                <option>ME</option>
                                                                <option>MD</option>
                                                                <option>MA</option>
                                                                <option>MI</option>
                                                                <option>MN</option>
                                                                <option>MS</option>
                                                                <option>MO</option>
                                                                <option>MT</option>
                                                                <option>NE</option>
                                                                <option>NV</option>
                                                                <option>NH</option>
                                                                <option>NJ</option>
                                                                <option>NM</option>
                                                                <option>NY</option>
                                                                <option>NC</option>
                                                                <option>ND</option>
                                                                <option>OH</option>
                                                                <option>OK</option>
                                                                <option>OR</option>
                                                                <option>PA</option>
                                                                <option>RI</option>
                                                                <option>SC</option>
                                                                <option>SD</option>
                                                                <option>TN</option>
                                                                <option>TX</option>
                                                                <option>UT</option>
                                                                <option>VT</option>
                                                                <option>VA</option>
                                                                <option>WA</option>
                                                                <option>WV</option>
                                                                <option>WI</option>
                                                                <option>WY</option>
                                                            </select>
                                                      
                                                     
                                                            <input type="text" style="display: none;" runat="server"  id="txtState1"
                                                               class="field field-text small" />
                                                    </div>
                                                
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Zip/Postal Code:</label>
                                                    <input runat="server" class="field field-text large"
                                                        id="txtZip1" type="text" />
                                                 
                                                </div>
                                                  <div class="row row-indent">
                                                    <H2>Donation acknowledgement.</H2>
                                                    <p>Your registration for The  Womens Bond Club 2015 supports 
                                                    <br /> The Womens Bond Club 2015 and its mission to fund innovative<br />
                                                     programs for the treatment and cure of pediatric cancer.<br />
                                                      Donation acknowledgement letters will be mailed out the following the conference.<br /><br />
                                                    
                                                    For tax purposes, indicate the individual or organization responsible for the donation.</p>
                                                </div>
                                                <div class="row row-field">
                                                  <label>Indicate the individual listed above</label>
                                                    <input id="rdIndividual1" class="field field-radio" type="radio" runat="server" value="YES" name="rdIndividual"
                                                        onclick="showIndOrgTxtBox1('YES','Ind');" />
                                                  
                                                </div>
                                                <div class="row row-field">
                                                  <label>Indicate the organization listed above</label>
                                                    <input id="rdOrganization1" class="field field-radio" type="radio" runat="server" value="YES" name="rdIndividual"
                                                        onclick="showIndOrgTxtBox1('YES','Org');" />
                                                  
                                                </div>
                                                <div class="row row-field">
                                                   <label>Other</label>
                                                    <input id="rdOther1" type="radio" class="field field-radio" name="rdIndividual" runat="server" value="YES"
                                                        onclick="showIndOrgTxtBox1('YES','Other');" />
                                                </div>
                                                 <div class="row row-field" id="divIndOrg1" style="visibility: hidden;">
                                                     <label><span class="req">*</span>Individual or Organization responsible </label>
                                                    <asp:TextBox class="field field-text large" ID="txtIndOrg1"  runat="server" />
                                                </div>
                                                <div class="row row-button">
                                                        <asp:Button ID="btnCreditEdit" CssClass="bullet bullet-back small left" OnClick="btnEditAttendee_Click"
                                                            runat="server" Text="Edit Attendees" />
                                                      <asp:Button ID="btnCreditNext" CssClass="bullet bullet-forward small right" runat="server" OnClick="btnNext_Click"
                                                            OnClientClick="javascript: return validate();" Text="Pay Now" />
                                                   
                                                </div>
                                          
                                        
                                    </asp:View>
                                    <asp:View ID="view3" runat="server">
                                     
                                            <div class="hdngrow row row-indent">
                                                <span class="reqHdng">*Required</span>
                                               
                                            </div>
                                            <div visible="false" class="row row-field" id="divPay" runat="server">
                                                <label>
                                                    Payment will be made by:
                                                </label>
                                               
                                                    <input type="radio" class="field field-radio"  id="rdCheck" runat="server" name="rdcheckwire" value="Check"
                                                        checked />
                                                    <label> Check</label>
                                              
                                                    <input  visible="false" type="radio" class="field field-radio"  id="rdWire" runat="server" name="rdcheckwire" value="Wire Transfer" />
                                                    <%-- <label> Wire Transfer</label>--%>
                                                     <input type="radio" class="field field-radio"  id="rdCC" runat="server" name="rdcheckwire" value="CC" />
                                                     <label> Credit Card</label>
                                                <div style="display: none;">
                                                    <asp:RadioButtonList class="field field-select"  ID="rdListCheckWire" runat="server" RepeatDirection="Horizontal">
                                                        <asp:ListItem Text="Check" Value="Check"></asp:ListItem>
                                                        <asp:ListItem Text="Wire Transfer" Value="Wire Transfer"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </div>
                                               
                                            </div>
                                            
                                                <div class="row row-field">
                                                    <label>
                                                       Same information as Attendee 1 :
                                                    </label>
                                                  <div style="margin-top: 37px;">
                                                        <asp:CheckBox ID="chkSame1" class="field field-checkbox" OnCheckedChanged="chkSame_CheckedChanged1"
                                                            AutoPostBack="true" runat="server" /></div>
                                                </div>
                                                <div runat="server" visible="false" class="row row-field">
                                                    <label>
                                                        <span class="req"></span>Send Email Receipt to</label>
                                                    <select name="SelRRegarding4" class="field field-select" runat="server" id="ddlEmailSettingsCheque">
                                                        <option style="margin-left: 13px;">DO NOT Send Confirmation email</option>
                                                        <option  selected="selected">Send Confirmation email</option>
                                                      <%--  <option>Email Address below</option>--%>
                                                    </select>
                                                    <!-- <input id="txtOtherEmail2" runat="server" name="EmailOthers1"  style="visibility:hidden; margin:15px 0px 0px 163px; " maxlength="50"  type="text" value="Others"/> -->   <div class="cl">
                                                        &nbsp;</div>
                                                </div>
                                        <div class="row row-field">
                                                    <label style="font-style:italic">
                                                        Name to be billed</label> </div>
                                                 
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>First Name</label>
                                                    <input  runat="server" class="field field-text large" id="txtFirstName2" type="text" />
                                                  
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Last Name
                                                    </label>
                                                    <input  id="txtLastName2" class="field field-text large" runat="server" type="text" />
                                                   
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Company Name</label>
                                                    <input  id="txtCompany2" runat="server" class="field field-text large" type="text" />
                                                  <div style="float:left;margin-left: 173px;">To appear on printed materials</div>
                                                </div>
                                                 <div style="display:none"  class="row row-field">
                                                    <label>
                                                        Have you participated before?</label>
                                                    <select  class="field field-select large" runat="server"
                                                            id="selPart" onchange="javascript:year_visible('selPart','divYear')">
                                                            <option value="No" selected="selected">No</option>
                                                            <option value="Yes">Yes</option>
                                                        </select>
                                                        <div style="display:none" id="divYear"><span class="req">*</span>
                                                    <label style="margin-left:5px">
                                                        Year</label>
                                                    <select  class="field field-select large" runat="server"
                                                            id="selYear" >
                                                              <option value="0" selected="selected">Select</option>
                                                                <option value="2014" >2014</option>
                                                            <option value="2013" >2013</option>
                                                            <option value="2012" >2012</option>
                                                            <option value="2011" >2011</option>
                                                            <option value="2010" >2010</option>
                                                            <option value="2009" >2009</option>
<option value="2008" >2008</option><option value="2007" >2007</option><option value="2006" >2006</option><option value="2005" >2005</option>
                                                            <option value="2004" >2004</option>
                                                              <option value="2003" >2003</option>
                                                                <option value="2002" >2002</option>
                                                                  <option value="2001" >2001</option>
                                                                    <option value="2000" >2000</option>
                                                        </select></div>
                                                </div>
                                                <div style="display:none" class="row row-field">
                                                    <label>
                                                        Title</label>
                                                    <input name="StreetAddress3" class="field field-text large" maxlength="20" runat="server"
                                                        id="txtTitles" type="text" />
                                                   
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Email</label>
                                                    <input class="field field-text large" id="txtEmail2" runat="server" maxlength="128" type="text" />
                                                   
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Phone</label>
                                                    <input  class="field field-text small" id="txtPhone2" runat="server"
                                                        maxlength="15" type="text" />
                                                   <label>
                                                        Ext</label>
                                                    <input  class="field field-text xsmall" id="txtExt2" runat="server" type="text"
                                                        maxlength="6" />
                                                </div>
                                               
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Address</label>
                                                    <input class="field field-text large" id="txtAddress2" runat="server" maxlength="30" type="text" />
                                                  
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        Address 2</label>
                                                    <input class="field field-text large" id="txtAddress21" maxlength="15" runat="server" type="text" />
                                                    
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Country</label>
                                                    <asp:Panel ID="pnlCountry2" runat="server">
                                                        <select  class="field field-select large" runat="server"
                                                            id="ddlCountry2" onchange="javascript: return state_visible('ddlCountry2','txtCountry2','txtState2')">
                                                            <option value="USA" selected="selected">USA</option>
                                                            <option value="Other">Other</option>
                                                        </select></asp:Panel>
                                                   
                                                        <input id="txtCountry2" maxlength="20" runat="server" class="field field-text"
                                                            style="display: none;" type="text" onfocus="clearText('txtCountry2')"
                                                            onblur="restoretext('txtCountry2')" value="Country" />
                                                   
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>City:</label>
                                                    <input  id="txtCity2" runat="server" maxlength="30" class="field field-text large"
                                                        type="text" />
                                                </div>
                                              
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>State:</label>
                                                    <asp:Panel ID="pnlState2" runat="server">
                                                     
                                                            <select  class="field field-select large" id="ddlState3" runat="server">
                                                                <option selected="selected">Select State</option>
                                                                <option>AL</option>
                                                                <option>AK</option>
                                                                <option>AZ</option>
                                                                <option>AR</option>
                                                                <option>CA</option>
                                                                <option>CO</option>
                                                                <option>CT</option>
                                                                <option>DC</option>
                                                                <option>DE</option>
                                                                <option>FL</option>
                                                                <option>GA</option>
                                                                <option>HI</option>
                                                                <option>ID</option>
                                                                <option>IL</option>
                                                                <option>IN</option>
                                                                <option>IA</option>
                                                                <option>KS</option>
                                                                <option>KY</option>
                                                                <option>LA</option>
                                                                <option>ME</option>
                                                                <option>MD</option>
                                                                <option>MA</option>
                                                                <option>MI</option>
                                                                <option>MN</option>
                                                                <option>MS</option>
                                                                <option>MO</option>
                                                                <option>MT</option>
                                                                <option>NE</option>
                                                                <option>NV</option>
                                                                <option>NH</option>
                                                                <option>NJ</option>
                                                                <option>NM</option>
                                                                <option>NY</option>
                                                                <option>NC</option>
                                                                <option>ND</option>
                                                                <option>OH</option>
                                                                <option>OK</option>
                                                                <option>OR</option>
                                                                <option>PA</option>
                                                                <option>RI</option>
                                                                <option>SC</option>
                                                                <option>SD</option>
                                                                <option>TN</option>
                                                                <option>TX</option>
                                                                <option>UT</option>
                                                                <option>VT</option>
                                                                <option>VA</option>
                                                                <option>WA</option>
                                                                <option>WV</option>
                                                                <option>WI</option>
                                                                <option>WY</option>
                                                            </select>
                                                      
                                                    </asp:Panel>
                                                   
                                                      
                                                            <input type="text" style="display:none;" runat="server" id="txtState2" maxlength="20"  class="field field-text" />
                                                      
                                                
                                                </div> 
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Zip/Postal Code:</label>
                                                    <input runat="server"  class="field field-text large" maxlength="12"
                                                        id="txtZip2" type="text" />
                                                   
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        Please state any dietary restrictions or physical impairments that we should be made aware of:</label>
                                                    <textarea rows="3" cols="50" runat="server"  class="field field-text large"  id="txtAware" />
                                                 
                                                </div>
                                        <div class="row row-field">
                                                    <label>
                                                        WBC Contact</label>
                                                    <input name="StreetAddress" class="field field-text large"  runat="server"
                                                        id="txtWBCS" type="text">
                                                   
                                                </div>
                                               <div style="display:none" class="row row-indent">
                                                 
                                                    
                                                    For tax purposes, indicate the individual or organization responsible for the donation.</p>

                                                </div>
                                                <div style="display:none" class="row row-field">
                                                  <label>Indicate the individual listed above</label>
                                                    <input class="field field-radio" id="rdIndividual" type="radio" runat="server" value="YES" name="rdIndividual"
                                                        onclick="showIndOrgTxtBox('YES','Ind');" />
                                                  
                                                </div>
                                                <div style="display:none" class="row row-field">
                                                  <label>Indicate the organization listed above</label>
                                                    <input class="field field-radio" id="rdOrganization" type="radio" runat="server" value="YES" name="rdIndividual"
                                                        onclick="showIndOrgTxtBox('YES','Org');" />
                                                  
                                                </div>
                                                <div style="display:none" class="row row-field">
                                                 <label>Other</label>
                                                    <input class="field field-radio" id="rdOther" type="radio" name="rdIndividual" runat="server" value="YES" onclick="showIndOrgTxtBox('YES','Other');" />
                                                       
                                                </div>
                                                <div style="display:none" class="row row-field" id="divIndOrg" style="visibility: hidden;">
                                                    <label> <span class="req">*</span>Individual or Organization responsible </label>
                                                    <asp:TextBox ID="txtIndOrg" Width="225" runat="server" class="field field-text" />
                                                </div>
                                                <div class="row row-button">
                                                  
                                                        <asp:Button ID="btnChequeEdit" CssClass="bullet bullet-back small left" OnClick="btnChequeBack_Click" runat="server"
                                                            Text="Edit Attendees" />
                                                   
                                                        <asp:Button ID="btnChequeNext" CssClass="bullet bullet-forward small right" OnClientClick="javascript:return validateAttende2();"
                                                            OnClick="btnChequeNext_Click" runat="server" Text="Confirm" />
                                                   
                                                </div>
                                          
                                       
                                    </asp:View>
                                    <asp:View ID="view4" runat="server">
                                     
                                            <div class="hdngrow">
                                                <span class="reqHdng">*Required</span>
                                                <h1>
                                                    Contributor Code</h1>
                                            </div>

                                            
       
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Contributor Code</label>
                                                    <input  runat="server" class="field field-text large" id="txtContributorCode" type="text" />
                                                  
                                                </div>


                                                <div class="row row-button">
                                                  
                                                        <asp:Button ID="btnPromoEdit" CssClass="bullet bullet-back small left" OnClick="btnPromoBack_Click" runat="server"
                                                            Text="Edit Attendees" />
                                                   
                                                        <asp:Button ID="btnPromoNext" CssClass="bullet bullet-forward small right" OnClientClick="javascript:return validateContributorCode();"
                                                            OnClick="btnPromoNext_Click" runat="server" Text="Confirm" />
                                                   
                                                </div>
                                          
                                       
                                    </asp:View>
                                </asp:multiview>
</div>
<div id="divAdmin" class="mrgnLf" runat="server">
    <a href="BO/BoIndex.aspx">BO Home</a>&nbsp;&nbsp; |&nbsp;&nbsp;
    <asp:linkbutton id="LinkButton1" runat="server" onclick="lnkLogOut_Click">Logout</asp:linkbutton>
</div>
</form>
<% Response.WriteFile("inc.footer.aspx"); %>