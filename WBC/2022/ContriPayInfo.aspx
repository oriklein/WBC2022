<%@ Page Language="C#" AutoEventWireup="true" Inherits="ContriPayInfo" CodeFile="ContriPayInfo.aspx.cs" %>

<% Response.WriteFile("inc.header2.aspx"); %>
<link id="sidebar" href="Jscript/Sidebar.js" />
<script language="javascript" type="text/javascript" src="Jscript/CreditCard.js"></script>
<script language="javascript" type="text/javascript">
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
        else if (ddlCard.options[ddlCard.selectedIndex].text == "Check or Wire Transfer") {
            document.getElementById("dvCheck").style.visibility = 'visible';
            document.getElementById("dvCreditCard").style.visibility = 'hidden';
        }
    }
    // For Expiry Year - Raghav
    function validateExp() {
        var d1 = new Date();
        var month = document.getElementById("ddlExpirationMonth");
        //    alert(month.options[month.options.selectedIndex].innerText);
        var yearexp = document.getElementById("ddlExpirationYear");
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
        if (document.getElementById("ddlCreditCardType").options[document.getElementById("ddlCreditCardType").selectedIndex].text == "- select a payment option -") {
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
        var year = document.getElementById("ddlExpirationYear");
        if (year.selectedIndex == 0) {
            alert("Please Select Credit Card Expiry Year");
            year.focus();
            return false;
        }




        var myDate = new Date();
        var year = document.getElementById("ddlExpirationYear");
        var y = year.options[year.options.selectedIndex].innerText;
        var month = document.getElementById("ddlExpirationMonth");
        var m = parseInt(month.options[month.options.selectedIndex].innerText) - 1;
        myDate.setFullYear(y, m, 01);
        var today = new Date();
        if (myDate.getYear() <= today.getYear()) {
            if (myDate.getMonth() < today.getMonth()) {
                alert("The Credit Card has Expired.Please try Again");
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
        if (document.getElementById("txtCompanyName1").value == "") {
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
            var state1 = document.getElementById("ddlState2");
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


    function validateAttende2() {
        if (document.getElementById("txtFirstName2").value == "") {
            alert("Please enter First Name");
            return false;
        }

        if (document.getElementById("txtLastName2").value == "") {
            alert("Please enter Last Name");
            return false;
        }
       
        if (document.getElementById("txtOrg").value == "") {
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
            alert("Please Select the Country");
            return false;
        }
        if (document.getElementById("txtCity2").value == "") {
            alert("Please enter City");
            return false;
        }
        if (country.options[country.selectedIndex].text != "Other") {
            var state1 = document.getElementById("ddlState3");
            if (state1.options[state1.selectedIndex].text == "-Select Option-") {
                alert("Please select the State");
                return false;
            }
        }
        else {
            if (document.getElementById("dvtextState3").value == "") {
                alert("Please enter the State");
                return false;
            }
        }

        if (document.getElementById("txtZip2").value == "") {
            alert("Please enter Zipcode");
            return false;
        }
        if (document.getElementById("chkBill").checked==false) {
            if (document.getElementById("txtBCN").value == "") {
                alert("Please enter Biller Name");
                return false;
            }
            if (document.getElementById("txtBT").value == "") {
                alert("Please enter Biller Title");
                return false;
            }
            if (document.getElementById("txtBC").value == "") {
                alert("Please enter Biller Company");
                return false;
            }
            if (document.getElementById("txtBCA").value == "") {
                alert("Please enter Biller Address");
                return false;
            }
            if (document.getElementById("txtBCntry").value == "") {
                alert("Please enter Biller Country");
                return false;
            }
            if (document.getElementById("txtBCity").value == "") {
                alert("Please enter Biller City");
                return false;
            }
            if (document.getElementById("txtBSt").value == "") {
                alert("Please enter Biller State");
                return false;
            }
            if (document.getElementById("tztBZip").value == "") {
                alert("Please enter Biller Zip");
                return false;
            }
            if (document.getElementById("txtBCE").value == "") {
                alert("Please enter Biller Email Address");
                return false;
            }
            if (echeck(document.getElementById("txtBCE").value) == false) {
                alert("Biller Email Address is incorrect.");
                return false;
            }
        }
       // return validateDonation();
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
    function state_visible(ddl, dv, txt) {
        var control = document.getElementById(ddl);
        //var control1 = document.getElementById("txt");

        if (control.options[control.selectedIndex].text == "Other") {
            document.getElementById(dv).style.display = 'block';
            document.getElementById(txt).style.display = 'block';

        }
        else {
            document.getElementById(dv).style.display = 'none';
            document.getElementById(txt).style.display = 'none';

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
    function validateExpiry() {
        var myDate = new Date();
        var year = document.getElementById("ddlExpirationYear");
        var y = year.options[year.options.selectedIndex].innerText;
        var month = document.getElementById("ddlExpirationMonth");
        var m = parseInt(month.options[month.options.selectedIndex].innerText) - 1;
        myDate.setFullYear(y, m, 01);
        var today = new Date();
        if (myDate.getYear() <= today.getYear()) {
            if (myDate.getMonth() < today.getMonth()) {
                alert("The Credit Card has Expired.Please try Again");
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
            document.getElementById("txtIndOrg1").value = document.getElementById("txtCompanyName1").value;
        }
        if (chk == 'YES' && chktype == 'Other') {
            document.getElementById("divIndOrg1").style.visibility = "visible";
            //document.getElementById("divIndOrg1").style.display="block";
            document.getElementById("txtIndOrg1").value = "";
        }

    } 
 
</script>
<% Response.WriteFile("inc.header.body1.aspx"); %>
<% Response.WriteFile("inc.header.body2.aspx"); %>
<div class="row row-indent">
    <ul class="menu menu-progress menu-match">
        <li>REGISTRATION</li><li class="active">DETAILS</li><li>CONFIRMATION</li></ul>
    <h2>
        <h2>REGISTRATION DETAILS</h2>
    </h2>
</div>
<%-- include actual code from page --%>
<form id="form1" name="forattendee" runat="server">
<div class="row row-indent" id="dvAttendees" runat="server">
</div>
<div runat="server" visible="false" class="row row-field">
    <label>
        <span class="req">*</span>I will pay by :</label>
    <asp:dropdownlist id="ddlCardType" runat="server" cssclass="field field-select large"
        autopostback="true" onselectedindexchanged="ddlCardType_SelectedIndexChanged">
                                        <asp:ListItem Value="0">-Select a Payment Option-</asp:ListItem>
                                        <asp:ListItem Value="1">Credit Card</asp:ListItem>
                                        <asp:ListItem Value="2">Check or Wire Transfer</asp:ListItem>
                                    </asp:dropdownlist>
</div>
<asp:multiview id="paymentView" runat="server">
                                    <asp:View ID="view1" runat="server">
                                        &nbsp;&nbsp;</asp:View>
                                    <asp:View ID="View2" runat="server">
                                    
                                        <div class="row row-indent">
                                              
                                                <h1>
                                                    Credit Card Information</h1>
                                            </div>
                                       
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Credit Card Type
                                                    </label>
                                                    <select name="SelRRegarding4" class="field field-select large" runat="server" id="ddlCreditCardType">
                                                        <option selected="selected">- select a payment option -</option>
                                                        <option value="Visa">Visa</option>
                                                        <option value="Master">Master Card</option>
                                                        <option value="Amex">American Express</option>
                                                    </select>
                                                   
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Credit Card Number</label>
                                                    <input name="StreetAddress4" class="field field-text large" maxlength="16" runat="server" id="txtCreditCardNo"
                                                        type="text" />
                                                   
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Security Code ( CVV )</label>
                                                    <input name="StreetAddress5" class="field field-text xsmall" runat="server" id="txtSecurityCode"
                                                        type="text" />
                                                  
                                               
                                                    <label>
                                                        <span class="req">*</span>Expiration</label>
                                                    <select class="field field-select large" id="ddlExpirationMonth" runat="server" 
                                                        onchange="javascript:return validateExpiry();">
                                                        <option selected="selected" value="Select">-Select-</option>
                                                        <option value="01">01</option>
                                                        <option value="02">02</option>
                                                        <option value="03">03</option>
                                                        <option value="04">04</option>
                                                        <option value="05">05</option>
                                                        <option value="06">06</option>
                                                        <option value="07">07</option>
                                                        <option value="08">08</option>
                                                        <option value="09">09</option>
                                                        <option value="10">10</option>
                                                        <option value="11">11</option>
                                                        <option value="12">12</option>
                                                    </select>
                                                    <select class="field field-select large" runat="server" id="ddlExpirationYear"
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
                                                 <div class="row row-indent">
                                              
                                                <h1>
                                                    Credit Card Holder information</h1>
                                            </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>First Name</label>
                                                    <input name="StreetAddress" class="field field-text large" runat="server" maxlength="30"
                                                        id="txtFirstName1" type="text" />
                                                    
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Last Name</label>
                                                    <input name="StreetAddress" class="field field-text large" maxlength="30" runat="server"
                                                        id="txtLastName1" type="text" />
                                                  
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Sponsor Name as it should appear on the Program</label>
                                                    <input name="StreetAddress3" class="field field-text large" maxlength="128" runat="server"
                                                        id="txtCompanyName1" type="text" />
                                                   
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        Title</label>
                                                    <input name="StreetAddress3" class="field field-text large" runat="server" maxlength="20"
                                                        id="txtTitle1" type="text" />
                                                   
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Email</label>
                                                    <input name="StreetAddress" class="field field-text large" runat="server" maxlength="128"
                                                        id="txtEmail1" type="text" />
                                                  
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Phone</label>
                                                    <input  class="field field-text small" id="txtPhone1" maxlength="15"
                                                        runat="server" type="text" />
                                                  <label>
                                                        Extention</label>
                                                    <input  class="field field-text xsmall" id="txtExt1" maxlength="6" runat="server"
                                                        type="text" />
                                                </div>
                                               
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Address</label>
                                                    <input name="StreetAddress" class="field field-text large" runat="server" maxlength="30"
                                                        id="txtAddress1" type="text" />
                                                  
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        Address 2</label>
                                                    <input name="StreetAddress3" class="field field-text large" runat="server" maxlength="30"
                                                        id="txtAddress21" type="text" />
                                                
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Country</label>
                                                    <select name="SelRRegarding" onchange="javascript: state_visible('ddlCountry1','txtCountry1','txtState1');"
                                                         class="field field-select large" runat="server"
                                                        id="ddlCountry1">
                                                        <option value="USA">USA</option>
                                                        <option value="Other">Other</option>
                                                    </select>
                                                    <input id="txtCountry1" class="field field-text" maxlength="20" runat="server" style="display: none;" type="text" value="Country"
                                                        onfocus="clearText('Text2')" onblur="restoretext('Text2')" />
                                                  
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>City</label>
                                                    <input class="field field-text large" id="txtCity1" runat="server" maxlength="30" 
                                                        type="text" />
                                                   
                                                </div>
                                                  <div class="row row-field">                                              
                                                        <label>
                                                            <span class="req">*</span>State</label>
                                                      
                                                            <select id="ddlState2" class="field field-select large" runat="server">
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
                                                      
                                                      
                                                            <input type="text" style="display:none;" class="field field-text" maxlength="20" runat="server" id="txtState1" />
                                                      
                                                  
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Zip/Postal Code</label>
                                                    <input runat="server" class="field field-text large" id="txtZip1" maxlength="12" type="text"  />
                                                   
                                                </div>
                                                <div style="display:none" class="row row-indent">
                                                       <div class="article article-box article-link">
<h1 class="large">Become a Sohn Partner</h1>
<p>The ideas shared at the Sohn Conference move the market every year...But the most important impact is that of those who have supported the work of the foundation, including speakers and attendees who donate some of their profits from money-making Sohn ideas back to the Sohn Foundation. Thousands of children have been helped and the science of pediatric cancer research, and cancer research in general, has been advanced thanks to the committed supporters of the Sohn Conference Foundation.</p><p>

This year, we’re challenging you to join and become a Sohn Partner: make a bigger impact by linking your Sohn gains to the move forward for the work of the Foundation. By clicking below you are making a non-binding pledge stating your intention to donate some percentage of your gains from the ideas shared at this year’s conference to the Sohn Conference Foundation, and thereby increase the impact of furthering pediatric cancer research.</p>
<p style="font-weight:bold">
  <asp:DropDownList style="margin-right: 5px;margin-top: -5px;" CssClass="field field-select large" ID="ddlCSGP" runat="server">
                     <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                      <asp:ListItem Value="No" selected="true" Text="No"></asp:ListItem></asp:DropDownList> We pledge to become a Sohn Partner</p>
<p>
As thanks, partners will be acknowledged at the conference and you will get a special indicator to wear at the event expressing our appreciation for your support of childrens’ fight against pediatric cancer.</p>


</div>
                                                
                                                
                                             
                                             
                                                   
                                                </div>
                                                <div class="row row-field">
                                                 <label>
                                                     Indicate the organization listed above</label>
                                                    <input id="rdIndividual1" class="field field-radio" type="radio" runat="server" value="YES" name="rdIndividual"
                                                        onclick="showIndOrgTxtBox1('YES','Ind');" />
                                                   
                                                </div>
                                                <div class="row row-field">
                                                 <label>
                                                      Indicate the organization listed above</label>
                                                    <input id="rdOrganization1" class="field field-radio" type="radio" runat="server" value="YES" name="rdIndividual"
                                                        onclick="showIndOrgTxtBox1('YES','Org');" />
                                                  
                                                </div>
                                                <div class="row row-field">
                                                 <label>
                                                     Other</label>
                                                    <input id="rdOther1" type="radio" class="field field-radio" name="rdIndividual" runat="server" value="YES"
                                                        onclick="showIndOrgTxtBox1('YES','Other');" />
                                                </div>
                                                <div class="row row-field" id="divIndOrg1" style="visibility: hidden;">
                                                    <label> <span class="req">*</span>Individual or Organization responsible </label>
                                                    <asp:TextBox class="field field-text large" ID="txtIndOrg1" Width="225" runat="server" />
                                                </div>
                                                 <div  style="display:none" class="row row-indent">
                                                   <h1>NEXT WAVE SOHN</h1>
                                                   </div>
                                                     <div style="display:none" class="row row-field">
                    <label>Will you and your party be attending Next Wave Sohn? [SOLD OUT]</label>
                    <asp:DropDownList CssClass="field field-select large" ID="ddlSohnWave" runat="server">
                     <%--<asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>--%>
                      <asp:ListItem Value="No" Text="No"></asp:ListItem>
                    
                    </asp:DropDownList>
                                                </div>
                                                   <div style="display:none" class="row row-indent">
                                                   <h1>Cocktail Reception</h1>
                                                   </div>
                                                     <div style="display:none" class="row row-field">
                    <label>Will you and your party be attending the cocktail  reception ? </label>
                    <asp:DropDownList CssClass="field field-select large" ID="ddlCCCT" runat="server">
                     <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                      <asp:ListItem Value="No" Text="No"></asp:ListItem>
                    
                    </asp:DropDownList>
                                                </div>
                                                <div class="row row-button">
                                                  
                                                            <asp:Button ID="btnCcBack" runat="server" OnClick="btnEditAttendee_Click" Text="Back"
                                                                CssClass="bullet bullet-back small left" />
                                                       
                                                            <asp:Button ID="btnCcNext" runat="server" Text="Pay Now" CssClass="bullet bullet-forward small right" OnClick="btnNext_Click"
                                                                OnClientClick="javascript:return validate();" />
                                                   
                                        </div>
                                    </asp:View>
                                    <asp:View ID="view3" runat="server">
                                       
                                            <div class="row row-indent">
                                              
                                                
                                            </div>
                                                <div id="divPay" visible="false" runat="server" class="row row-field">
                                                    <label>
                                                        Payment will be made by:
                                                    </label>
                                                 <input class="field field-radio"  type="radio" id="rdCheck" runat="server" name="rdcheckwire" value="Check" checked  />   <label>Check</label>
                                                  <input class="field field-radio" visible="false" type="radio" id="rdWire" runat="server" name="rdcheckwire" value="Wire Transfer" />  <%--<label> Wire Transfer</label>--%>
                                                   <input class="field field-radio" type="radio" id="rdCC" runat="server" name="rdcheckwire" value="CC" />  <label> Credit Card</label>
                                                    <div style="display:none;">
                                                    <asp:RadioButtonList class="field field-select large" ID="rdListCheckWire" runat="server" RepeatDirection="Horizontal"  >
                                                        <asp:ListItem Text="Check" Value="Check"></asp:ListItem>
                                                        <asp:ListItem Text="Wire Transfer" Value="Wire Transfer"></asp:ListItem>
                                                        <asp:ListItem Text="Credit Card" Value="CC"></asp:ListItem>
                                                    </asp:RadioButtonList></div>
                                                  
                                                </div>
                                        <div runat="server" visible="false" class="row row-field">
                                                    <label>
                                                        <span class="req"></span>Send Email Receipt to</label>
                                                    <select name="SelRRegarding4" class="field field-select" runat="server" id="ddlEmailSettingsCheque">
                                                        <option style="margin-left: 13px;">DO NOT Send Confirmation email</option>
                                                        <option selected="selected">Send Confirmation email</option>
                                                      <%--  <option>Email Address below</option>--%>
                                                    </select>
                                                    <!-- <input id="txtOtherEmail2" runat="server" name="EmailOthers1"  style="visibility:hidden; margin:15px 0px 0px 163px; " maxlength="50"  type="text" value="Others"/> -->   <div class="cl">
                                                        &nbsp;</div>
                                                </div>
                                               
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Your First Name</label>
                                                    <input class="field field-text large" runat="server" maxlength="30" id="txtFirstName2" type="text" />
                                                 
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Your Last Name
                                                    </label>
                                                    <input class="field field-text large" id="txtLastName2" maxlength="30" runat="server" type="text" />
                                                 
                                                </div>
                                                <div style="display:none;" class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Company name as it should appear on event collateral</label>
                                                    <input class="field field-text large" id="txtCompany2" maxlength="128" runat="server" type="text" />
                                                 
                                                </div>
                                                <div class="row row-field">
                                                    <label> <span class="req">*</span>
                                                        Company Name</label>
                                                    <input class="field field-text large" id="txtOrg" maxlength="128" runat="server" type="text" />
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
                                                        <div style="display:none" id="divYear">
                                                    <label style="margin-left:5px"><span class="req">*</span>Year</label>
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
                                                    <input name="StreetAddress3" class="field field-text large" runat="server" id="txtTitles"
                                                        maxlength="20" type="text">
                                                  
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Email</label>
                                                    <input class="field field-text large" id="txtEmail2" maxlength="128" runat="server" type="text" />
                                                   
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Phone</label>
                                                    <input  class="field field-text small" id="txtPhone2" runat="server"
                                                        maxlength="15" type="text" />
                                                        <label>
                                                        Extension</label>
                                                    <input class="field field-text xsmall"  id="txtExt2" maxlength="6" runat="server" 
                                                        type="text" />
                                                
                                                </div>
                                               
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Address</label>
                                                    <input class="field field-text large" id="txtAddress2" maxlength="30" runat="server" type="text" />
                                                  
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        Address 2</label>
                                                    <input class="field field-text large" id="txtAddress22" maxlength="15" runat="server" type="text" />
                                                 
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Country</label>
                                             
                                                        <select name="SelRRegarding" onchange="javascript: state_visible('ddlCountry2','txtCountry2','dvtextState3');"
                                                            class="field field-select"  runat="server" id="ddlCountry2">
                                                            <option value="USA" selected="selected">USA</option>
                                                            <option value="Other">Other</option>
                                                        </select>
                                                 
                                                        <input id="txtCountry2"  maxlength="20" style="display:none;" runat="server" class="field field-text small" type="text" value="Country" onfocus="clearText('txtCountry2')"
                                                            onblur="restoretext('txtCountry2')" />
                                                 
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>City</label>
                                                    <input  id="txtCity2" runat="server" maxlength="30" class="field field-text large"
                                                        type="text" />
                                                   
                                                </div>   <div class="row row-field">
                                                   
                                                        <label>
                                                            <span class="req">*</span>State</label>
                                                     
                                                        
                                                                <select class="field field-select large" id="ddlState3"
                                                                    runat="server">
                                                                    <option selected="selected">-Select Option-</option>
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
                                                            
                                                         
                                                                <input class="field field-text" type="text" style="display:none;" runat="server" id="dvtextState3" maxlength="20" />
                                                            
                                                   
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Zip/Postal Code</label>
                                                    <input runat="server" class="field field-text large"  id="txtZip2"
                                                        maxlength="12" type="text" />
                                                 
                                                </div>
                                                 <div style="display:none" class="row row-field">
                                                    <label>
                                                        Please state any dietary restrictions or physical impairments that we should be made aware of:</label>
                                                    <textarea rows="3" cols="50" runat="server"  class="field field-text large"  id="txtAware" />
                                                 
                                                </div>
                                         <div class="row row-field">
                                                    <label>
                                                        Please list your WBC Contact</label>
                                                    <input name="StreetAddress" class="field field-text large"  runat="server"
                                                        id="txtWBCS" type="text">
                                                   
                                                </div>
                                         <div class="row row-field">
                                            <input id="chkBill" type="checkbox" runat="server" />I am the billing contact.  (If you are the billing contact, disregard the next section. If you are not, please fill out so we invoice accordingly).
                                             </div>
                                          <div class="row row-field">
                                               If different from above, 
                                              <ul><li>Address Invoice to:</li></ul>
                                              </div>
                                         <div class="row row-field">
                                                    <label>
                                                        Name</label>
                                                    <input class="field field-text large" id="txtBCN" maxlength="128" runat="server" type="text" />
                                                   
                                                </div>
                                        <div class="row row-field">
                                                    <label>
                                                        Title</label>
                                                    <input class="field field-text large" id="txtBT" maxlength="128" runat="server" type="text" />
                                                   
                                                </div>
                                          <div class="row row-field">
                                                    <label>
                                                        Company</label>
                                                    <input class="field field-text large" id="txtBC" maxlength="128" runat="server" type="text" />
                                                   
                                                </div>
                                         <div class="row row-field">
                                                    <label>
                                                       Address</label>
                                                    <input class="field field-text large" id="txtBCA" maxlength="250" runat="server" type="text" />
                                                   
                                                </div>
                                          <div class="row row-field">
                                                    <label>
                                                       Country</label>
                                                    <input class="field field-text large" id="txtBCntry" maxlength="250" runat="server" type="text" />
                                                   
                                                </div>
                                          <div class="row row-field">
                                                    <label>
                                                       City</label>
                                                    <input class="field field-text large" id="txtBCity" maxlength="250" runat="server" type="text" />
                                                   
                                                </div>
                                          <div class="row row-field">
                                                    <label>
                                                       State</label>
                                                    <input class="field field-text large" id="txtBSt" maxlength="250" runat="server" type="text" />
                                                   
                                                </div>
                                          <div class="row row-field">
                                                    <label>
                                                       Zip</label>
                                                    <input class="field field-text large" id="tztBZip" maxlength="250" runat="server" type="text" />
                                                   
                                                </div>
                                         <div class="row row-field">
                                               
                                              <ul><li>Email Invoice to:</li></ul>
                                              </div>
                                          <div class="row row-field">
                                                    <label>
                                                         Email Address</label>
                                                    <input class="field field-text large" id="txtBCE" maxlength="128" runat="server" type="text" />
                                                   
                                                </div>
                                        <div class="row row-field">
                                                    <label>
                                                        Cc’d Email</label>
                                                    <input class="field field-text large" id="txtCCDE" maxlength="128" runat="server" type="text" />
                                                   
                                                </div>
                                        <div class="row row-field">
                                               
                                              <ul><li>In case of additional billing questions, please contact</li></ul>
                                              </div>
                                        <div style="display:none" class="row row-field">
                                                    <label>
                                                        Billing contact phone</label>
                                                    <input class="field field-text large" id="txtBCP" maxlength="128" runat="server" type="text" />
                                                   
                                                </div>
                                         
                                         <div class="row row-field">
                                                    <label>
                                                        Name</label>
                                                    <input class="field field-text large" id="txtNPI" maxlength="128" runat="server" type="text" />
                                                   
                                                </div>
                                          <div class="row row-field">
                                                    <label>
                                                       Phone</label>
                                                    <input class="field field-text large" id="txtEPP" maxlength="128" runat="server" type="text" />
                                                   
                                                </div>
                                        <div class="row row-field">
                                                    <label>
                                                       Email</label>
                                                    <input class="field field-text large" id="txtEPI" maxlength="128" runat="server" type="text" />
                                                   
                                                </div>
                                       
                                             <div id="divLogo" visible="false" runat="server" class="row row-field">
                    <label>Provided Logo</label>
                    <input class="field field-radio"  type="radio" id="LGNO" runat="server" name="Logo" value="No" checked  />   <label>No</label>
                                                  <input class="field field-radio" type="radio" id="LGYES" runat="server" name="Logo" value="Yes" />  <label> Yes</label>
                                                 
                                                </div>
                                                 
                                                       <div id="divJorn" visible="false" runat="server" class="row row-field">
                    <label> Provided Journal Add </label>
                  
                      <input class="field field-radio"  type="radio" id="rdPJANo" runat="server" name="Journal" value="No" checked  />   <label>No</label>
                                                  <input class="field field-radio" type="radio" id="rdPJAYes" runat="server" name="Journal" value="Yes" />  <label> Yes</label>
                                                 
                    
              
                                                </div>
                                                  <div class="row row-indent">
                                                    <div style="display:none" class="article article-box article-link">
<h1 class="large">Become a Sohn Partner</h1>
<p>The ideas shared at the Sohn Conference move the market every year...But the most important impact is that of those who have supported the work of the foundation, including speakers and attendees who donate some of their profits from money-making Sohn ideas back to the Sohn Foundation. Thousands of children have been helped and the science of pediatric cancer research, and cancer research in general, has been advanced thanks to the committed supporters of the Sohn Conference Foundation.</p><p>

This year, we’re challenging you to join and become a Sohn Partner: make a bigger impact by linking your Sohn gains to the move forward for the work of the Foundation. By clicking below you are making a non-binding pledge stating your intention to donate some percentage of your gains from the ideas shared at this year’s conference to the Sohn Conference Foundation, and thereby increase the impact of furthering pediatric cancer research.</p>
<p style="font-weight:bold">
  <asp:DropDownList style="margin-right: 5px;margin-top: -5px;" CssClass="field field-select large" ID="ddlSGP" runat="server">
                     <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                      <asp:ListItem Value="No" selected="true" Text="No"></asp:ListItem>
                    
                    </asp:DropDownList> We pledge to become a Sohn Partner</p>
<p>
As thanks, partners will be acknowledged at the conference and you will get a special indicator to wear at the event expressing our appreciation for your support of childrens’ fight against pediatric cancer.</p>


</div>
                                               
                                                </div>
                                                <div style="display:none" class="row row-field">
                                                <label>Indicate the individual listed above</label>
                                                    <input id="rdIndividual" class="field field-radio" type="radio" runat="server" value="YES" name="rdIndividual"
                                                        onclick="showIndOrgTxtBox('YES','Ind');" />
                                                   
                                                </div>
                                                <div style="display:none" class="row row-field">
                                                <label>Indicate the organization listed above</label>
                                                    <input id="rdOrganization" class="field field-radio" type="radio" runat="server" value="YES" name="rdIndividual"
                                                        onclick="showIndOrgTxtBox('YES','Org');" />
                                                   
                                                </div>
                                                <div style="display:none" class="row row-field">
                                                <label>Other</label>
                                                    <input id="rdOther" type="radio" class="field field-radio" name="rdIndividual" runat="server" value="YES" onclick="showIndOrgTxtBox('YES','Other');" />
                                                </div>
                                               
                                                <div  class="row row-field" id="divIndOrg" style="visibility: hidden;display:none;">
                                                   <label> <span class="req">*</span>Individual or Organization responsible
                                                    </label><asp:TextBox class="field field-text large" ID="txtIndOrg" Width="225" runat="server" />
                                                </div>
                                               
                                                      
                                                 <div class="row row-button">
                                                 <asp:Button ID="btnBack2" runat="server" OnClick="btnEditAttendee_Click" CssClass="bullet bullet-back small left"
                                                                    Text="Back" />
                                                                    <asp:Button ID="btnNext2" runat="server" OnClientClick="javascript:return validateAttende2();"
                                                                    CssClass="bullet bullet-forward small right" Text="Confirm" OnClick="ContributorInfo_Insert" />
                                                        </div>
                                                   
                                    </asp:View>
                                </asp:multiview>
<div id="divAdmin" class="mrgnLf" runat="server">
    <a href="BO/BoIndex.aspx">BO Home</a>&nbsp;&nbsp; |&nbsp;&nbsp;
    <asp:linkbutton id="LinkButton1" runat="server" onclick="lnkLogOut_Click">Logout</asp:linkbutton>
</div>
</form>
<% Response.WriteFile("inc.footer.aspx"); %>
