<%@ Page Language="C#" AutoEventWireup="true" Inherits="DonorPayInfo" CodeFile="DonorPayInfo.aspx.cs" %>

<% Response.WriteFile("inc.header2.aspx"); %>
<!--Fireworks CS3 Dreamweaver CS3 target.  Created Thu Feb 26 12:20:05 GMT-0500 (Eastern Standard Time) 2009-->
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
    
</script>

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
                alert("Please enter numeric values.");
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
        if (document.getElementById("ddlCreditCardType").options[document.getElementById("ddlCreditCardType").selectedIndex].text == "- select option -") {
            alert("Please Select the CreditCard Type");
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

            if (!IsNumeric(document.getElementById("txtSecurityCode").value))
                return false;
        }
        var year = document.getElementById("ddlExpirationDate");
        if (year.options[year.options.selectedIndex].innerText == "-Select-") {
            alert("Please Select Credit Card Expiry Year");
            year.focus();
            return false;
        }
        var month = document.getElementById("ddlExpirationMonth");
        if (month.options[month.options.selectedIndex].innerText == "-Select-") {
            alert("Please Select Credit Card Expiry Month ");
            month.focus();
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
        if (document.getElementById("txtCompanyName1").value == "") {
            alert("Please enter company name");
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
        if (country.options[country.selectedIndex].text == "-Select-") {

            alert("Please select the Country");
            return false;
        }

        if (country.options[country.selectedIndex].text == "Other") {
            if (document.getElementById("Text2").value == "") {
                alert("please enter Country");
                return false;
            }
            if (document.getElementById("txtState1").value == "") {
                alert("please enter state");
                return false;
            }
        }
        else {
            var state = document.getElementById("ddlState2");
            if (state.options[state.selectedIndex].text == "Select State") {
                alert("Please select the State");
                return false;
            }
        }
        if (document.getElementById("txtCity1").value == "") {
            alert("Please enter City");
            return false;
        }



        if (document.getElementById("txtZip1").value == "") {
            alert("Please enter Zipcode");
            return false;
        }

        //return true;
        return validateDonation1();
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
        if (document.getElementById("txtCompany2").value == "") {
            alert("Please enter Company Name");
            return false;
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
        if (country.options[country.selectedIndex].text == "-Select-") {
            alert("Please Select the Country");
            return false;
        }
        if (country.options[country.selectedIndex].text == "Other") {
            if (document.getElementById("txtCountry2").value == "") {
                alert("please enter Country");
                return false;
            }
            if (document.getElementById("dvtextState3").value == "") {
                alert("please enter state");
                return false;
            }
        }
        else {
            var state = document.getElementById("ddlState3");
            if (state.options[state.selectedIndex].text == "Select State") {
                alert("Please select the State");
                return false;
            }
        }
        if (document.getElementById("Text10").value == "") {
            alert("Please enter City");
            return false;
        }
        if (document.getElementById("txtZip2").value == "") {
            alert("Please enter Zipcode");
            return false;
        }
        //return true;
        return validateDonation();
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
    var tstate = "";
    function state_visible(ddl, dv, txt) {
        var control = document.getElementById(ddl);
        if (control.options[control.selectedIndex].text == "Other") {

            //    document.getElementById(dv).style.visibility='hidden';
            //    document.getElementById(txt).style.visibility='visible';
            //    document.getElementById(country).style.visibility='visible';
            //document.getElementById(dv).style.display = 'none';

            /* document.getElementById(tstate).style.display='none';*/

            document.getElementById(txt).style.display = 'block';
            document.getElementById(dv).style.display = 'block';
        }
        else {

            //    document.getElementById(dv).style.visibility='visible';
            //    document.getElementById(txt).style.visibility='hidden';
            //    document.getElementById(country).style.visibility='hidden';
            // document.getElementById(dv).style.display = 'block';

            /* document.getElementById(tstate).style.display='block';*/

            //document.getElementById(tstate).style
            //document.getElementById(tstate).style.margin='0px 0px 0px 13px';
            document.getElementById(txt).style.display = 'none';
            document.getElementById(dv).style.display = 'none';
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
        var year = document.getElementById("ddlExpirationDate");
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

    //For Donation Letter
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

    //For Donation Letter
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
  
  
 
</script>

<% Response.WriteFile("inc.header.body1.aspx"); %>
<% Response.WriteFile("inc.header.body2.aspx"); %>
<div class="row row-indent">
    <ul class="menu menu-progress menu-match">
        <li>Donation Form </li>
        <li class="active">Payment</li><li>Confirmation</li></ul>
</div>
<%-- include actual code from page --%>
<form id="form1" name="forattendee" runat="server">
<div class="row row-indent">
    <asp:label id="lblStatus" runat="server" forecolor="Red" visible="false"></asp:label>
    <h2>
        Payment</h2>
    <p>
        Review your donation amount. If correct, please provide your payment details.</p>
    <p id="dvAttendees" runat="server">
    </p>
</div>
<div class="row row-field">
    <label>
        <span class="req">*</span>I will pay by :</label>
    <asp:dropdownlist id="ddlCardType" runat="server" cssclass="field field-select large"
        autopostback="true" onselectedindexchanged="ddlCardType_SelectedIndexChanged">
                                        <asp:ListItem Value="0">-Select a Payment Option-</asp:ListItem>
                                        <asp:ListItem Value="1">Credit Card</asp:ListItem>
                                        <asp:ListItem Value="2">Check</asp:ListItem>
                                    </asp:dropdownlist>
</div>
<asp:multiview id="paymentView" runat="server">
                                    <asp:View ID="view1" runat="server">
                                        &nbsp;&nbsp;</asp:View>
                                    <asp:View ID="View2" runat="server">
                                      
                                          <div  class="row row-indent">
                                                
                                                <h1>
                                                    Credit Card Information</h1>
                                            </div>
                                             <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Credit Card Type
                                                    </label>
                                                    <select name="SelRRegarding4" class="field field-select large" runat="server" id="ddlCreditCardType">
                                                        <option selected="selected">- select option -</option>
                                                        <option value="Visa">Visa</option>
                                                        <option value="Master">Master Card</option>
                                                        <option value="Amex">American Express</option>
                                                    </select>
                                                   
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Credit Card Number</label>
                                                    <input name="StreetAddress4" class="field field-text large" runat="server" id="txtCreditCardNo"
                                                        type="text" />
                                                  
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Security Code ( CVV )</label>
                                                    <input name="StreetAddress5" class="field field-text xsmall" runat="server" id="txtSecurityCode"
                                                        type="text" />
                                                 
                                                    <label>
                                                        <span class="req">*</span>Expiration</label>
                                                    <select id="ddlExpirationMonth" runat="server" class="field field-select large"
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
                                                    <select runat="server" id="ddlExpirationDate" class="field field-select large"
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
                                                 <div  class="row row-indent">
                                                
                                                <h1>
                                                    Credit Card Holder Information</h1>
                                            </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>First Name</label>
                                                    <input name="StreetAddress"  class="field field-text large" maxlength="30" runat="server"
                                                        id="txtFirstName1" type="text" />
                                                    
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Last Name</label>
                                                    <input name="StreetAddress"  class="field field-text large" runat="server" maxlength="30"
                                                        id="txtLastName1" type="text" />
                                                 
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Company Name
                                                    </label>
                                                    <input name="StreetAddress3"  class="field field-text large" maxlength="128" runat="server"
                                                        id="txtCompanyName1" type="text" />
                                                   
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        Title</label>
                                                    <input name="StreetAddress3" maxlength="20" class="field field-text large" runat="server"
                                                        id="txtTitle1" type="text" />
                                                    
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Email</label>
                                                    <input name="StreetAddress" class="field field-text large" maxlength="128" runat="server"
                                                        id="txtEmail1" type="text" />
                                                    
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Phone</label>
                                                    <input class="field field-text small"  id="txtPhone1" runat="server"
                                                        maxlength="20" type="text" />
                                                   
                                                    <label>
                                                        Extention</label>
                                                    <input class="field field-text xsmall"  id="txtExt1" runat="server" type="text"
                                                        maxlength="6" />
                                                    
                                                </div>
                                               
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Address</label>
                                                    <input name="StreetAddress" class="field field-text large" runat="server" id="txtAddress1"
                                                        maxlength="30" type="text" />
                                                  
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        Address 2</label>
                                                    <input name="StreetAddress3" class="field field-text large" maxlength="15" runat="server"
                                                        id="txtAddress21" type="text">
                                                   
                                                </div>
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Country</label>
                                                    <select onchange="javascript: state_visible('ddlCountry1','Text2','txtState1');"
                                                        class="field field-select large" runat="server" id="ddlCountry1">
                                                        <option value="">-Select-</option>
                                                        <option value="USA">USA</option>
                                                        <option value="Other">Other</option>
                                                    </select>
                                                    <input id="Text2" maxlength="20" runat="server" style="display: none;" type="text" value="Country" onfocus="clearText('Text2')"
                                                     class="field field-text small"   onblur="restoretext('Text2')" />
                                                
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
                                                      
                                                            <select id="ddlState2" class="field field-select large"
                                                                runat="server">
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
                                                        
                                                      
                                                            <input type="text" style="display: none;"  runat="server"
                                                                maxlength="20" id="txtState1"  class="field field-text small" />
                                                     
                                                    </div>
                                                
                                                <div class="row row-field">
                                                    <label>
                                                        <span class="req">*</span>Zip/Postal Code</label>
                                                    <input runat="server" class="field field-text large" id="txtZip1" type="text" maxlength="12"  />
                                                    
                                                </div>
                                              <%--  <div class="row row-field" style="width: 96%;">
                                                    <span class="req">*</span>Donation acknowledgement letters will be mailed out the
                                                    following the conference.<br />
                                                    <span style="padding: 0px 0px 0px 10px">For tax purposes,kindly indicate the individual
                                                        or organization responsible for the donation.</span>
                                                </div>--%>
                                                   <div class="row row-indent">
                                                    <H2>Donation acknowledgement.</H2>
                                       <p>Your registration for The Womens Bond Club 2015 
                                                    <br />The Sohn Conference Foundation and its mission to fund <br />
                                                    innovative programs for the treatment and cure of pediatric <br />
                                                    cancer. Donation acknowledgement letters will be mailed out the <br />
                                                    following the conference.<br /><br />
                                                    
                                                    For tax purposes, indicate the individual or organization responsible <br />for the donation.</p>
                                                </div>
                                                <div class="row row-field">
                                                <label>Click here to indicate the individual listed above.</label>
                                                    <input id="rdIndividual1" class="field field-radio"   type="radio" runat="server" value="YES" name="rdIndividual"
                                                        onclick="showIndOrgTxtBox1('YES','Ind');" />
                                                   
                                                </div>
                                                <div class="row row-field">
                                                <label>Click here to indicate the organization listed above.</label>
                                                    <input id="rdOrganization1" class="field field-radio" type="radio" runat="server" value="YES" name="rdIndividual"
                                                        onclick="showIndOrgTxtBox1('YES','Org');" />
                                                    
                                                </div>
                                                <div class="row row-field">
                                                <label>Other</label>
                                                    <input id="rdOther1" type="radio" class="field field-radio" name="rdIndividual" runat="server" value="YES"
                                                        onclick="showIndOrgTxtBox1('YES','Other');" />
                                                </div>
                                                <div class="row row-field" id="divIndOrg1" style="visibility: hidden;">
                                                   <label> <span class="req">*</span>Individual or Organization responsible</label>
                                                    <asp:TextBox ID="txtIndOrg1" class="field field-text large" Width="225" runat="server" />
                                                </div>
                                                <%-- <div id="Div2" style="visibility: hidden;" runat="server">
                                                    <input type="text" runat="server" id="Text15" class="field ssmfield" />
                                                </div>--%>
                                                 <div class="row row-button">
                                                            <asp:Button ID="btnCcBack" runat="server" OnClick="btnEditAttendee_Click" Text="Back"
                                                                CssClass="bullet bullet-back small left" />
                                                            <asp:Button ID="btnCcNext" runat="server" Text="Pay Now" CssClass="bullet bullet-forward small right" OnClick="btnNext_Click"
                                                                OnClientClick="javascript:return validate();" />
                                                    </div>
                                              
                                    </asp:View>
   
    <asp:View ID="view3" runat="server">
      
              <div  class="row row-indent">
              
                <h1>
                    Payment Information</h1>
            </div>
              <div class="row row-field">
                                                    <label>
                                                        Payment will be made by:
                                                    </label>
                                                   <input type="radio" id="rdCheck" class="field field-radio" runat="server" name="rdcheckwire" value="Check" checked  /><label> Check</label>
                                                 <input visible="false" type="radio" id="rdWire" class="field field-radio"  runat="server" name="rdcheckwire" value="Wire Transfer" /><%-- <label>Wire Transfer</label>--%>
                                                    <input type="radio" id="rdCC" class="field field-radio" runat="server" name="rdcheckwire" value="CC" /> <label>Credit Card</label>
                                                  
                                                    <div style="display:none;">
                                                    <asp:RadioButtonList ID="rdListCheckWire" runat="server" RepeatDirection="Horizontal"  >
                                                        <asp:ListItem Text="Check" Value="Check"></asp:ListItem>
                                                        <%--<asp:ListItem Text="Wire Transfer" Value="Wire Transfer"></asp:ListItem>--%>
                                                    </asp:RadioButtonList></div>
                                                  
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
                    <label>
                        <span class="req">*</span>First Name</label>
                    <input class="field field-text large" runat="server" id="txtFirstName2" maxlength="30" type="text" />
                  
                </div>
                <div class="row row-field">
                    <label>
                        <span class="req">*</span>Last Name
                    </label>
                    <input class="field field-text large" id="txtLastName2" runat="server" maxlength="30" type="text" />
                 
                </div>
                <div class="row row-field">
                    <label>
                        <span class="req">*</span>Company Name</label>
                    <input class="field field-text large" id="txtCompany2" runat="server" maxlength="128" type="text" />
                  
                </div>
                <div style="display:none" class="row row-field">
                    <label>
                        Title</label>
                    <input name="StreetAddress3" class="field field-text large" maxlength="20" runat="server"
                        id="txtTitles" type="text">
                  
                </div>
                <div class="row row-field">
                    <label>
                        <span class="req">*</span>Email</label>
                    <input class="field field-text large" id="txtEmail2" maxlength="128" runat="server" type="text" />
                  
                </div>
                <div class="row row-field">
                    <label>
                        <span class="req">*</span>Phone</label>
                    <input class="field field-text small"  id="txtPhone2" runat="server"
                        maxlength="20" type="text" />
                  
                    <label>
                        Extention</label>
                    <input class="field field-text xsmall" style="margin-left: 13px;" id="txtExt2" runat="server" type="text"
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
                    <input class="field field-text large" id="txtAddress22" runat="server" maxlength="15" type="text" />
                   
                </div>
                <div class="row row-field">
                    <label>
                        <span class="req">*</span>Country</label>
                    <select name="SelRRegarding" onchange="javascript: state_visible('ddlCountry2','txtCountry2','dvtextState3');"
                        class="field field-select large" runat="server" id="ddlCountry2">
                        <option selected="selected">-Select-</option>
                        <option value="USA">USA</option>
                        <option value="Other">Other</option>
                    </select>
                    <input id="txtCountry2" class="field field-text small" maxlength="20" runat="server" style="display: none;" type="text" value="Country" onfocus="clearText('txtCountry2')"
                        onblur="restoretext('txtCountry2')" />
                </div>
                <div class="row row-field">
                    <label>
                        <span class="req">*</span>City</label>
                    <input class="field field-text large" id="Text10" runat="server" maxlength="30" 
                        type="text" />
                    <div class="cl">
                        &nbsp;</div>
                </div>
                        <div class="row row-field">
                    
                        <label>
                            <span class="req">*</span>State</label>
                     
                            <select class="field field-text large" id="ddlState3"
                                runat="server">
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
                      
                     
                            <input style="display:none;"  type="text" runat="server" maxlength="20" id="dvtextState3"
                                class="field field-text small" />
                         
                      
                    
                </div>
                <div class="row row-field">
                    <label>
                        <span class="req">*</span>Zip/Postal Code</label>
                    <input runat="server" class="field field-text large" id="txtZip2"
                        maxlength="12" type="text" />
                    
                </div>
               <%--  <div class="row row-field">
                    <span class="req">*</span>Donation acknowledgement letters will be mailed out the
                    following the conference.<br />
                    <span style="padding: 0px 0px 0px 10px">For tax purposes,kindly indicate the individual
                        or organization responsible for the donation.</span>
                </div>--%>
                    <div class="row row-indent">
                                                    <H2>Donation acknowledgement.</H2>
                                                <p>
                                                    
                                                    For tax purposes, indicate the individual or organization responsible <br />for the donation.</p>
                                                </div>
                <div class="row row-field">
                <label>Click here to indicate the individual listed above.</label>
                    <input id="rdIndividual" class="field field-radio" type="radio" runat="server" value="YES" name="rdIndividual"
                        onclick="showIndOrgTxtBox('YES','Ind');" />
                   
                </div>
                <div class="row row-field">
                <label>Click here to indicate the organization listed above.</label>
                    <input id="rdOrganization" class="field field-radio" type="radio" runat="server" value="YES" name="rdIndividual"
                        onclick="showIndOrgTxtBox('YES','Org');" />
                   
                </div>
                <div class="row row-field">
                <label>Other</label>
                    <input id="rdOther" type="radio" class="field field-radio" name="rdIndividual" runat="server" value="YES" onclick="showIndOrgTxtBox('YES','Other');" />
                </div>
                <div class="row row-field" id="divIndOrg" style="visibility: hidden;">
                    <label><span class="req">*</span>Individual or Organization responsible</label>
                    <asp:TextBox ID="txtIndOrg" class="field field-text large" Width="225" runat="server" />
                </div>
                 <div class="row row-button">
                                <asp:Button ID="btnBack2" runat="server" OnClick="btnEditAttendee_Click" CssClass="bullet bullet-back small left"
                                    Text="Back" />
                                <asp:Button ID="btnNext2" runat="server" OnClientClick="javascript:return validateAttende2();"
                                    CssClass="bullet bullet-forward small right" Text="Confirm" OnClick="ContributorInfo_Insert" />
                        </div>
                    
    </asp:View>
    </asp:multiview>
</form>
<% Response.WriteFile("inc.footer.aspx"); %>